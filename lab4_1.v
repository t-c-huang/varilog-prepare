module adder_subtractor(a, b, select, out, overflow);

    input [1:0] a, b;
    input select;
    output [1:0]out;
    output overflow;

    assign {overflow, out} = (select==1'b0)?a-b:a+b;

endmodule