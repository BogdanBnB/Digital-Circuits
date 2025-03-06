`timescale 1ns / 1ps
module numarator
#(parameter width = 8)
    (
            input clk,
            input reset,
            output reg [width-1:0] count
    );

always @(posedge clk) begin
    if(reset==0) 
        count<=0;
    else
        count<=count+1;
end
endmodule
