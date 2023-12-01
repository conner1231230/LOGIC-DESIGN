module one(inputA, inputB, R01, R02, R91, R92, QA, QB, QC, QD);
input inputA, inputB, R01, R02, R91, R92;
output QA, QB, QC, QD;
wire [9:0]w1;
w1=~(R91&R92);



endmodule
