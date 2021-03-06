
module FIFO_TB;

	// Parameter Declarations
parameter Word_Length = 16;
parameter Depth_Of_FIFO = 8;

// Input Ports
reg clk;
reg reset;
reg pop;
reg push;
reg [Word_Length-1:0] DataInput;

// Output Ports
wire full;
wire empty;
wire [Word_Length-1:0] DataOutput;



/********************* Device Under Verification **************/
FIFO

#(
	// Parameter Declarations
	.DATA_WIDTH(Word_Length),
	.MEM_DEPTH(Depth_Of_FIFO)
)
DUV
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.pop(pop),
	.push(push),
	.DataInput(DataInput),

	// Output Ports
	.full(full),
	.empty(empty),
	.DataOutput(DataOutput)
);

/**************************************************************************/
	
/******************** Stimulus *************************/
initial // Clock generator
  begin
    clk = 1'b0;
    forever #2 clk = !clk;
  end
/*----------------------------------------------------------------------------------------*/
initial begin /*Reset*/
	# 0 reset = 1'b0;
	#3 reset = 1'b1;
end
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0 pop  = 1'b0;
	# 80 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	
	# 176 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
	# 4 pop  = 1'b1;
	# 4 pop  = 1'b0;
end 
/*----------------------------------------------------------------------------------------*/
initial begin 
	# 0  push = 0;
	# 10  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	
	# 128  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
	# 4  push = 1'b1;
	# 4  push = 0;
end
/*----------------------------------------------------------------------------------------*/ 
initial begin
	# 0  DataInput = 1'b0;
	# 8  DataInput = 16;
	# 4  DataInput = 5;
	# 4  DataInput = 4;
	# 4  DataInput = 3;
	# 4  DataInput = 0;
	# 4  DataInput = 2;
	# 4  DataInput = 0;
	# 4  DataInput = 1;
	# 4  DataInput = 0;
	# 4  DataInput = 2;
	# 4  DataInput = 0;
	# 4  DataInput = 3;
	
	# 128  DataInput = 1;
	# 4  DataInput = 3;
	# 4  DataInput = 5;
	# 4  DataInput = 7;
	# 4  DataInput = 0;
	# 4  DataInput = 9;
	# 4  DataInput = 0;
	# 4  DataInput = 10;
	# 4  DataInput = 0;
	# 4  DataInput = 11;
	# 4  DataInput = 0;
	# 4  DataInput = 12;
	
	
end


/*--------------------------------------------------------------------*/



endmodule
 
 
/*************************************************************/
/*************************************************************/

 