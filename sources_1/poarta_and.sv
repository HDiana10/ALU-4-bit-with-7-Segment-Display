`timescale 1ns / 1ps

module poarta_and(
    input logic [3:0] in0,
    input logic [3:0] in1,
    output logic [3:0] out
);
    
assign out = in0 & in1;

endmodule
