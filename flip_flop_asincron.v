`timescale 1ns / 1ps
module flip_flop_asincron(
        input in,
        input clk,
        input reset,
        output reg out
    );
    
always @(posedge clk or posedge reset) begin
    if(reset==1) begin
        out<=0;
    end
    else begin
        out<=in;
    end
end
endmodule
