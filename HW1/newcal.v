`timescale 1ns/1ns
module newcal_tb;
reg [8:0] instruction;
wire [3:0] r0, r1, r2, r3, m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15;
wire overflow;
newcpu test(.instruction(instruction), .register0(r0), .register1(r1), .register2(r2), .register3(r3),
			.memory0(m0), .memory1(m1), .memory2(m2), .memory3(m3), .memory4(m4), .memory5(m5), .memory6(m6), .memory7(m7),
			.memory8(m8), .memory9(m9), .memory10(m10), .memory11(m11), .memory12(m12), .memory13(m13), .memory14(m14), .memory15(m15), .overflow(overflow));
reg [7:0] a = 54;//0011 0110
reg [7:0] b = 38;//0010 0110
reg [11:0] sub_ans = 0;
initial
begin
instruction=9'b111011000;#10;//54's right 3 number ->#0
instruction=9'b111111001;#10;//38's right 3 number ->#1 need use 'not' so I use 1110 not 0110
instruction=9'b011010010;#10;//~#1->#2 
instruction=9'b111000111;#10;//#3=0001
instruction=9'b000111001;#10;//#3+#2->#1
instruction=9'b000000110;#10;//#0+#1->#2
instruction=9'b101100000;#10;//#2->m#0 m#0=1000

instruction=9'b111011000;#10;//54's middle 3 number ->#0
instruction=9'b111110001;#10;//38's middle 3 number ->#1 nedd use 'not' so I use 1100 not 0100
instruction=9'b011010010;#10;//~#1->#2
instruction=9'b000001011;#10;//#0+#2->#3
instruction=9'b101110001;#10;//#3->m#1 m#1=1010

instruction=9'b111000000;#10;//54's left 2 number ->#0
instruction=9'b111110001;#10;//38's left 2 number ->#1 nedd use 'not' so I use 1100 not 0000
instruction=9'b011010010;#10;//~#1->#2
instruction=9'b000001011;#10;//#0+#2->#3
instruction=9'b101110010;#10;//#3->m#2 

sub_ans = {m2[1:0],m1[2:0],m0[2:0]};

$monitor($time, " %d - %d = %d ", a, b , sub_ans);

end
endmodule
