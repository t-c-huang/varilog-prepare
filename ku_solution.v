module mid(clk,reset,in,out);
	input clk;
	input reset;
	input in;
	output [6:0]out;
	wire clk_div;
	wire [1:0]count;
	FrequencyDivider D1(clk,clk_div);
	Mearly M1 (clk_div,reset,in,count);
	SevenDisplay S1 (count,in,reset,out);
endmodule
module FrequencyDivider(clk,clk_div);
    input clk;
    output reg clk_div = 1'b0;
    reg [24:0]counter = 25'd0;
    always @(posedge clk) begin
        if (counter == 25'd12500000) begin
            clk_div = ~clk_div;
            counter = counter + 25'd1;
        end
        else if (counter == 25'd25000000) begin
            clk_div = ~clk_div;
            counter = 25'd0;    
        end
        else begin
            counter = counter + 25'd1;
        end
    end
endmodule
module Mearly(clk_div,reset,in,count);
	input clk_div;
	input reset;
	input in;
	output reg[1:0]count = 2'd0;
	
	always@(posedge clk_div,negedge reset) begin
		if (!reset) begin
			count = 2'd0;
		end
		else if (in == 0) begin
			case (count)
			2'd0:
				count = 2'd1;
			2'd1:
				count = 2'd3;
			2'd2:
				count = 2'd0;
			2'd3:
				count = 2'd2;
			default:
				count = 2'd0;
			endcase
		end
		else begin
			case (count)
			2'd0:
				count = 2'd3;
			2'd1:
				count = 2'd2;
			2'd2:
				count = 2'd0;
			2'd3:
				count = 2'd1;
			default:
				count = 2'd0;
			endcase
		end
	end
endmodule
module SevenDisplay(count,in,reset,out);
	 input reset;
    input [1:0]count;
	 input in;
    output reg [6:0]out;
    always @(count or in or reset) begin
		 if (!reset) begin
			out = 7'b0000000;
		 end
		 else if (in == 0) begin
			case (count)
			2'd0:
            out = 7'b1111000;
			2'd1:
            out = 7'b0000010;
			2'd2:
            out = 7'b0010010;
			2'd3:
            out = 7'b0011001;
        default:
            out = 7'd1;
        endcase
		end
		else begin
			case (count)
			2'd0:
            out = 7'b1000000;
			2'd1:
            out = 7'b1111001;
			2'd2:
            out = 7'b0100100;
			2'd3:
            out = 7'b0110000;
        default:
            out = 7'd1;
        endcase
		end
        
    end
endmodule