`timescale 1ns / 1ps
module flip_flop_sincron(
        input in,
        input clk,
        input reset,
        output reg out
    );
    
always @(posedge clk) begin
    if(reset==1) begin
        out<=0;
    end
    else begin
       out<=in;
    end
end
endmodule
