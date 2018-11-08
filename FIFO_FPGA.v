/******************************************************************* 
* Name:
*	FIFO_FPGA.v
* Description:
* 	This module is a FIFO implementation in the FPGA
* Inputs:
*	push: Push signal  
*  reset: Reset input line
*	clk: Input Clock signal
*  full
* Outputs:
* 	q: Output parallel data
* Versión:  
*	1.0
* Author: 
*	José Antonio Rodríguez Castañeda  md193781
* Date :
*	V1.0       07/11/2018
* 
*********************************************************************/
module FIFO_FPGA
#
(parameter DATA_WIDTH=8, parameter MEM_DEPTH=8,parameter ADDR_WIDTH=CeilLog2(MEM_DEPTH))
(
	input [DATA_WIDTH-1:0] DataInput, 
	input clk,
	input reset,
	input push,
	input pop,
	
	output [(DATA_WIDTH-1):0] DataOutput,
	output full,
	output empty
);

wire push_wir;
wire pop_wir;

wire push_inv;
wire pop_inv;

assign push_inv = ~push;
assign pop_inv = ~pop;


FIFO
#(
	.DATA_WIDTH(DATA_WIDTH),
	.MEM_DEPTH(MEM_DEPTH)
) 
FIFO_FPGA_MOD			  					 	//FIFO instance instance
(
	.DataInput(DataInput), 
	.clk(clk),
	.reset(reset),
	.push(push_wir),
	.pop(pop_wir),
	
	.DataOutput(DataOutput),
	.full(full),
	.empty(empty)
	
);


One_Shot
 ShotModule_push
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Start(push_inv),

	// Output Ports
	.Shot(push_wir)
);

One_Shot
 ShotModule_pop
(
	// Input Ports
	.clk(clk),
	.reset(reset),
	.Start(pop_inv),

	// Output Ports
	.Shot(pop_wir)
);



//----------------------------------------------------------
   
 /*Log Function*/
     function integer CeilLog2;
       input integer data;
       integer i,result;
       begin
          for(i=0; 2**i < data; i=i+1)
             result = i + 1;
          CeilLog2 = result;
       end
    endfunction

//-----------------------------------------------------------

endmodule