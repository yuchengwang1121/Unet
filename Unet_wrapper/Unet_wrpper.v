  module Unet_Wrapper (
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
  (* x_interface_parameter = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF M_AXI:M_AXI_CTRL, ASSOCIATED_RESET ARESETN, FREQ_HZ 6.66667e+07, PHASE 0.000, CLK_DOMAIN sys_top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
  input ACLK,
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
  (* x_interface_parameter = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input ARESETN,
  // <-----------------Port for Base_address-----------------> 
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *)
  output reg  [31:0]Unet_M00_AXI_araddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *)
  output reg  [2:0] Unet_M00_AXI_arprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *)
  input             Unet_M00_AXI_arready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *)
  output reg        Unet_M00_AXI_arvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *)
  output reg  [31:0]Unet_M00_AXI_awaddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *)
  output reg  [2:0] Unet_M00_AXI_awprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *)
  input             Unet_M00_AXI_awready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *)
  output reg        Unet_M00_AXI_awvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *)
  output reg        Unet_M00_AXI_bready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *)
  input [1:0]       Unet_M00_AXI_bresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *)
  input             Unet_M00_AXI_bvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *)
  input [31:0]      Unet_M00_AXI_rdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *)
  output reg        Unet_M00_AXI_rready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *)
  input [1:0]       Unet_M00_AXI_rresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *)
  input             Unet_M00_AXI_rvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *)
  output reg  [31:0]Unet_M00_AXI_wdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *)
  input             Unet_M00_AXI_wready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *)
  output reg  [3:0] Unet_M00_AXI_wstrb,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *)
  output reg        Unet_M00_AXI_wvalid,

  // <-----------------Port for Helper-----------------> 
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARADDR" *)
  output reg  [31:0]Unet_M01_AXI_araddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARBURST" *)
  output reg  [1:0]Unet_M01_AXI_arburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARCACHE" *)
  output reg  [3:0]Unet_M01_AXI_arcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARID" *)
  output reg  [11:0]Unet_M01_AXI_arid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLEN" *)
  output reg  [7:0]Unet_M01_AXI_arlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARLOCK" *)
  output reg  [0:0]Unet_M01_AXI_arlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARPROT" *)
  output reg  [2:0]Unet_M01_AXI_arprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARQOS" *)
  output reg  [3:0]Unet_M01_AXI_arqos,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREADY" *)
  input Unet_M01_AXI_arready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARREGION" *)
  output reg  [3:0]Unet_M01_AXI_arregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARSIZE" *)
  output reg  [2:0]Unet_M01_AXI_arsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI ARVALID" *)
  output reg  Unet_M01_AXI_arvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWADDR" *)
  output reg  [31:0]Unet_M01_AXI_awaddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWBURST" *)
  output reg  [1:0]Unet_M01_AXI_awburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWCACHE" *)
  output reg  [3:0]Unet_M01_AXI_awcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWID" *)
  output reg  [11:0]Unet_M01_AXI_awid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLEN" *)
  output reg  [7:0]Unet_M01_AXI_awlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWLOCK" *)
  output reg  [0:0]Unet_M01_AXI_awlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWPROT" *)
  output reg  [2:0]Unet_M01_AXI_awprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWQOS" *)
  output reg  [3:0]Unet_M01_AXI_awqos,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREADY" *)
  input Unet_M01_AXI_awready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWREGION" *)
  output reg  [3:0]Unet_M01_AXI_awregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWSIZE" *)
  output reg  [2:0]Unet_M01_AXI_awsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI AWVALID" *)
  output reg  Unet_M01_AXI_awvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BID" *)
  input [11:0]Unet_M01_AXI_bid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BREADY" *)
  output reg  Unet_M01_AXI_bready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BRESP" *)
  input [1:0]Unet_M01_AXI_bresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI BVALID" *)
  input Unet_M01_AXI_bvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RDATA" *)
  input [31:0]Unet_M01_AXI_rdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RID" *)
  input [11:0]Unet_M01_AXI_rid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RLAST" *)
  input Unet_M01_AXI_rlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RREADY" *)
  output reg  Unet_M01_AXI_rready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RRESP" *)
  input [1:0]Unet_M01_AXI_rresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI RVALID" *)
  input Unet_M01_AXI_rvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WDATA" *)
  output reg  [31:0]Unet_M01_AXI_wdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WLAST" *)
  output reg  Unet_M01_AXI_wlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WREADY" *)
  input Unet_M01_AXI_wready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WSTRB" *)
  output reg  [3:0]Unet_M01_AXI_wstrb,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M_AXI WVALID" *)
  output reg  Unet_M01_AXI_wvalid
  );
  
  //parameter for offset
  parameter [15:0] ID_register_offset = 16'h0000; 
  parameter [15:0] CC_register_offset = 16'h3000; 
  parameter [15:0] SP_register_offset = 16'h4000;

  //parameter for FSM
  parameter [2:0] Init     = 3'b000,
                  Trigger  = 3'b001,
                  Check    = 3'b010,
                  Transfer = 3'b011;

  //M0 initialization
  always @(posedge ACLK or posedge ARESETN) begin
    if(!ARESETN)begin
        Unet_M00_AXI_araddr     <= 32'h4580_0000;
        Unet_M00_AXI_arprot     <= 3'b0;
        Unet_M00_AXI_arvalid    <= 1'b0;
        Unet_M00_AXI_awaddr     <= 32'b0;
        Unet_M00_AXI_awprot     <= 3'b0;
        Unet_M00_AXI_awvalid    <= 1'b0;
        Unet_M00_AXI_bready     <= 1'b0;
        Unet_M00_AXI_rready     <= 1'b0;
        Unet_M00_AXI_wdata      <= 32'b0;
        Unet_M00_AXI_wstrb      <= 4'b0;
        Unet_M00_AXI_wvalid     <= 1'b0;
    end
    else begin
        Unet_M00_AXI_araddr     <= Unet_M00_AXI_araddr + 3'd4;
        Unet_M00_AXI_arprot     <= 3'b0;
        Unet_M00_AXI_arvalid    <= 1'b1;
        Unet_M00_AXI_awaddr     <= 32'b0;
        Unet_M00_AXI_awprot     <= 3'b0;
        Unet_M00_AXI_awvalid    <= 1'b0;
        Unet_M00_AXI_bready     <= 1'b0;
        Unet_M00_AXI_rready     <= 1'b1;
        Unet_M00_AXI_wdata      <= 32'b0;
        Unet_M00_AXI_wstrb      <= 4'b0;
        Unet_M00_AXI_wvalid     <= 1'b0;
    end
  end
  
  //read block list for BRAM
  reg [31:0] base_address;
  always @(posedge ACLK or posedge ARESETN) begin
    if(!ARESETN)begin
        base_address <= 32'b0;
    end
    else begin
        base_address <= Unet_M00_AXI_rdata;
    end
  end

  //FSM
  reg [2:0] S_cur, S_next;
  always @(posedge ACLK or posedge ARESETN)begin
    if(!ARESETN) S_cur <= Init;
    else        S_cur <= S_next;
  end

  always @(*)begin
    case(S_cur)
      Init:begin
        S_next <= Trigger;
      end
      Trigger:begin
        S_next <= Check;
      end
      Check:begin
        S_next <= Transfer;
      end
      default:begin   //transfer
        S_next <= Init;
      end
    endcase
  end

  endmodule
