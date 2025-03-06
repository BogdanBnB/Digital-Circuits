`timescale 1ns / 1ps
module divizor_frecventa_puteri_2(
        input clk,
        input reset,
        output reg clk_out
    );

always @(posedge clk, posedge reset) begin
    if(reset==1) begin
        clk_out<=0;
    end
    else begin
        clk_out<=~clk_out;
    end
end
endmodule
