`timescale 1ns / 1ps



module Matrix_Inversion_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] address;

	// Outputs
	wire [31:0] augment11;
	wire [31:0] augment12;
	wire [31:0] augment13;
	wire [31:0] augment14;
	wire [31:0] augment15;
	wire [31:0] augment21;
	wire [31:0] augment22;
	wire [31:0] augment23;
	wire [31:0] augment24;
	wire [31:0] augment25;
	wire [31:0] augment31;
	wire [31:0] augment32;
	wire [31:0] augment33;
	wire [31:0] augment34;
	wire [31:0] augment35;
	wire [31:0] augment41;
	wire [31:0] augment42;
	wire [31:0] augment43;
	wire [31:0] augment44;
	wire [31:0] augment45;
	wire [31:0] augment51;
	wire [31:0] augment52;
	wire [31:0] augment53;
	wire [31:0] augment54;
	wire [31:0] augment55;
	wire [31:0] augment11d;
	wire [31:0] augment12d;
	wire [31:0] augment13d;
	wire [31:0] augment14d;
	wire [31:0] augment15d;
	wire [31:0] augment21d;
	wire [31:0] augment22d;
	wire [31:0] augment23d;
	wire [31:0] augment24d;
	wire [31:0] augment25d;
	wire [31:0] augment31d;
	wire [31:0] augment32d;
	wire [31:0] augment33d;
	wire [31:0] augment34d;
	wire [31:0] augment35d;
	wire [31:0] augment41d;
	wire [31:0] augment42d;
	wire [31:0] augment43d;
	wire [31:0] augment44d;
	wire [31:0] augment45d;
	wire [31:0] augment51d;
	wire [31:0] augment52d;
	wire [31:0] augment53d;
	wire [31:0] augment54d;
	wire [31:0] augment55d;
	
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Matrix_Inversion uut (
		.clk(clk), 
		.address(address),
		.data_out(data_out),
		.reset(reset),
		.augment11(augment11), 
		.augment12(augment12), 
		.augment13(augment13), 
		.augment14(augment14), 
		.augment15(augment15), 
		.augment21(augment21), 
		.augment22(augment22), 
		.augment23(augment23), 
		.augment24(augment24), 
		.augment25(augment25), 
		.augment31(augment31), 
		.augment32(augment32), 
		.augment33(augment33), 
		.augment34(augment34), 
		.augment35(augment35), 
		.augment41(augment41), 
		.augment42(augment42), 
		.augment43(augment43), 
		.augment44(augment44), 
		.augment45(augment45), 
		.augment51(augment51), 
		.augment52(augment52), 
		.augment53(augment53), 
		.augment54(augment54), 
		.augment55(augment55), 
		.augment11d(augment11d), 
		.augment12d(augment12d), 
		.augment13d(augment13d), 
		.augment14d(augment14d), 
		.augment15d(augment15d), 
		.augment21d(augment21d), 
		.augment22d(augment22d), 
		.augment23d(augment23d), 
		.augment24d(augment24d), 
		.augment25d(augment25d), 
		.augment31d(augment31d), 
		.augment32d(augment32d), 
		.augment33d(augment33d), 
		.augment34d(augment34d), 
		.augment35d(augment35d), 
		.augment41d(augment41d), 
		.augment42d(augment42d), 
		.augment43d(augment43d), 
		.augment44d(augment44d), 
		.augment45d(augment45d), 
		.augment51d(augment51d), 
		.augment52d(augment52d), 
		.augment53d(augment53d), 
		.augment54d(augment54d), 
		.augment55d(augment55d)
	);
	
	always #100 clk = ~clk;

	initial 
	begin
		clk = 0;
		reset=0;
		
		#50;
		address = 5'd0;
		
		#200;
		address = 5'd1;
		
		#200;
		address = 5'd2;
		
		#200;
		address = 5'd3;
		
		#200;
		address = 5'd4;
		
		#200;
		address = 5'd5;
		
		#200;
		address = 5'd6;
		
		#200;
		address = 5'd7;
		
		#200;
		address = 5'd8;
		#200;
		address = 5'd9;
		#200;
		address = 5'd10;
		#200;
		address = 5'd11;
		#200;
		address = 5'd12;
		
		#200;
		address = 5'd13;
		
		#200;
		address = 5'd14;
		#200;
		address = 5'd15;
		#200;
		address = 5'd16;
		#200;
		address = 5'd17;
		#200;
		address = 5'd18;
		#200;
		address = 5'd19;
		#200;
		address = 5'd20;
		#200;
		address = 5'd21;
		#200;
		address = 5'd22;
		#200;
		address = 5'd23;
		#200;
		address = 5'd24;
		#200;
		address = 5'd25;
		#200;
		reset=1'b1;
		#200;
		
		reset=1'b0;
		
	end
      
endmodule

