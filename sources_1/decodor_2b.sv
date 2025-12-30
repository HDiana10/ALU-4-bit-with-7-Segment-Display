`timescale 1ns / 1ps

module decodor_2b(
    input logic [1:0] sel_display,
    output logic [3:0] out
    );
    
assign out = 2^sel_display;

endmodule
