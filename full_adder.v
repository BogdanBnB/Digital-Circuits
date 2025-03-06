`timescale 1ns / 1ps
module full_adder(
        input in0,
        input in1,
        input c_in
    );
    
assign {c_out, out}=in0+in1+c_in;
endmodule
