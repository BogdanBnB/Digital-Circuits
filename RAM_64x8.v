`timescale 1ns / 1ps

module RAM_64x8(
        input clk,
        input reset,
        input [5:0] addr_read,
        input we,
        input [5:0] addr_write,
        input [7:0] data_write,
        
        output [7:0] data_read
    );
    
reg [7:0] memorie[0:63];
assign data_read=memorie[addr_read];
integer i;

always @(posedge clk, posedge reset) begin
    if(reset==1) begin
        for(i=0;i<63;i=i+1) begin
            memorie[i]<=0;
        end
    end
    else begin
        if(we==1) begin
            memorie[addr_write]<=data_write;
        end
    end
end
endmodule
