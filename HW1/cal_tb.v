`timescale 1ns/1ns
module cal_tb;
reg [8:0] instruction;
wire [3:0] r0, r1, r2, r3, m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15;
wire overflow;
cpu test(.instruction(instruction), .register0(r0), .register1(r1), .register2(r2), .register3(r3),
			.memory0(m0), .memory1(m1), .memory2(m2), .memory3(m3), .memory4(m4), .memory5(m5), .memory6(m6), .memory7(m7),
			.memory8(m8), .memory9(m9), .memory10(m10), .memory11(m11), .memory12(m12), .memory13(m13), .memory14(m14), .memory15(m15), .overflow(overflow));
reg [7:0] a = 68;//0100 0100
reg [7:0] b = 58;//0011 1010
reg [11:0] add_ans = 0;
reg [11:0] sub_ans = 0;
initial
begin
instruction=9'b111010000;#10;//68's right 4 number ->#0
instruction=9'b111101001;#10;//58's right 4 number ->#1
instruction=9'b000000110;#10;//#0+#1->#2
instruction=9'b101100000;#10;//#2->m#0
instruction=9'b111010000;#10;//68's left 4 number ->#0
instruction=9'b111001101;#10;//58's left 4 number ->#1
instruction=9'b000000111;#10;//#0+#1->#3
instruction=9'b101110001;#10;//#3->m#1
add_ans = {m1, m0};

instruction=9'b111010000;#10;//68's left 4 number ->#0
instruction=9'b111001101;#10;//58's left 4 number ->#1
instruction=9'b011010010;#10;//~#1->#2
instruction=9'b000001011;#10;//#0+#2->#3
instruction=9'b101110010;#10;//#3->m#2
instruction=9'b111010000;#10;//68's right 4 number->#0
instruction=9'b111101001;#10;//58's right 4 number->#1
instruction=9'b011010010;#10;//~#1->#2
instruction=9'b111000111;#10;//#3=1
instruction=9'b000111001;#10;//#3+#2->#1
instruction=9'b000010011;#10;//#0+#1->#3
instruction=9'b101110011;#10;//#3->m#3

sub_ans = {m2, m3};

$monitor($time, " %d + %d = %d, %d - %d = %d ", a, b, add_ans, a, b, sub_ans);

end
endmodule
