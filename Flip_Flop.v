`timescale 1ns / 1ps

//Cu reset sincron
module Flip_Flop(
        input [2:0] data_in,
        input reset,
        input clk,
        output reg [2:0] data_out
    );
    
always @(posedge clk) begin
    if(reset==1) begin
        data_out<=0;
    end
    else begin
        data_out<=data_in;
    end
end
endmodule
