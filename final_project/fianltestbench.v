`timescale 1ns/1ns
module finaltestbench;
reg [6:0]instruction;
reg [3:0]number;reg [3:0]boundary;
wire [1:0] memory1; wire [1:0] memory2; wire [1:0] memory3; wire [1:0] memory4;
wire [1:0] memory5; wire [1:0] memory6; wire [1:0] memory7; wire [1:0] memory8;
wire [1:0] memory9; wire [1:0] memory10; wire [1:0] memory11; wire [1:0] memory12;
wire [1:0] memory13; wire [1:0] memory14; wire [1:0] memory15; wire [1:0] memory16;
wire died;
landmine test (instruction, boundary,  memory1, memory2, memory3, memory4, memory5,
memory6, memory7, memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15, memory16,died);
initial
begin
boundary=2'b11;#10;//a 4X4 matrix
//7 bit =create matrix(1 bit)+how many bombs(2 bit)+the place we want to open(4 bit)
//example like this below
instruction=7'b1110000;#10;// chose the 1th square             the number of matrix: 1  2  3  4
instruction=7'b0110110;#10;// chose the 7th square                                   5  6  7  8
instruction=7'b0111111;#10;// chose the 16th square                                  9  10 11 12
instruction=7'b0111100;#10;// chose the 13th square                                  13 14 15 16
instruction=7'b0111001;#10;// chose the 10th square
instruction=7'b0110101;#10;// chose the 6th square
if(died==1) begin
$monitor(" you died");#10;
$monitor(" %d %d %d %d",memory1,memory2,memory3,memory4);#10;
$monitor(" %d %d %d %d",memory5,memory6,memory7,memory8);#10;
$monitor(" %d %d %d %d",memory9,memory10,memory11,memory12);#10;
$monitor(" %d %d %d %d",memory13,memory14,memory15,memory16);#10;
end
else
begin
$monitor(" %d %d %d %d",memory1,memory2,memory3,memory4);#10;
$monitor(" %d %d %d %d",memory5,memory6,memory7,memory8);#10;
$monitor(" %d %d %d %d",memory9,memory10,memory11,memory12);#10;
$monitor(" %d %d %d %d",memory13,memory14,memory15,memory16);#10;
end
end

endmodule
