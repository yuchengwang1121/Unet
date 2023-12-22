  module Unet_Wrapper (
  (* x_interface_info = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
  (* x_interface_parameter = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF M_AXI:M_AXI_CTRL, ASSOCIATED_RESET ARESETN, FREQ_HZ 6.66667e+07, PHASE 0.000, CLK_DOMAIN sys_top_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
  input ACLK,
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
  (* x_interface_parameter = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input ARESETN,
  // <-----------------Port for Base_address-----------------> 
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARADDR" *)
  output reg  [31:0]Unet_M00_AXI_araddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARREADY" *)
  input             Unet_M00_AXI_arready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI ARVALID" *)
  output reg        Unet_M00_AXI_arvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RDATA" *)
  input [31:0]      Unet_M00_AXI_rdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RREADY" *)
  output reg        Unet_M00_AXI_rready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RRESP" *)
  input [1:0]       Unet_M00_AXI_rresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M00_AXI RVALID" *)
  input             Unet_M00_AXI_rvalid,

  // <-----------------Port for Helper-----------------> 
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARADDR" *)
  output reg  [31:0]Unet_M01_AXI_araddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARBURST" *)
  output reg  [1:0]Unet_M01_AXI_arburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARCACHE" *)
  output reg  [3:0]Unet_M01_AXI_arcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARID" *)
  output reg  [11:0]Unet_M01_AXI_arid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARLEN" *)
  output reg  [7:0]Unet_M01_AXI_arlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARLOCK" *)
  output reg  Unet_M01_AXI_arlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARPROT" *)
  output reg  [2:0]Unet_M01_AXI_arprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARQOS" *)
  output reg  [3:0]Unet_M01_AXI_arqos,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARREADY" *)
  input Unet_M01_AXI_arready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARREGION" *)
  output reg  [3:0]Unet_M01_AXI_arregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARSIZE" *)
  output reg  [2:0]Unet_M01_AXI_arsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI ARVALID" *)
  output reg  Unet_M01_AXI_arvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWADDR" *)
  output reg  [31:0]Unet_M01_AXI_awaddr,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWBURST" *)
  output reg  [1:0]Unet_M01_AXI_awburst,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWCACHE" *)
  output reg  [3:0]Unet_M01_AXI_awcache,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWID" *)
  output reg  [11:0]Unet_M01_AXI_awid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWLEN" *)
  output reg  [7:0]Unet_M01_AXI_awlen,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWLOCK" *)
  output reg  Unet_M01_AXI_awlock,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWPROT" *)
  output reg  [2:0]Unet_M01_AXI_awprot,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWQOS" *)
  output reg  [3:0]Unet_M01_AXI_awqos,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWREADY" *)
  input Unet_M01_AXI_awready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWREGION" *)
  output reg  [3:0]Unet_M01_AXI_awregion,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWSIZE" *)
  output reg  [2:0]Unet_M01_AXI_awsize,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI AWVALID" *)
  output reg  Unet_M01_AXI_awvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BID" *)
  input [11:0]Unet_M01_AXI_bid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BREADY" *)
  output reg  Unet_M01_AXI_bready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BRESP" *)
  input [1:0]Unet_M01_AXI_bresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI BVALID" *)
  input Unet_M01_AXI_bvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RDATA" *)
  input [31:0]Unet_M01_AXI_rdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RID" *)
  input [11:0]Unet_M01_AXI_rid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RLAST" *)
  input Unet_M01_AXI_rlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RREADY" *)
  output reg  Unet_M01_AXI_rready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RRESP" *)
  input [1:0]Unet_M01_AXI_rresp,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI RVALID" *)
  input Unet_M01_AXI_rvalid,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WDATA" *)
  output reg  [31:0]Unet_M01_AXI_wdata,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WLAST" *)
  output reg  Unet_M01_AXI_wlast,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WREADY" *)
  input Unet_M01_AXI_wready,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WSTRB" *)
  output reg  [3:0]Unet_M01_AXI_wstrb,
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 M01_AXI WVALID" *)
  output reg  Unet_M01_AXI_wvalid
  );
  
  //parameter for offset
  parameter [15:0] ID_register_offset = 16'h0000; 
  parameter [15:0] CC_register_offset = 16'h3000; 
  parameter [15:0] SP_register_offset = 16'h4000;
  parameter [31:0] statusreport_reg   = 32'h1234_5678;

  //parameter for FSM
  parameter [2:0] Init     = 3'b000,
                  Trigger  = 3'b001,
                  Check    = 3'b010,
                  Transfer = 3'b011;

  //Ctrl signals
  wire addr_done;
  wire Trigger_done, Check_done, Trans_done;

  //Crtl signal for M0 araddr
  assign read_done = (Unet_M00_AXI_rvalid && Unet_M00_AXI_rready) && (Unet_M00_AXI_rresp == 2'b00)? 1'b1 : 1'b0;

  //Ctrl signal for FSM changing
  assign Trigger_done = (count == 3'd4)? 1'b1 : 1'b0;
  assign Check_done   = (count == 3'd4)? 1'b1 : 1'b0;
  assign Trans_done   = (count == 3'd7)? 1'b1 : 1'b0;

  //Crtl signal for count
  assign write_done = (Unet_M01_AXI_bvalid && Unet_M01_AXI_bready) && (Unet_M01_AXI_bresp == 2'b00)? 1'b1 : 1'b0;


  // <----------------------base_address---------------------->
  always @(posedge ACLK or posedge ARESETN) begin
    //M0 initialization
    if(!ARESETN)begin
      //Using AR & R channel
      Unet_M00_AXI_araddr     <= 32'h4580_0000;
      Unet_M00_AXI_arvalid    <= 1'b0;
      Unet_M00_AXI_rready     <= 1'b0;
    end
    else begin
      //Using AR & R channel
      Unet_M00_AXI_araddr     <= (read_done)? Unet_M00_AXI_araddr  + 3'd4 : Unet_M00_AXI_araddr;
      Unet_M00_AXI_arvalid    <= 1'b1;
      Unet_M00_AXI_rready     <= 1'b1;
    end
  end
  
  //read block list for BRAM
  reg [31:0] base_address;
  always @(posedge ACLK or posedge ARESETN) begin
    if(!ARESETN)  base_address <= 32'b0;
    else          base_address <= Unet_M00_AXI_rdata;
  end

  // <----------------------FSM---------------------->
  reg [2:0] S_cur, S_next;
  //Changing FSM state from State_next to State_current
  always @(posedge ACLK or posedge ARESETN)begin
    if(!ARESETN)  S_cur <= Init;
    else          S_cur <= S_next;
  end

  //FSM
  always @(*)begin
    case(S_cur)
      Init:begin
        S_next = Trigger;
      end
      Trigger:begin
        if(Trigger_done)  S_next = Check;
        else              S_next = Trigger;
      end
      Check:begin
        if(Check_done)    S_next = Transfer;
        else              S_next = Check;
      end
      default:begin       //transfer
        if(Trans_done)    S_next = Init;
        else              S_next = Transfer;
      end
    endcase
  end

  //Conut the number of command write into prticular place
  reg [2:0] count;
  always @(posedge ACLK or posedge ARESETN) begin
    if (!ARESETN)   count <= 3'b0;   
    else            count <= (write_done)? count + 1'b1 : count;
  end

  // <----------------------Command to helper---------------------->
  
  always @(posedge ACLK or posedge ARESETN) begin
    if (!ARESETN) begin
      //M1 initialization
      Unet_M01_AXI_araddr   <= 32'b0;
      Unet_M01_AXI_arburst  <= 2'b0;
      Unet_M01_AXI_arcache  <= 4'b0;
      Unet_M01_AXI_arid     <= 12'b0;
      Unet_M01_AXI_arlen    <= 8'b0;
      Unet_M01_AXI_arlock   <= 1'b0;
      Unet_M01_AXI_arprot   <= 3'b0;
      Unet_M01_AXI_arqos    <= 4'b0;
      Unet_M01_AXI_arregion <= 4'b0;
      Unet_M01_AXI_arsize   <= 3'b0;
      Unet_M01_AXI_arvalid  <= 1'b0;
      Unet_M01_AXI_rready   <= 1'b0;
      Unet_M01_AXI_awburst  <= 2'b0;
      Unet_M01_AXI_awcache  <= 4'b0;
      Unet_M01_AXI_awid     <= 12'b0;
      Unet_M01_AXI_awlen    <= 8'b0;
      Unet_M01_AXI_awlock   <= 1'b0;
      Unet_M01_AXI_awprot   <= 3'b0;
      Unet_M01_AXI_awqos    <= 4'b0;
      Unet_M01_AXI_awregion <= 4'b0;
      Unet_M01_AXI_awsize   <= 3'b0;
      Unet_M01_AXI_awvalid  <= 1'b0;
      Unet_M01_AXI_bready   <= 1'b0;
      Unet_M01_AXI_wstrb    <= 4'b0;
      Unet_M01_AXI_wvalid   <= 1'b0;
    end else begin
      //Not using AR & R channel
      Unet_M01_AXI_araddr   <= 32'b0;
      Unet_M01_AXI_arburst  <= 2'b0;
      Unet_M01_AXI_arcache  <= 4'b0;
      Unet_M01_AXI_arid     <= 12'b0;
      Unet_M01_AXI_arlen    <= 8'b0;
      Unet_M01_AXI_arlock   <= 1'b0;
      Unet_M01_AXI_arprot   <= 3'b0;
      Unet_M01_AXI_arqos    <= 4'b0;
      Unet_M01_AXI_arregion <= 4'b0;
      Unet_M01_AXI_arsize   <= 3'b0;
      Unet_M01_AXI_arvalid  <= 1'b0;
      Unet_M01_AXI_rready   <= 1'b0;
      
      //Using AW, W & B channel
      Unet_M01_AXI_awburst  <= 2'b0;
      Unet_M01_AXI_awcache  <= 4'b0;
      Unet_M01_AXI_awid     <= 12'b0;
      Unet_M01_AXI_awlen    <= 8'b0;
      Unet_M01_AXI_awlock   <= 1'b0;
      Unet_M01_AXI_awprot   <= 3'b0;
      Unet_M01_AXI_awqos    <= 4'b0;
      Unet_M01_AXI_awregion <= 4'b0;
      Unet_M01_AXI_awsize   <= 3'b0;
      Unet_M01_AXI_awvalid  <= 1'b1;
      Unet_M01_AXI_bready   <= 1'b1;
      Unet_M01_AXI_wstrb    <= 4'b0;
      Unet_M01_AXI_wvalid   <= 1'b1;

      
    end
  end

  always @(posedge ACLK or posedge ARESETN ) begin
    if (!ARESETN) begin
      Unet_M01_AXI_awaddr   <= 32'b0;
      Unet_M01_AXI_wdata    <= 32'b0;
      Unet_M01_AXI_wlast    <= 1'b0;
    end
    else begin
      case(S_cur)
      Trigger:begin
        case (count)
          3'd0: begin             //write opcode into nsc_base_address + SP_register_offset
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset;
            Unet_M01_AXI_wdata    <= 32'h0000_01A4;
          end
          3'd1: begin             //write way into nsc_base_address + SP_register_offset + 4
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd4;
            Unet_M01_AXI_wdata    <= 32'h0000_0100;
          end
          3'd2: begin             //write row_address into nsc_base_address + SP_register_offset + 8
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd8;
            Unet_M01_AXI_wdata    <= 32'h0000_0100;
          end
          3'd3: begin             //write done flag into nsc_base_address + CC_register_offset
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + CC_register_offset;
            Unet_M01_AXI_wdata    <= 32'h0000_0001;
          end
          default: begin           //otherwise                                                                //need check wlast
            Unet_M01_AXI_awaddr   <= 32'h0000_0000;
            Unet_M01_AXI_wdata    <= 32'h0000_0000;
          end
        endcase
      end
      Check:begin
        case (count)
          3'd0: begin             //write opcode into nsc_base_address + SP_register_offset
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset;
            Unet_M01_AXI_wdata    <= 32'h0000_0130;
          end
          3'd1: begin             //write way into nsc_base_address + SP_register_offset + 4
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd4;
            Unet_M01_AXI_wdata    <= 32'h0000_0100;
          end
          3'd2: begin             //write statusreport_reg into nsc_base_address + 8
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + CC_register_offset + 5'd8;
            Unet_M01_AXI_wdata    <= statusreport_reg;
          end
          3'd3: begin             //reset data in statusreport_reg
            Unet_M01_AXI_awaddr   <= statusreport_reg;
            Unet_M01_AXI_wdata    <= 32'h0000_0000;
          end
          3'd4: begin             //write done flag into nsc_base_address + CC_register_offset
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + CC_register_offset;
            Unet_M01_AXI_wdata    <= 32'h0000_0001;
          end
          default: begin           //otherwise
            Unet_M01_AXI_awaddr   <= 32'h0000_0000;
            Unet_M01_AXI_wdata    <= 32'h0000_0000;
          end
        endcase
      end
      Transfer:begin
        case (count)
          3'd0: begin             //write opcode into nsc_base_address + SP_register_offset
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset;
            Unet_M01_AXI_wdata    <= 32'h0000_0338;
          end
          3'd1: begin             //write way into nsc_base_address + SP_register_offset + 4
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd4;
            Unet_M01_AXI_wdata    <= 32'h0000_0100;
          end
          3'd2: begin             //write row_address into nsc_base_address + SP_register_offset + 8
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd8;
            Unet_M01_AXI_wdata    <= 32'h0000_0100;
          end
          3'd3: begin             //write BRAM address into nsc_base_address + SP_register_offset + 12
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd12;
            Unet_M01_AXI_wdata    <= 32'h4581_0000;
          end
          3'd4: begin             //write ECC address into nsc_base_address + SP_register_offset + 16    //need check
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd16;
            Unet_M01_AXI_wdata    <= 32'h0000_0001;
          end
          3'd5: begin             //write ERR address into nsc_base_address + SP_register_offset + 20     //need check
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd20;
            Unet_M01_AXI_wdata    <= 32'h0000_0001;
          end
          3'd6: begin             //write Complete address into nsc_base_address + SP_register_offset + 24
            Unet_M01_AXI_awaddr   <= 32'h43C0_0000 + SP_register_offset + 5'd24;
            Unet_M01_AXI_wdata    <= 32'h0000_0001;
          end
          default: begin          //otherwise
            Unet_M01_AXI_awaddr   <= 32'h0000_0000;
            Unet_M01_AXI_wdata    <= 32'h0000_0000;
          end
        endcase
      end
      default:begin
        Unet_M01_AXI_awaddr   <= 32'b0;
        Unet_M01_AXI_wdata    <= 32'b0;
        Unet_M01_AXI_wlast    <= 1'b0;      //need check
      end
      endcase
    end

    
  end

  endmodule
