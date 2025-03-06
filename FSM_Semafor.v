`timescale 1ns / 1ps

module automat_finit(
        input clk,
        input reset,
        output r,
        output g,
        output b
    );
    
/* 
    00-rosu
    01-galben
    10-verde
*/

reg [1:0] fsm_state;
reg [1:0] fsm_state_next;
reg [7:0] counter;

//PRIMUL PAS: determinarea starii urmatoare (combinational)
always @(*) begin
    case(fsm_state)
        2'b00: begin
            if(counter==50)
                fsm_state_next=2'b10;
            else
                fsm_state_next=fsm_state;
        end
        2'b01: begin
            if(counter==5)
                fsm_state_next=2'b01;
            else
                fsm_state_next=fsm_state;
        end
        2'b10: begin
            if(counter==50)
                fsm_state_next=2'b01;
            else
                fsm_state_next=fsm_state;
        end
    endcase
end

//AL DOILEA PAS: actualizarea starii curente (secvential)
always @(posedge clk, posedge reset) begin
    if(reset==1) begin
        fsm_state<=2'b00;
    end
    else begin
        fsm_state<=fsm_state_next;
    end
end

//AL TREILEA PAS: decodarea output-urilor (combinational)
assign r = (fsm_state==2'b00) ? 1:0;
assign g = (fsm_state==2'b10) ? 1:0;
assign b = (fsm_state==2'b01 || fsm_state==2'b10)?1:0;

always @(posedge clk, posedge reset) begin
    if(reset==1) begin
        counter<=1;
    end
    else begin
        case(fsm_state)
            2'b00: begin
                if(counter>50)
                    counter<=0;
                else
                    counter<=counter+1;
            end
            2'b01: begin
                if(counter>5)
                    counter<=0;
                else
                    counter<=counter+1;
            end
            2'b10: begin
                if(counter>50)
                    counter<=0;
                else
                    counter<=counter+1;
            end
        endcase
    end
end
endmodule
