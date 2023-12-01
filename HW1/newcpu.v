module newcpu(instruction, register0, register1, register2, register3,
			memory0, memory1, memory2, memory3, memory4, memory5, memory6, memory7,
			memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15,overflow);
input [8:0] instruction;
output [3:0] register0; output [3:0] register1; output [3:0] register2; output [3:0] register3;
output [3:0] memory0; output [3:0] memory1; output [3:0] memory2; output [3:0] memory3;
output [3:0] memory4; output [3:0] memory5; output [3:0] memory6; output [3:0] memory7;
output [3:0] memory8; output [3:0] memory9; output [3:0] memory10; output [3:0] memory11;
output [3:0] memory12; output [3:0] memory13; output [3:0] memory14; output [3:0] memory15;
output overflow;
reg [3:0] register [3:0];
reg [3:0] memory [15:0];
reg overflow1=0;//set overflow =0

integer i;
initial
begin
	for (i = 0; i < 4; i = i + 1)
	register [i] = 4'b0000;
	for (i = 0; i < 16; i = i + 1)
	memory[i] = 4'b0000;
end
reg [3:0] j=0;
always@(j,instruction,register[0],register[1],register[2],register[3],memory[0],memory[1]
	,memory[2],memory[3],memory[4],memory[5],memory[6],memory[7],memory[8],memory[9]
	,memory[10],memory[11],memory[12],memory[13],memory[14],memory[15],overflow1)
begin
	case(instruction[8:6])
	3'b000:
	begin
	j=register[instruction[5:4]]+register[instruction[3:2]]+overflow1;//rd=rs+rt+last time's carry 
	overflow1=0;//set overflow to 0
	end
	3'b001:
	j=register[instruction[5:4]]&register[instruction[3:2]];
	3'b010:
	j=register[instruction[5:4]]|register[instruction[3:2]];
	3'b011:
	j=~register[instruction[5:4]];
	3'b100:
	if(register[instruction[5:4]]<register[instruction[3:2]])
		j=1;
	else
		j=0;
	3'b101:
	memory[instruction[3:0]]=register[instruction[5:4]];
	3'b110:
	j=memory[instruction[5:2]];
	3'b111:
	j=instruction[5:2];
	endcase
	if(instruction[8:6]==000&j[3]==1)
		overflow1=1;//if overflow,'overflow1'=1
	else if(instruction[8:6]==000&j[3]==0)
		overflow1=0;//if not overflow ,'overflow'=0
	case(instruction[1:0])
	2'b00:register[0]=j;
	2'b01:register[1]=j;
	2'b10:register[2]=j;
	2'b11:register[3]=j;
	endcase
end



assign register0 = register[0]; assign register1 = register[1];
assign register2 = register[2]; assign register3 = register[3];
assign memory0 = memory[0]; assign memory1 = memory[1];
assign memory2 = memory[2]; assign memory3 = memory[3];
assign memory4 = memory[4]; assign memory5 = memory[5];
assign memory6 = memory[6]; assign memory7 = memory[7];
assign memory8 = memory[8]; assign memory9 = memory[9];
assign memory10 = memory[10]; assign memory11 = memory[11];
assign memory12 = memory[12]; assign memory13 = memory[13];
assign memory14 = memory[14]; assign memory15 = memory[15];
assign overflow=overflow1;

endmodule
