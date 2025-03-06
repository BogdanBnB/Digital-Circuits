`timescale 1ns / 1ps
module reg_file( 
        input [63:0] left_operand,
        input [63:0] right_operand,
        input [63:0] result,
        input [7:0] left_addr,
        input [7:0] right_addr,
        input [7:0] dest_addr,
        input write_enable,
        input clock

);

reg [63:0] file [0:63];
assign left_operand=file[left_addr];
assign right_operand=file[right_addr];

always @(posedge clock) begin
    if(write_enable) begin
        file[dest_addr]<=result;
    end
end
endmodule
