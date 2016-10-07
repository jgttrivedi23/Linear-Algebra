`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:31 10/06/2016 
// Design Name: 
// Module Name:    LA5 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//data_in11,data_in12,data_in13,data_in14,data_in15,data_in21,data_in22,data_in23,data_in24,data_in25,data_in31,data_in32,data_in33,data_in34,data_in35,data_in41,data_in42,data_in43,data_in44,data_in45,data_in51,data_in52,data_in53,data_in54,data_in55
//////////////////////////////////////////////////////////////////////////////////
module Matrix_Inversion(clk, reset, data_out, address, augment11,augment12,augment13,augment14,augment15,augment21,augment22,augment23,augment24,augment25,augment31,augment32,augment33,augment34,augment35,augment41,augment42,augment43,augment44,augment45,augment51,augment52,augment53,augment54,augment55,augment11d,augment12d,augment13d,augment14d,augment15d,augment21d,augment22d,augment23d,augment24d,augment25d,augment31d,augment32d,augment33d,augment34d,augment35d,augment41d,augment42d,augment43d,augment44d,augment45d,augment51d,augment52d,augment53d,augment54d,augment55d);

output [31:0] augment11d,augment12d,augment13d,augment14d,augment15d;
output [31:0] augment21d,augment22d,augment23d,augment24d,augment25d;
output [31:0] augment31d,augment32d,augment33d,augment34d,augment35d;
output [31:0] augment41d,augment42d,augment43d,augment44d,augment45d;
output [31:0] augment51d,augment52d,augment53d,augment54d,augment55d;

output reg [31:0] augment11,augment12,augment13,augment14,augment15;
output reg [31:0] augment21,augment22,augment23,augment24,augment25;
output reg [31:0] augment31,augment32,augment33,augment34,augment35;
output reg [31:0] augment41,augment42,augment43,augment44,augment45;
output reg [31:0] augment51,augment52,augment53,augment54,augment55;

reg [31:0] original_matrix[0:25];
reg [31:0] matrix_inverse[0:24];

output [31:0] data_out;

input reset;
input [4:0] address;

reg [31:0] data_in11,data_in12,data_in13,data_in14,data_in15;
reg [31:0] data_in21,data_in22,data_in23,data_in24,data_in25;
reg [31:0] data_in31,data_in32,data_in33,data_in34,data_in35;
reg [31:0] data_in41,data_in42,data_in43,data_in44,data_in45;
reg [31:0] data_in51,data_in52,data_in53,data_in54,data_in55;
input clk;


reg [31:0] augment11t = 32'd1;
reg [31:0] augment12t = 32'd0;
reg [31:0] augment13t = 32'd0;
reg [31:0] augment14t = 32'd0;
reg [31:0] augment15t = 32'd0;

reg [31:0] augment21t = 32'd0;
reg [31:0] augment22t = 32'd1;
reg [31:0] augment23t = 32'd0;
reg [31:0] augment24t = 32'd0;
reg [31:0] augment25t = 32'd0;

reg [31:0] augment31t = 32'd0;
reg [31:0] augment32t = 32'd0;
reg [31:0] augment33t = 32'd1;
reg [31:0] augment34t = 32'd0;
reg [31:0] augment35t = 32'd0;

reg [31:0] augment41t = 32'd0;
reg [31:0] augment42t = 32'd0;
reg [31:0] augment43t = 32'd0;
reg [31:0] augment44t = 32'd1;
reg [31:0] augment45t = 32'd0;

reg [31:0] augment51t = 32'd0;
reg [31:0] augment52t = 32'd0;
reg [31:0] augment53t = 32'd0;
reg [31:0] augment54t = 32'd0;
reg [31:0] augment55t = 32'd1;

reg [31:0] answer_temp11,answer_temp12,answer_temp13,answer_temp14,answer_temp15,answer_temp21,answer_temp22,answer_temp23,answer_temp24,answer_temp25,answer_temp31,answer_temp32,answer_temp33,answer_temp34,answer_temp35,answer_temp41,answer_temp42,answer_temp43,answer_temp44,answer_temp45,answer_temp51,answer_temp52,answer_temp53t,answer_temp54t,answer_temp55t;

reg [31:0] x;
reg [31:0] y;

matrix_inverse set_value (
  .clka(clk), // input clka
  .addra(address), // input [4 : 0] addra
  .douta(data_out) // output [31 : 0] douta
);


always@(posedge clk)
begin

if(reset==1'b0)
begin
	original_matrix[address] <= data_out;
end

else
begin

data_in11 = original_matrix[1];
data_in12 = original_matrix[2];
data_in13 = original_matrix[3];
data_in14 = original_matrix[4];
data_in15 = original_matrix[5];

data_in21 = original_matrix[6];
data_in22 = original_matrix[7];
data_in23 = original_matrix[8];
data_in24 = original_matrix[9];
data_in25 = original_matrix[10];

data_in31 = original_matrix[11];
data_in32 = original_matrix[12];
data_in33 = original_matrix[13];
data_in34 = original_matrix[14];
data_in35 = original_matrix[15];

data_in41 = original_matrix[16];
data_in42 = original_matrix[17];
data_in43 = original_matrix[18];
data_in44 = original_matrix[19];
data_in45 = original_matrix[20];

data_in51 = original_matrix[21];
data_in52 = original_matrix[22];
data_in53 = original_matrix[23];
data_in54 = original_matrix[24];
data_in55 = original_matrix[25];

answer_temp11 = (data_in11 > 0 ? data_in11 : (~data_in11+32'd1));
answer_temp12 = (data_in12 > 0 ? data_in12 : (~data_in12+32'd1));
answer_temp13 = (data_in13 > 0 ? data_in13 : (~data_in13+32'd1));
answer_temp14 = (data_in14 > 0 ? data_in14 : (~data_in14+32'd1));
answer_temp15 = (data_in15 > 0 ? data_in15 : (~data_in15+32'd1));

answer_temp21 = (data_in21 > 0 ? data_in21 : (~data_in21 + 32'd1));
answer_temp22 = (data_in22 > 0 ? data_in22 : (~data_in22 + 32'd1));
answer_temp23 = (data_in23 > 0 ? data_in23 : (~data_in23 + 32'd1));
answer_temp24 = (data_in24 > 0 ? data_in24 : (~data_in24 + 32'd1));
answer_temp25 = (data_in25 > 0 ? data_in25 : (~data_in25 + 32'd1));

answer_temp31 = (data_in31 > 0 ? data_in31 : (~data_in31 + 32'd1));
answer_temp32 = (data_in32 > 0 ? data_in32 : (~data_in32 + 32'd1));
answer_temp33 = (data_in33 > 0 ? data_in33 : (~data_in33 + 32'd1));
answer_temp34 = (data_in34 > 0 ? data_in34 : (~data_in34 + 32'd1));
answer_temp35 = (data_in35 > 0 ? data_in35 : (~data_in35 + 32'd1));

answer_temp41 = (data_in41 > 0 ? data_in41 : (~data_in41+32'd1));
answer_temp42 = (data_in42 > 0 ? data_in42 : (~data_in42+32'd1));
answer_temp43 = (data_in43 > 0 ? data_in43 : (~data_in43+32'd1));
answer_temp44 = (data_in44 > 0 ? data_in44 : (~data_in44+32'd1));
answer_temp45 = (data_in45 > 0 ? data_in45 : (~data_in45+32'd1));

answer_temp51 = (data_in51 > 0 ? data_in51 : (~data_in51+32'd1));
answer_temp52 = (data_in52 > 0 ? data_in52 : (~data_in52+32'd1));
answer_temp53t = (data_in53 > 0 ? data_in53 : (~data_in53+32'd1));
answer_temp54t = (data_in54 > 0 ? data_in54 : (~data_in54+32'd1));
answer_temp55t = (data_in55 > 0 ? data_in55 : (~data_in55+32'd1));

x = answer_temp11;
y = answer_temp21;

answer_temp21 = x*answer_temp21 - y*answer_temp11;
answer_temp22 = x*answer_temp22 - y*answer_temp12;
answer_temp23 = x*answer_temp23 - y*answer_temp13;
answer_temp24 = x*answer_temp24 - y*answer_temp14;
answer_temp25 = x*answer_temp25 - y*answer_temp15;

augment21t = x*augment21t - y*augment11t;
augment22t = x*augment22t - y*augment12t;
augment23t = x*augment23t - y*augment13t;
augment24t = x*augment24t - y*augment14t;
augment25t = x*augment25t - y*augment15t;

x = answer_temp11;
y = answer_temp31;

answer_temp31 = x*answer_temp31 - y*answer_temp11;
answer_temp32 = x*answer_temp32 - y*answer_temp12;
answer_temp33 = x*answer_temp33 - y*answer_temp13;
answer_temp34 = x*answer_temp34 - y*answer_temp14;
answer_temp35 = x*answer_temp35 - y*answer_temp15;

augment31t = x*augment31t - y*augment11t;
augment32t = x*augment32t - y*augment12t;
augment33t = x*augment33t - y*augment13t;
augment34t = x*augment34t - y*augment14t;
augment35t = x*augment35t - y*augment15t;

x = answer_temp11;
y = answer_temp41;

answer_temp41 = x*answer_temp41 - y*answer_temp11;
answer_temp42 = x*answer_temp42 - y*answer_temp12;
answer_temp43 = x*answer_temp43 - y*answer_temp13;
answer_temp44 = x*answer_temp44 - y*answer_temp14;
answer_temp45 = x*answer_temp45 - y*answer_temp15;

augment41t = x*augment41t - y*augment11t;
augment42t = x*augment42t - y*augment12t;
augment43t = x*augment43t - y*augment13t;
augment44t = x*augment44t - y*augment14t;
augment45t = x*augment45t - y*augment15t;

x = answer_temp11;
y = answer_temp51;

answer_temp51 = x*answer_temp51 - y*answer_temp11;
answer_temp52 = x*answer_temp52 - y*answer_temp12;
answer_temp53t = x*answer_temp53t - y*answer_temp13;
answer_temp54t = x*answer_temp54t - y*answer_temp14;
answer_temp55t = x*answer_temp55t - y*answer_temp15;

augment51t = x*augment51t - y*augment11t;
augment52t = x*augment52t - y*augment12t;
augment53t = x*augment53t - y*augment13t;
augment54t = x*augment54t - y*augment14t;
augment55t = x*augment55t - y*augment15t;

x = answer_temp22;
y = answer_temp12;

answer_temp11 = x*answer_temp11 - y*answer_temp21;
answer_temp12 = x*answer_temp12 - y*answer_temp22;
answer_temp13 = x*answer_temp13 - y*answer_temp23;
answer_temp14 = x*answer_temp14 - y*answer_temp24;
answer_temp15 = x*answer_temp15 - y*answer_temp25;

augment11t = x*augment11t - y*augment21t;
augment12t = x*augment12t - y*augment22t;
augment13t = x*augment13t - y*augment23t;
augment14t = x*augment14t - y*augment24t;
augment15t = x*augment15t - y*augment25t;

x = answer_temp22;
y = answer_temp32;

answer_temp31 = x*answer_temp31 - y*answer_temp21;
answer_temp32 = x*answer_temp32 - y*answer_temp22;
answer_temp33 = x*answer_temp33 - y*answer_temp23;
answer_temp34 = x*answer_temp34 - y*answer_temp24;
answer_temp35 = x*answer_temp35 - y*answer_temp25;

augment31t = x*augment31t - y*augment21t;
augment32t = x*augment32t - y*augment22t;
augment33t = x*augment33t - y*augment23t;
augment34t = x*augment34t - y*augment24t;
augment35t = x*augment35t - y*augment25t;

x = answer_temp22;
y = answer_temp42;

answer_temp41 = x*answer_temp41 - y*answer_temp21;
answer_temp42 = x*answer_temp42 - y*answer_temp22;
answer_temp43 = x*answer_temp43 - y*answer_temp23;
answer_temp44 = x*answer_temp44 - y*answer_temp24;
answer_temp45 = x*answer_temp45 - y*answer_temp25;

augment41t = x*augment41t - y*augment21t;
augment42t = x*augment42t - y*augment22t;
augment43t = x*augment43t - y*augment23t;
augment44t = x*augment44t - y*augment24t;
augment45t = x*augment45t - y*augment25t;

x = answer_temp22;
y = answer_temp52;

answer_temp51 = x*answer_temp51 - y*answer_temp21;
answer_temp52 = x*answer_temp52 - y*answer_temp22;
answer_temp53t = x*answer_temp53t - y*answer_temp23;
answer_temp54t = x*answer_temp54t - y*answer_temp24;
answer_temp55t = x*answer_temp55t - y*answer_temp25;

augment51t = x*augment51t - y*augment21t;
augment52t = x*augment52t - y*augment22t;
augment53t = x*augment53t - y*augment23t;
augment54t = x*augment54t - y*augment24t;
augment55t = x*augment55t - y*augment25t;

x = answer_temp33;
y = answer_temp13;

answer_temp11 = x*answer_temp11 - y*answer_temp31;
answer_temp12 = x*answer_temp12 - y*answer_temp32;
answer_temp13 = x*answer_temp13 - y*answer_temp33;
answer_temp14 = x*answer_temp14 - y*answer_temp34;
answer_temp15 = x*answer_temp15 - y*answer_temp35;

augment11t = x*augment11t - y*augment31t;
augment12t = x*augment12t - y*augment32t;
augment13t = x*augment13t - y*augment33t;
augment14t = x*augment14t - y*augment34t;
augment15t = x*augment15t - y*augment35t;

x = answer_temp33;
y = answer_temp23;

answer_temp21 = x*answer_temp21 - y*answer_temp31;
answer_temp22 = x*answer_temp22 - y*answer_temp32;
answer_temp23 = x*answer_temp23 - y*answer_temp33;
answer_temp24 = x*answer_temp24 - y*answer_temp34;
answer_temp25 = x*answer_temp25 - y*answer_temp35;

augment21t = x*augment21t - y*augment31t;
augment22t = x*augment22t - y*augment32t;
augment23t = x*augment23t - y*augment33t;
augment24t = x*augment24t - y*augment34t;
augment25t = x*augment25t - y*augment35t;

x = answer_temp33;
y = answer_temp43;

answer_temp41 = x*answer_temp41 - y*answer_temp31;
answer_temp42 = x*answer_temp42 - y*answer_temp32;
answer_temp43 = x*answer_temp43 - y*answer_temp33;
answer_temp44 = x*answer_temp44 - y*answer_temp34;
answer_temp45 = x*answer_temp45 - y*answer_temp35;

augment41t = x*augment41t - y*augment31t;
augment42t = x*augment42t - y*augment32t;
augment43t = x*augment43t - y*augment33t;
augment44t = x*augment44t - y*augment34t;
augment45t = x*augment45t - y*augment35t;

x = answer_temp33;
y = answer_temp53t;

answer_temp51 = x*answer_temp51 - y*answer_temp31;
answer_temp52 = x*answer_temp52 - y*answer_temp32;
answer_temp53t = x*answer_temp53t - y*answer_temp33;
answer_temp54t = x*answer_temp54t - y*answer_temp34;
answer_temp55t = x*answer_temp55t - y*answer_temp35;

augment51t = x*augment51t - y*augment31t;
augment52t = x*augment52t - y*augment32t;
augment53t = x*augment53t - y*augment33t;
augment54t = x*augment54t - y*augment34t;
augment55t = x*augment55t - y*augment35t;

x = answer_temp44;
y = answer_temp14;

answer_temp11 = x*answer_temp11 - y*answer_temp41;
answer_temp12 = x*answer_temp12 - y*answer_temp42;
answer_temp13 = x*answer_temp13 - y*answer_temp43;
answer_temp14 = x*answer_temp14 - y*answer_temp44;
answer_temp15 = x*answer_temp15 - y*answer_temp45;

augment11t = x*augment11t - y*augment41t;
augment12t = x*augment12t - y*augment42t;
augment13t = x*augment13t - y*augment43t;
augment14t = x*augment14t - y*augment44t;
augment15t = x*augment15t - y*augment45t;

x = answer_temp44;
y = answer_temp24;

answer_temp21 = x*answer_temp21 - y*answer_temp41;
answer_temp22 = x*answer_temp22 - y*answer_temp42;
answer_temp23 = x*answer_temp23 - y*answer_temp43;
answer_temp24 = x*answer_temp24 - y*answer_temp44;
answer_temp25 = x*answer_temp25 - y*answer_temp45;

augment21t = x*augment21t - y*augment41t;
augment22t = x*augment22t - y*augment42t;
augment23t = x*augment23t - y*augment43t;
augment24t = x*augment24t - y*augment44t;
augment25t = x*augment25t - y*augment45t;

x = answer_temp44;
y = answer_temp34;

answer_temp31 = x*answer_temp31 - y*answer_temp41;
answer_temp32 = x*answer_temp32 - y*answer_temp42;
answer_temp33 = x*answer_temp33 - y*answer_temp43;
answer_temp34 = x*answer_temp34 - y*answer_temp44;
answer_temp35 = x*answer_temp35 - y*answer_temp45;

augment31t = x*augment31t - y*augment41t;
augment32t = x*augment32t - y*augment42t;
augment33t = x*augment33t - y*augment43t;
augment34t = x*augment34t - y*augment44t;
augment35t = x*augment35t - y*augment45t;

x = answer_temp44;
y = answer_temp54t;

answer_temp51 = x*answer_temp51 - y*answer_temp41;
answer_temp52 = x*answer_temp52 - y*answer_temp42;
answer_temp53t = x*answer_temp53t - y*answer_temp43;
answer_temp54t = x*answer_temp54t - y*answer_temp44;
answer_temp55t = x*answer_temp55t - y*answer_temp45;

augment51t = x*augment51t - y*augment41t;
augment52t = x*augment52t - y*augment42t;
augment53t = x*augment53t - y*augment43t;
augment54t = x*augment54t - y*augment44t;
augment55t = x*augment55t - y*augment45t;

x = answer_temp55t;
y = answer_temp15;

answer_temp11 = x*answer_temp11 - y*answer_temp51;
answer_temp12 = x*answer_temp12 - y*answer_temp52;
answer_temp13 = x*answer_temp13 - y*answer_temp53t;
answer_temp14 = x*answer_temp14 - y*answer_temp54t;
answer_temp15 = x*answer_temp15 - y*answer_temp55t;

augment11t = x*augment11t - y*augment51t;
augment12t = x*augment12t - y*augment52t;
augment13t = x*augment13t - y*augment53t;
augment14t = x*augment14t - y*augment54t;
augment15t = x*augment15t - y*augment55t;

x = answer_temp55t;
y = answer_temp25;

answer_temp21 = x*answer_temp21 - y*answer_temp51;
answer_temp22 = x*answer_temp22 - y*answer_temp52;
answer_temp23 = x*answer_temp23 - y*answer_temp53t;
answer_temp24 = x*answer_temp24 - y*answer_temp54t;
answer_temp25 = x*answer_temp25 - y*answer_temp55t;

augment21t = x*augment21t - y*augment51t;
augment22t = x*augment22t - y*augment52t;
augment23t = x*augment23t - y*augment53t;
augment24t = x*augment24t - y*augment54t;
augment25t = x*augment25t - y*augment55t;

x = answer_temp55t;
y = answer_temp35;

answer_temp31 = x*answer_temp31 - y*answer_temp51;
answer_temp32 = x*answer_temp32 - y*answer_temp52;
answer_temp33 = x*answer_temp33 - y*answer_temp53t;
answer_temp34 = x*answer_temp34 - y*answer_temp54t;
answer_temp35 = x*answer_temp35 - y*answer_temp55t;

augment31t = x*augment31t - y*augment51t;
augment32t = x*augment32t - y*augment52t;
augment33t = x*augment33t - y*augment53t;
augment34t = x*augment34t - y*augment54t;
augment35t = x*augment35t - y*augment55t;

x = answer_temp55t;
y = answer_temp45;

answer_temp41 = x*answer_temp41 - y*answer_temp51;
answer_temp42 = x*answer_temp42 - y*answer_temp52;
answer_temp43 = x*answer_temp43 - y*answer_temp53t;
answer_temp44 = x*answer_temp44 - y*answer_temp54t;
answer_temp45 = x*answer_temp45 - y*answer_temp55t;

augment41t = x*augment41t - y*augment51t;
augment42t = x*augment42t - y*augment52t;
augment43t = x*augment43t - y*augment53t;
augment44t = x*augment44t - y*augment54t;
augment45t = x*augment45t - y*augment55t;


if(answer_temp11==32'd0 || answer_temp22 == 32'd0 || answer_temp33 == 32'd0 || answer_temp44==32'd0 || answer_temp55t==32'd0)
begin
	augment11=32'dx;
	augment22=32'dx;
	augment33=32'dx;
	augment44=32'dx;
	augment55=32'dx;
end

else
begin
	augment11 = augment11t;
	augment12 = augment12t;
	augment13 = augment13t;
	augment14 = augment14t;
	augment15 = augment15t;

	augment21 = augment21t;
	augment22 = augment22t;
	augment23 = augment23t;
	augment24 = augment24t;
	augment25 = augment25t;

	augment31 = augment31t;
	augment32 = augment32t;
	augment33 = augment33t;
	augment34 = augment34t;
	augment35 = augment35t;

	augment41 = augment41t;
	augment42 = augment42t;
	augment43 = augment43t;
	augment44 = augment44t;
	augment45 = augment45t;

	augment51 = augment51t;
	augment52 = augment52t;
	augment53 = augment53t;
	augment54 = augment54t;
	augment55 = augment55t;
end


matrix_inverse[0] = augment11;
matrix_inverse[1] = augment12;
matrix_inverse[2] = augment13;
matrix_inverse[3] = augment14;
matrix_inverse[4] = augment15;

matrix_inverse[5] = augment21;
matrix_inverse[6] = augment22;
matrix_inverse[7] = augment23;
matrix_inverse[8] = augment24;
matrix_inverse[9] = augment25;

matrix_inverse[10] = augment31;
matrix_inverse[11] = augment32;
matrix_inverse[12] = augment33;
matrix_inverse[13] = augment34;
matrix_inverse[14] = augment35;

matrix_inverse[15] = augment41;
matrix_inverse[16] = augment42;
matrix_inverse[17] = augment43;
matrix_inverse[18] = augment44;
matrix_inverse[19] = augment45;

matrix_inverse[20] = augment51;
matrix_inverse[21] = augment52;
matrix_inverse[22] = augment53;
matrix_inverse[23] = augment54;
matrix_inverse[24] = augment55;

end

end



wire [31:0] augment11dt,augment12dt,augment13dt,augment14dt,augment15dt;
wire [31:0] augment21dt,augment22dt,augment23dt,augment24dt,augment25dt;
wire [31:0] augment31dt,augment32dt,augment33dt,augment34dt,augment35dt;
wire [31:0] augment41dt,augment42dt,augment43dt,augment44dt,augment45dt;
wire [31:0] augment51dt,augment52dt,augment53dt,augment54dt,augment55dt;

assign augment11d = augment11;
assign augment12d = augment12;
assign augment13d = augment13;
assign augment14d = augment14;
assign augment15d = augment15;

assign augment21d = augment21;
assign augment22d = augment22;
assign augment23d = augment23;
assign augment24d = augment24;
assign augment25d = augment25;

assign augment31d = augment31;
assign augment32d = augment32;
assign augment33d = augment33;
assign augment34d = augment34;
assign augment35d = augment35;

assign augment41d = augment41;
assign augment42d = augment42;
assign augment43d = augment43;
assign augment44d = augment44;
assign augment45d = augment45;

assign augment51d = augment51;
assign augment52d = augment52;
assign augment53d = augment53;
assign augment54d = augment54;
assign augment55d = augment55;

wire [31:0] a,b,c,d,e;

assign a = answer_temp11;
assign b = answer_temp22;
assign c = answer_temp33;
assign d = answer_temp44;
assign e = answer_temp55t;


assign augment11d = augment11dt;
assign augment12d = augment12dt;
assign augment13d = augment13dt;
assign augment14d = augment14dt;
assign augment15d = augment15dt;

assign augment21d = augment21dt;
assign augment22d = augment22dt;
assign augment23d = augment23dt;
assign augment24d = augment24dt;
assign augment25d = augment25dt;

assign augment31d = augment31dt;
assign augment32d = augment32dt;
assign augment33d = augment33dt;
assign augment34d = augment34dt;
assign augment35d = augment35dt;

assign augment41d = augment41dt;
assign augment42d = augment42dt;
assign augment43d = augment43dt;
assign augment44d = augment44dt;
assign augment45d = augment45dt;

assign augment51d = augment51dt;
assign augment52d = augment52dt;
assign augment53d = augment53dt;
assign augment54d = augment54dt;
assign augment55d = augment55dt;

endmodule
