module registor_block(
	input clk_i,
	input rstn_i,
	input acc_en_i,
	input wr_en_i,
	input [2:0] addr_i,
	input [15:0] wdata_i,
	output reg [15:0] rdata_o,
	output [1:0] mode,
	output [9:0] duty_cycle,
	output [1:0] frequency_selection,
	output [3:0] input_selection,
	output [1:0] trigger_selection,
	output out_function,
	output [1:0] capture_selection,
	output [9:0] target_value,
	output [9:0] counter,
	output clear,
	output SW_trigger,
	input [9:0] actual_counter_value,
	input [9:0] captured_value,
	input tm_running
);

reg [15:0] CTRL0;
always @(posedge clk_i or negedge rstn_i) begin
	if(!rstn_i)
		CTRL0<=16'd0;
	else if(acc_en_i==1 && wr_en_i==1 && addr_i==3'b000)
		CTRL0<=wdata_i;
end
assign mode=CTRL0[1:0];


reg [15:0] PWM_MODE;
always @(posedge clk_i or negedge rstn_i) begin
	if(!rstn_i)
		PWM_MODE<=0;
	else if(acc_en_i==1 && wr_en_i==1 && addr_i==3'b001)
		PWM_MODE<=wdata_i;
end
assign duty_cycle=PWM_MODE[9:0];
assign frequency_selection=PWM_MODE[13:12];


reg [15:0] CNT_TIMER_MODE0;
always @(posedge clk_i or negedge rstn_i) begin
	if(!rstn_i)
		CNT_TIMER_MODE0<=0;
	else if(acc_en_i==1 && wr_en_i==1 && addr_i==3'b010)
		CNT_TIMER_MODE0<=wdata_i;
end
assign input_selection=CNT_TIMER_MODE0[3:0];
assign trigger_selection=CNT_TIMER_MODE0[5:4];
assign out_function=CNT_TIMER_MODE0[8];
assign capture_selection=CNT_TIMER_MODE0[13:12];


reg[15:0] CNT_TIMER_MODE1;
always @(posedge clk_i or negedge rstn_i) begin
	if(!rstn_i)
		CNT_TIMER_MODE1<=0;
	else if(acc_en_i==1 && wr_en_i==1 && addr_i==3'b011)
		CNT_TIMER_MODE1<=wdata_i;
end
assign target_value=CNT_TIMER_MODE1[9:0];

assign clear=wdata_i[0] && wr_en_i==1 && acc_en_i==1 && addr_i==3'b101;
assign SW_trigger=wdata_i[4] && wr_en_i==1 && acc_en_i==1 && addr_i==3'b101;



always @(*) begin
	rdata_o=0;
	if(acc_en_i==1 && wr_en_i==0) begin // read command
		case(addr_i)
			3'b000: rdata_o=CTRL0;
			3'b001: rdata_o=PWM_MODE;
			3'b010: rdata_o=CNT_TIMER_MODE0;
			3'b011: rdata_o=CNT_TIMER_MODE1;
			3'b100: rdata_o={6'b000000, actual_counter_value};
			3'b110: rdata_o={3'b000, tm_running, 2'b00, captured_value};
		endcase
	end
end
endmodule
