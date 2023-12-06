module base_address_rd(
    input clk ,
    input rst_n ,
    input [31:0] start_addr ,
    output ram_clk , 
    input [31:0] ram_rd_data,
    output reg ram_en ,
    output reg [31:0] ram_addr ,
    output ram_rst
    );

assign ram_rst  = 1'b0;
assign ram_clk  = clk ;
assign ram_en   = 1'b1;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        ram_addr <= 32'd0;
    end
    else begin
        ram_addr <= start_addr;
    end
end

endmodule
