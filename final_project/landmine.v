module landmine(instruction, boundary,  memory1, memory2, memory3, memory4, memory5,
memory6, memory7, memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15, memory16,died);
input boundary;
output died;
output [1:0] memory1; output [1:0] memory2; output [1:0] memory3; output [1:0] memory4;
output [1:0] memory5; output [1:0] memory6; output [1:0] memory7; output [1:0] memory8;
output [1:0] memory9; output [1:0] memory10; output [1:0] memory11; output [1:0] memory12;
output [1:0] memory13; output [1:0] memory14; output [1:0] memory15; output [1:0] memory16;
reg [1:0] registor1[5:0]; reg [1:0] registor2[5:0]; reg [1:0] registor3[5:0]; reg [1:0] registor4[5:0];
input [6:0] instruction;
reg [1:0]mine [5:0][5:0];
reg die;
reg random;
integer i,j,k;
integer count=0;


always@(*)
begin 
random=1;
	case(instruction[6])//create matrix
	1'b1:
	begin
		for (i = 0; i <= 5; i = i + 1)
		for (j = 0; j <= 5; j = j + 1)
		mine [i][j] = 2'b00;
		for (i = 0; i <= 5; i = i + 1)
		registor1 [i] = 2'bx;
		for (i = 0; i <= 5; i = i + 1)
		registor2 [i] = 2'bx;
		for (i = 0; i <= 5; i = i + 1)
		registor3 [i] = 2'bx;
		for (i = 0; i <= 5; i = i + 1)
		registor4 [i] = 2'bx;
	end
	endcase
	case(instruction[5:4])//choose 1 bomb or 2 bomb or 3 bomb
	2'b01:	
	begin
		mine[random+1][random+2]=2'bz;
		for(i=random;i<=random+2;i=i+1)
		for(j=random+1;j<=random+3;j=j+1)
		begin
		if(i<=4&&j<=4)
		if(mine[i][j]===1'bz)
		mine[i][j]=mine[i][j];
		else
		mine[i][j]=mine[i][j]+1;
		end
	end
	2'b10:
	begin
		mine[random+3][random+1]=2'bz;
		mine[random+2][random+2]=2'bz;
		mine[3][1]=2'b01;mine[4][1]=2'b01;
		mine[2][2]=2'b01;mine[3][2]=2'b10;
		mine[2][3]=2'b01;mine[4][3]=2'b10;
		mine[2][4]=2'b01;mine[3][4]=2'b01;
		mine[4][4]=2'b01;
	end
	2'b11:
	begin
		mine[random][random+3]=2'bz;
		mine[random+1][random+1]=2'bz;
		mine[random+2][random+2]=2'bz;
		mine[1][1]=2'b01;mine[1][2]=2'b01;
		mine[1][3]=2'b10;mine[2][1]=2'b01;
		mine[2][3]=2'b11;mine[2][4]=2'b01;
		mine[3][1]=2'b01;mine[3][2]=2'b10;
		mine[3][4]=2'b01;mine[4][2]=2'b01;
		mine[4][3]=2'b01;mine[4][4]=2'b01;
	end
	endcase
	case(instruction[3:0])//the place what we choose need to be open
	4'b0000:begin  registor1[1]=mine[1][1];
	if(mine[1][1]===2'bz) die=1; end//if the place what we choose is bomb , die=1
	4'b0001:begin  registor1[2]=mine[1][2];
	if(mine[1][2]===2'bz) die=1; end
	4'b0010:begin  registor1[3]=mine[1][3];
	if(mine[1][3]===2'bz) die=1; end
	4'b0011:begin  registor1[4]=mine[1][4];
	if(mine[1][4]===2'bz) die=1; end
	4'b0100:begin  registor2[1]=mine[2][1];
	if(mine[2][1]===2'bz) die=1; end
	4'b0101:begin  registor2[2]=mine[2][2];
	if(mine[2][2]===2'bz) die=1; end
	4'b0110:begin  registor2[3]=mine[2][3];
	if(mine[2][3]===2'bz) die=1; end
	4'b0111:begin registor2[4]=mine[2][4];
	if(mine[2][4]===2'bz) die=1; end
	4'b1000:begin  registor3[1]=mine[3][1];
	if(mine[3][1]===2'bz) die=1; end
	4'b1001:begin  registor3[2]=mine[3][2];
	if(mine[3][2]===2'bz) die=1; end
	4'b1010:begin  registor3[3]=mine[3][3];
	if(mine[3][3]===2'bz) die=1; end
	4'b1011:begin  registor3[4]=mine[3][4];
	if(mine[3][4]===2'bz) die=1; end
	4'b1100:begin  registor4[1]=mine[4][1];
	if(mine[4][1]===2'bz) die=1; end
	4'b1101:begin  registor4[2]=mine[4][2];
	if(mine[4][2]===2'bz) die=1; end
	4'b1110:begin  registor4[3]=mine[4][3];
	if(mine[4][3]===2'bz) die=1; end
	4'b1111:begin  registor4[4]=mine[4][4];
	if(mine[4][4]===2'bz) die=1; end
	endcase
end
assign memory1=registor1[1];
assign memory2=registor1[2];
assign memory3=registor1[3];
assign memory4=registor1[4];
assign memory5=registor2[1];
assign memory6=registor2[2];
assign memory7=registor2[3];
assign memory8=registor2[4];
assign memory9=registor3[1];
assign memory10=registor3[2];
assign memory11=registor3[3];
assign memory12=registor3[4];
assign memory13=registor4[1];
assign memory14=registor4[2];
assign memory15=registor4[3];
assign memory16=registor4[4];
assign died=die;
endmodule
