`timescale 1ns / 1ps
module Registru_8b(
        input clk,
        input reset, //activ pe "1"
        input we,
        input [7:0] data_in,
        output reg [7:0] data_out
    );
    
always @(posedge clk) begin
    if(reset==1) begin
        data_out<=0;
    end
    else begin
        if(we==1) begin
            data_out<=data_in;
        end
    end
//        else begin
//            data_out<=data_out;
//        end
end
endmodule
