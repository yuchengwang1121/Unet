#include "xil_printf.h"
  #include "xparameters.h"
  #include "xaxicdma.h"
  #include "xil_cache.h"
  #include "xil_io.h"

  #define PL_BRAM_Addr 0xC0000000
  #define PL_BRAM_Addr2 0xC2000000
  #define PL_BRAM_Addr3 0x45800000
  #define BUFF_LEN  3136  //28*28*4

  XAxiCdma_Config *axi_cdma_cfg;
  XAxiCdma axi_cdma;
  static int SourceAddr  = 0x11000000;
  static int DestAddr    = 0x12000000;

  int main()
  {
  //    init_platform();
    print("Initial start......\n\r");

    int Status;
    int *SrcPtr;
    int *DestPtr;

    SrcPtr = (int*)SourceAddr;
    DestPtr = (int*)DestAddr;

    static int Array_0[28][28];
    int i,j;
    for (i=0;i<28;i++){
    	for (j=0;j<28;j++){
    		Array_0[i][j] = (i*28+j);
    	}
    }

    for (i=0;i<28;i++){
    	for (j=0;j<28;j++){
    		SrcPtr[i*28+j] = Array_0[i][j];
    		DestPtr[i*28+j] = 0;
    	}
    }

    printf("Original SRC_DDR DATA\n\r");
	for(i=0;i<28*1;i++){
		printf("%d  %d at %x\n\r",i,SrcPtr[i],&SrcPtr[i]);
	}
	printf("-------------------------------------------------\n\r");
	printf("Original DEST_DDR DATA\n\r");
	for(i=0;i<28*1;i++){
		printf("%d  %d at %x\n\r",i,DestPtr[i],&DestPtr[i]);
	}
    int *tx_buffer = (int *) SrcPtr;
    int *rx_buffer1 = (int *) PL_BRAM_Addr3;
    u32 *tx_buffer2 = (u32 *) PL_BRAM_Addr3;
    u32 *rx_buffer3 = (u32 *) DestAddr;

    // Set up the AXI CDMA
    for (i=0;i<28;i++){
        for (j=0;j<28;j++){
        	SrcPtr[i*28+j] = 999;     // 1100_0000
        }
    }

    printf("--Set up the AXI CDMA from DDR to BRAM3\n\r");
    axi_cdma_cfg = XAxiCdma_LookupConfig(XPAR_AXICDMA_0_DEVICE_ID);
    if (!axi_cdma_cfg) {
        printf("AXAxiCdma_LookupConfig failed\n\r");
    }

    Status = XAxiCdma_CfgInitialize(&axi_cdma, axi_cdma_cfg, axi_cdma_cfg->BaseAddress);
    if (Status == XST_SUCCESS ){
        printf("XAxiCdma_CfgInitialize succeed\n\r");
    }
    printf("--Disable Interrupt of AXI CDMA\n\r");
        XAxiCdma_IntrDisable(&axi_cdma, XAXICDMA_XR_IRQ_ALL_MASK);

    if (XAxiCdma_IsBusy(&axi_cdma)) {
    printf("AXI CDMA is busy...\n\r");
    while (XAxiCdma_IsBusy(&axi_cdma));
    }


	Xil_DCacheFlush();
	Status = XAxiCdma_SimpleTransfer(
		&axi_cdma,
		(u32) tx_buffer,
		(u32) rx_buffer1,
		BUFF_LEN,
		NULL,
		NULL);
	Xil_DCacheFlush();

    printf("transaction from DDR to BRAM1 is done\n\r");

  // Set up the AXI CDMA
	printf("--Set up the AXI CDMA from BRAM3 to DDR\n\r");
	axi_cdma_cfg = XAxiCdma_LookupConfig(XPAR_AXICDMA_0_DEVICE_ID);
	if (!axi_cdma_cfg) {
    	printf("AXAxiCdma_LookupConfig failed\n\r");
	}

    Status = XAxiCdma_CfgInitialize(&axi_cdma, axi_cdma_cfg, axi_cdma_cfg->BaseAddress);
    if (Status == XST_SUCCESS ){
        printf("XAxiCdma_CfgInitialize succeed\n\r");
    }
    printf("--Disable Interrupt of AXI CDMA\n\r");
    XAxiCdma_IntrDisable(&axi_cdma, XAXICDMA_XR_IRQ_ALL_MASK);

    if (XAxiCdma_IsBusy(&axi_cdma)) {
    printf("AXI CDMA is busy...\n\r");
    while (XAxiCdma_IsBusy(&axi_cdma));
    }


	Xil_DCacheFlush();
	Status = XAxiCdma_SimpleTransfer(
		&axi_cdma,
		(u32) tx_buffer2,
		(u32) rx_buffer3,
		BUFF_LEN/28,
		NULL,
		NULL);
	Xil_DCacheFlush();

	printf("transaction from BRAM1 to DDR is done\n\r");

	for(i=0;i<28;i++){
	    if (i == 0){
    	    printf("Data transfer from BRAM3 to DEST_DDR[0]~[27]\n\r");
            }
	    printf("%d   %d at %x\n\r",i,rx_buffer3[i],&rx_buffer3[i]);
	}

    return 0;
  }
