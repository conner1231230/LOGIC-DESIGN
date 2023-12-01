`timescale 1ns/1ns
module cpu_tb;
reg [8:0] instruction;
wire [3:0] r0, r1, r2, r3, m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15;
wire overflow;
cpu test(.instruction(instruction), .register0(r0), .register1(r1), .register2(r2), .register3(r3),
			.memory0(m0), .memory1(m1), .memory2(m2), .memory3(m3), .memory4(m4), .memory5(m5), .memory6(m6), .memory7(m7),
			.memory8(m8), .memory9(m9), .memory10(m10), .memory11(m11), .memory12(m12), .memory13(m13), .memory14(m14), .memory15(m15), .overflow(overflow));
reg[3:0] ans0, ans1, ans2, ans3, ans4, ans5, ans6, ans7, ans8, ans9, ans10, ans11 =4'b0000;

initial
begin
instruction = 9'b111001100; #10;		//li 3 -> #0
ans0 = r0;
instruction = 9'b111110001; #10;		//li 12 -> #1
ans1 = r1;
instruction = 9'b001000110; #10;	//#0 and #1 -> #2
ans2 = r2;
instruction = 9'b010000111; #10;		//#0 or #1 -> #3
ans3 = r3;
instruction = 9'b101100000; #10;	//#2 (store) -> m#0
ans4 = m0;
instruction = 9'b101110001; #10;		//#3 (store) -> m#1
ans5 = m1;
instruction = 9'b110000000; #10;	//m#0 (load) -> #0 
ans6 = r0;
instruction = 9'b110000101; #10;		//m#1 (load) -> #1
ans7 = r1;
instruction = 9'b000000110; #10;	//#0 add #1 -> #2
ans8 = r2;
instruction = 9'b011100011; #10;		//#2' -> #3
ans9 = r3;
instruction = 9'b100000110; #10;	//if(#0<#1) #2 = 1
ans10 = r2;
instruction = 9'b000011000; #10;	//#1 add #2 -> #0 overflow
ans11 = r0;

if((ans0==4'b0011)&(ans1==4'b1100)&(ans2==4'b0000)&(ans3==4'b1111)&(ans4==4'b0000)&(ans5==4'b1111)&(ans6==4'b0000)&(ans7==4'b1111)&(ans8==4'b1111)&(ans9==4'b0000)&(ans10==4'b0001)&(ans11==4'b0000))
$monitor("Your answer is correct!!!");
else
$monitor("Oh no, something go wrong!");
end
endmodule
