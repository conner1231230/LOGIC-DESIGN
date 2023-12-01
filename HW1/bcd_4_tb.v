module bcd_4_tb;
reg [8:0] instruction;
wire [3:0] r0, r1, r2, r3, m0, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15;
wire overflow;
cpu test(.instruction(instruction), .register0(r0), .register1(r1), .register2(r2), .register3(r3),
			.memory0(m0), .memory1(m1), .memory2(m2), .memory3(m3), .memory4(m4), .memory5(m5), .memory6(m6), .memory7(m7),
			.memory8(m8), .memory9(m9), .memory10(m10), .memory11(m11), .memory12(m12), .memory13(m13), .memory14(m14), .memory15(m15), .overflow(overflow));
reg [3:0] a = 12; 

initial
begin
instruction = {3'b111, a, 2'b00}; #10;
instruction = 9'b101000001; #10;
instruction = 9'b111100101; #10;
instruction = 9'b100010010; #10;
instruction = 9'b101100000; #10;
instruction = 9'b011100001; #10;
instruction = 9'b111000100; #10;
instruction = 9'b000000110; #10;
instruction = 9'b111011001; #10;
instruction = 9'b001011000; #10;
instruction = 9'b110000101; #10;
instruction = 9'b000000110; #10;
instruction = 9'b101100001; #10;

$monitor(" %d => %d %d ", a, m0, m1);
end
endmodule
