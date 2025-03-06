`timescale 1ns / 1ps
module tb();

	reg clk_i;
	reg rstn_i;
	reg acc_en_i;
	reg wr_en_i;
	reg [2:0] addr_i;
	reg [15:0] wdata_i;
	reg input1_i;
	reg input2_i;
	reg input3_i;
	reg input4_i;
	reg input5_i;
	reg input6_i;
	reg input7_i;
	reg input8_i;
	reg input9_i;
	reg input10_i;
	reg input11_i;
	reg input12_i;
	reg input13_i;
	reg input14_i;
	reg input15_i;

	wire [15:0] rdata_o;
	wire output_o;
    
    
    reg [9:0] duty_cycle;
	reg [1:0] frequency_selection;
	reg [1:0] trigger_selection;
	reg out_function;
	reg [1:0] capture_selection;
	reg [9:0] target_value;
	reg clear;
	reg SW_trigger;
	wire [9:0] actual_counter_value;
	wire [9:0] captured_value;
	wire tm_running;
	wire pwm_out;
    	
	top top(
		.clk_i(clk_i),
		.rstn_i(rstn_i),
		.acc_en_i(acc_en_i),
		.wr_en_i(wr_en_i),
		.wdata_i(wdata_i),
		.rdata_o(rdata_o),
		.addr_i(addr_i),
		.input1_i(input1_i),
		.input2_i(input2_i),
		.input3_i(input3_i),
		.input4_i(input4_i),
		.input5_i(input5_i),
		.input6_i(input6_i),
		.input7_i(input7_i),
		.input8_i(input8_i),
		.input9_i(input9_i),
		.input10_i(input10_i),
		.input11_i(input11_i),
		.input12_i(input12_i),
		.input13_i(input13_i),
		.input14_i(input14_i),
		.input15_i(input15_i),
		.output_o(output_o)

	);
		
initial begin
	clk_i=0;
	forever begin
	  #12.5 clk_i=~clk_i;
	end
end

initial begin
	rstn_i=0;
	acc_en_i=0;
	wr_en_i=0;
    trigger_selection = 2'd0;
    out_function = 0;
    capture_selection = 2'd0;
    target_value = 10'd0;
    clear = 0;
    SW_trigger = 0;
    duty_cycle=10'd0;
    frequency_selection=2'd0;
	#25;
	rstn_i=1;
	acc_en_i=1;
	wr_en_i=1;
	addr_i=3'd0;
    wdata_i=16'd10;
	#25;
	acc_en_i=0;
	#25;
	acc_en_i=1;
	#25;
	frequency_selection=2'b00; //100hz
	#100;
	duty_cycle=10'd102; //10%
	
	#100;
	duty_cycle=10'd256; // 25%
	
	#100;
	duty_cycle=10'd512; //50%
	
	#100;
	duty_cycle=10'd768; //75%
	#100;
	
	duty_cycle=10'd1023; //100%
	clear=1;
	#25;
	clear=0;
	SW_trigger=1;
	#25;
	SW_trigger=0;
	target_value=10'd500;
	trigger_selection=2'b01;
	#1000;
	$stop;
end

endmodule   
