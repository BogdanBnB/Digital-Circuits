`timescale 1ns / 1ps
module parity_calc(
        input in,
        output reg out
   );
   
always @(*) begin
    if(in%2==0) out=0;
    else out=1;

end
endmodule
