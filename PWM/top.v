module top(
	input clk_i,
	input rstn_i,
	input acc_en_i,
	input wr_en_i,
	input [2:0] addr_i,
	input [15:0] wdata_i,
	input input1_i,
	input input2_i,
	input input3_i,
	input input4_i,
	input input5_i,
	input input6_i,
	input input7_i,
	input input8_i,
	input input9_i,
	input input10_i,
	input input11_i,
	input input12_i,
	input input13_i,
	input input14_i,
	input input15_i,

	output [15:0] rdata_o,
	output output_o
);
	wire [1:0] mode_w;
	wire [9:0] duty_cycle_w;
	wire [1:0] frequency_selection_w;
	wire [3:0] input_selection_w;
	wire [1:0] trigger_selection_w;
	wire out_function_w;
	wire [1:0] capture_selection_w;
	wire [9:0] target_value_w;
	wire [9:0] counter_w;
	wire clear_w;
	wire SW_trigger_w;
	wire [9:0] actual_counter_value_w;
	wire [9:0] captured_value_w;
    wire tm_running_w;
    
registor_block registor_block(
	.clk_i(clk_i),
	.rstn_i(rstn_i),
	.acc_en_i(acc_en_i),
	.wr_en_i(wr_en_i),
	.wdata_i(wdata_i),
	.rdata_o(rdata_o),
	.addr_i(addr_i),
	.mode(mode_w),
	.duty_cycle(duty_cycle_w),
	.frequency_selection(frequency_selection_w),
	.input_selection(input_selection_w),
	.trigger_selection(trigger_selection_w),
	.out_function(out_function_w),
	.capture_selection(capture_selection_w),
	.target_value(target_value_w),
	.counter(counter_w),
	.clear(clear_w),
	.SW_trigger(SW_trigger_w),
	.actual_counter_value(actual_counter_value_w),
	.captured_value(captured_value_w),
	.tm_running(tm_running_w)
);

PWM PWM(
    .clk_i(clk_i),
	.rstn_i(rstn_i),
	.acc_en_i(acc_en_i),
	.duty_cycle(duty_cycle_w),
	.out_function(out_function_w),
	.frequency_selection(frequency_selection_w),
	.trigger_selection(trigger_selection_w),
    .target_value(target_value_w),
	.clear(clear_w),
	.SW_trigger(SW_trigger_w),
	.actual_counter_value(actual_counter_value_w),
	.captured_value(captured_value_w),
    .tm_running(tm_running_w)
);
endmodule
