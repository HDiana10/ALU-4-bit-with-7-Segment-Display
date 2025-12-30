`timescale 1ns / 1ps

module multiplexor(
    input logic [3:0] in0,
    input logic [3:0] in1, 
    input logic [3:0] in2,
    input logic [3:0] in3,
    input logic [1:0] sel_op,
    output logic [3:0] out         
);

always_comb begin
	case(sel_op)
		0: assign out = in0;
		1: assign out = in1;
		2: assign out = in2;
		3: assign out = in3;
	endcase 
end  
endmodule
