`timescale 1ns / 1ps
module divizor_de_frecv_4semnale_iesire(
    input clock,
    input reset,
    output clkout1,
    output clkout2,
    output clkout4,
    output clkout8
);

reg [26:0] count;

always @(posedge clock) begin
    if(reset == 1)
        count <= 0;
    else
        count <= count + 1;  
end

assign clkout1 = count[26];
assign clkout2 = count[25];
assign clkout4 = count[24];
assign clkout8 = count[23];
endmodule
