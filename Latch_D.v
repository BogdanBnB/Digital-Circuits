`timescale 1ns / 1ps
module Latch_D(
        input in,
        input enable,
        output reg out
    );
    
always @(*) begin
    if(enable==1) begin
        out<=in;
        
    end

end
endmodule
