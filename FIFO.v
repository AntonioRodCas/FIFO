/******************************************************************* 
* Name:
*	write_pointer.v
* Description:
* 	This module is write pointer register for the FIFO
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
*	V1.0       01/11/2018
* 
*********************************************************************/
module FIFO
#
(parameter DATA_WIDTH=8, parameter MEM_DEPTH=4,parameter ADDR_WIDTH=CeilLog2(MEM_DEPTH))
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

wire [ADDR_WIDTH-1:0] read_addr_wir;
wire [ADDR_WIDTH-1:0] write_addr_wir;


simple_dual_port_ram_single_clock
#(
	.DATA_WIDTH(DATA_WIDTH),
	.MEM_DEPTH(MEM_DEPTH)
) 
RAM_ints			  					 	//RAM instance
(
	.data(DataInput),
	.read_addr (read_addr_wir),
	.write_addr (write_addr_wir),
	.we(push),
	.clk(clk),
	
	.q(DataOutput)
	
);

write_pointer
#(
	.MEM_DEPTH(MEM_DEPTH)
) 
w_pointer		  					 	//Write Pointer instance
(
	.push(push),
	.clk(clk),
	.reset(reset),
	.full(full),
	
	.write_addr(write_addr_wir)
	
);


read_pointer
#(
	.MEM_DEPTH(MEM_DEPTH)
) 
r_pointer		  					 	//Write Pointer instance
(
	.pop(pop),
	.clk(clk),
	.reset(reset),
	.empty(empty),
	
	.read_addr(read_addr_wir)
	
);

CounterFIFO
#(
	.MEM_DEPTH(MEM_DEPTH)
) 
FIFO_counter		  					 	//FIFO data counter instance
(
	.push(push),
	.pop(pop),
	.clk(clk),
	.reset(reset),
	
	.full(full),
	.empty(empty)
	
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