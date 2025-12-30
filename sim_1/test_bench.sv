`timescale 1ns / 1ps


module test_bench();
    
logic [3:0] in0, in1, decod_2b;
logic [1:0] sel_op, sel_display;
logic c_out;
logic [6:0]decod_7seg;


top top_inst(
    .in0(in0),
    .in1(in1),
    .sel_op(sel_op),
    .sel_display(sel_display),
    .c_out(c_out),
    .decod_7seg(decod_7seg),
    .decod_2b(decod_2b)
);

initial begin
    in0 = 4'b1010;
    in1 = 4'b1011;
    sel_display = 0;
    sel_op = 0;
    c_out = 0;
    
    #5
    sel_op = 1;
   
    
    #5
    sel_op = 2;
    
    sel_display = 1;
    #5
    sel_op = 3;
    
    #5
    in0 = 2; // 2
    in1 = 1; // 1
    sel_op = 3; 
    
    #5
    sel_op = 2; 
    
    #5
    $stop;
end

endmodule
