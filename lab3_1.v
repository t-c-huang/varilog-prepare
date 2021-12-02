module half_adder(a, b, sum, carry);
    input a, b;
    output reg sum, carry;
    always @(a or b)
    begin
        sum <= a ^ b;
        carry <= a & b;
    end
endmodule


module full_adder1(x, y, c_in, c_out, sum);
    input x, y, c_in;
    output reg c_out, sum;

    wire c1, c2, s1;

    half_adder a(x, y, s1, c1);
    half_adder b(c_in, s1, sum, c2);
    or(c_out, c1, c2);
endmodule

module full_adder2(x, y, c_in, c_out, sum);
    input x, y, c_in;
    output c_out, sum;

    wire c1, c2, s1;
    assign s1 = x^y;
    assign c1 = x&y;
    assign sum = c_in ^ s1;
    assign c2 = c_in & s1;
    assign c_out = c1 | c2;
endmodule

module full_adder3(x, y, c_in, c_out, sum);
    input x, y, c_in;
    output reg c_out, sum;

    reg c1, c2, s1;
    always@(*)
    begin
        s1 <= x^y;
        c1 <= x&y;
        c2 <= c_in & s1;
        c_out <= c1 | c2;
        sum <= s1 ^ c_in;
    end
endmodule