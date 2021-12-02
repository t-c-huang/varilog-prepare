`define TimeExpire 32'd25000000

module lab6(clock, reset, in, out);
    input clock, reset, in;
    output [6:0]out;
    
    wire clk_div;
    wire[3:0]state;
    
    frequency_dividder fd1(clock, reset, clk_div);
    State M1(clk_div, reset, in, state);
    display7 d1(reset, clk_div, state, in, out);
endmodule

module frequency_dividder(clk, rst, clk_div);
    input clk, rst;
    output reg clk_div;

    reg [31:0] time_count;

    always@(posedge clk or negedge rst)
    begin
        if(!rst)
        begin
            time_count <= 32'd0;
            clk_div <= 1'b0;
        end
        else
        begin
            if(time_count == `TimeExpire)
            begin
                clk_div <= ~clk_div;
                time_count <= 32'd0;
            end
            else
            begin
                time_count <= time_count + 32'd1;
            end
        end
    end
endmodule

module State(clk_div, rst, in, state);
   input rst, clk_div, in;
   output reg [3:0] state; 

    always@(posedge clk_div or negedge rst)
    begin
        if(!rst)
        begin
            state <= 3'b0;
        end
        else
        begin
            if(state == 4'd15)
                state <= 4'b0;
            else
                state <= state + 4'd1;
        end
    end
endmodule


module display7(rst, clk_div, state, in, out);
    input rst, clk_div, in;
    input [3:0] state;
    output reg [6:0]out;

    always@(posedge clk_div or negedge rst)
    begin
        if(!rst)
        begin
            out <= 7'b1000000;
        end
        else
        begin
            case(state)
                4'd0: 
                begin
                    out <= 7'b1000000;
                end
                4'd1:
                begin
                    out <= 7'b1111001;
                end
                4'd2:
                begin
                    out <= 7'b0100100;
                end
                4'd3:
                begin
                    out <= 7'b0110000;
                end
                4'd4:
                begin
                    out <= 7'b0011001;
                end
                4'd5:
                begin
                    out <= 7'b0010010;
                end
                4'd6:
                begin
                    out <= 7'b0000010;
                end
                4'd7:
                begin
                    out <= 7'b1111000;
                end
                4'd8:
                begin
                    out <= 7'b0000000;
                end
                4'd9:
                begin
                    out <= 7'b0010000;
                end
                4'd10:  //A
                begin
                    out <= 7'b0001000;
                end
                4'd11:  //b
                begin
                    out <= 7'b0000011;
                end
                4'd12:  //C
                begin
                    out <= 7'b1000110;
                end
                4'd13:  //d
                begin
                    out <= 7'b0100001;
                end
                4'd14:  //E
                begin
                    out <= 7'b0000110;
                end
                4'd15:  //F
                begin
                    out <= 7'b0001110;
                end
                default:
                begin
                    out <= 7'b1111111;
                end
            endcase
        end
    end
endmodule