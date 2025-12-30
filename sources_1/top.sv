`timescale 1ns / 1ps
module top(
    input logic [3:0] in0,
    input logic [3:0] in1,
    input logic [1:0] sel_op,
    input logic [1:0] sel_display,
    output logic c_out,
    output logic [6:0] decod_7seg,
    output logic [3:0] decod_2b
    );
    
    logic [4:0] add, sub;
    logic [3:0] and2, or2, out, decod;
    
sumator sumator_inst(
    .in0(in0),
    .in1(in1),
    .out(add)
);
    
sub sub_inst(
    .in0(in0),
    .in1(in1),
    .out(sub)
);

poarta_and and_inst(
    .in0(in0),
    .in1(in1),
    .out(and2)
);

or_4b or_4b_inst(
    .in0(in0),
    .in1(in1),
    .out(or2)
);


or_2 or_2_inst(
    .in0(add[4]),
    .in1(sub[4]),
    .out(c_out)
);

multiplexor multiplexor_inst(
    .in0(or2),
    .in1(and2),
    .in2(sub[3:0]),
    .in3(add[3:0]),
    .sel_op(sel_op),
    .out(out)
);

decodor_7seg decodor_7seg_inst(
    .in(out),
    .out(decod_7seg)
);

decodor_2b decodor_2b_inst(
    .sel_display(sel_display),
    .out(decod)
);


assign decod_2b = ~decod;

 
endmodule
