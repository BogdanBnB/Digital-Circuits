`timescale 1ns / 1ps
module PWM(
    input clk_i,
	input rstn_i,
	input acc_en_i,
	input [9:0] duty_cycle,
	input [1:0] frequency_selection,
	input [1:0] trigger_selection,
	input out_function,
	input [1:0] capture_selection,
	input [9:0] target_value,
	input clear,
	input SW_trigger,
	output reg [9:0] actual_counter_value,
	output reg [9:0] captured_value,
	output reg tm_running,
	output reg pwm_out
);

reg [18:0] pwm_counter;
reg [18:0] duty_counter;

reg [18:0] frequency_divisor;
always @(*) begin
    case(frequency_selection)
        2'b00:  frequency_divisor=40*(10**6)/100;
        2'b01:  frequency_divisor=40*(10**6)/200;
        2'b10:  frequency_divisor=40*(10**6)/320;
        2'b11:  frequency_divisor=40*(10**6)/400;
    endcase
end

//PWM Counter Logic
always @(posedge clk_i or negedge rstn_i) begin
    if(!rstn_i) begin
        pwm_counter<=10'd0;
        duty_counter<=10'd0;
        pwm_out<=1'b0;
        actual_counter_value<=10'd0;
        captured_value<=10'd0;
        tm_running<=1'b0;
    end
    else if(acc_en_i) begin
        if(pwm_counter < frequency_divisor) begin
            pwm_counter<=pwm_counter+1;
        end
        else begin
            pwm_counter<=19'd0;
            duty_counter<=19'd0;
            tm_running<=1'b0;
        end
        
        if(duty_counter<(duty_cycle*frequency_divisor/1023)) begin
            pwm_out<=1'b1;
            duty_counter<=duty_counter+1;
        end
        else begin
            pwm_out<=1'b0;
        end
        
        if(duty_counter==(duty_cycle*frequency_divisor/1023)-1) begin
            duty_counter<=20'd0;
        end
        actual_counter_value<=pwm_counter[9:0];
        
        if(clear) begin
            captured_value<=10'd0;
        end else if(pwm_counter==target_value) begin
            captured_value<=pwm_counter[9:0];
        end
        
        if(SW_trigger || (trigger_selection==2'b01 && pwm_counter==target_value)) begin
            tm_running<=1'b1;
        end
    end
end

endmodule
