`timescale 1ns / 1ps

module div_clk_100Mhz_1hz(
        input clk_100mhz,
        input reset,
        output reg clk_1hz
    );
    
reg [26:0] counter;
always @(posedge clk_100mhz, posedge reset) begin
    if(reset==1) begin
        clk_1hz<=0;
        counter<=0;
    end
    else begin
        if(counter==50*(10**6)) begin
            counter<=0;
            clk_1hz<=~clk_1hz;
        end
        else begin
            counter<=counter+1;
        end
    end
end
endmodule
