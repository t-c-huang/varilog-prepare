module lab5_2(a,b,out);
    input [2:0] a,b;
    output [6:0] out;
    reg [3:0] state;
    
    always@(a or b)
    begin
        state <= a + b;
    end
    display7 d7(state, out); 
endmodule

module display7(state, out);
    input [3:0] state;
    output reg [6:0]out;

    always@(state)
    begin
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