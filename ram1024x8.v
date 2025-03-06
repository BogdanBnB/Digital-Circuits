`timescale 1ns / 1ps

module ram1024x8(
        input clock,
        input [9:0] addr_read,
        input [9:0] addr_write,
        input we,
        input [7:0] data_write,
        output [7:0] data_read
    );
    
reg [7:0] memorie[0:1023];
assign data_read=memorie[addr_read];

always @(posedge clock) begin
    if(we==1) begin
        memorie[addr_write]<=data_write;
    end
end
endmodule
