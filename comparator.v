`timescale 1ns / 1ps
module comparator(
        input in0,
        input in1,
        output reg lower,
        output reg equal,
        output reg higher
    );
    
always @(*) begin
    if(in0<in1) begin
        lower=1;
        equal=0;
        higher =0;
    end
    else if(in0==in1) begin
        lower=0;
        equal=1;
        higher=0;
    end
    else begin
        lower=0;
        equal=0;
        higher=1;
    end
end
endmodule
