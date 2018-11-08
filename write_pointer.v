/******************************************************************* 
* Name:
*	write_pointer.v
* Description:
* 	This module is write pointer register for the FIFO
* Inputs:
*	push: Push signal  
*  reset: Reset input line
*	clk: Input Clock signal
*  full: Full flag input
* Outputs:
* 	write_addr: Write Address pointer
* Versión:  
*	1.0
* Author: 
*	José Antonio Rodríguez Castañeda  md193781
* Date :
*	V1.0       01/11/2018
* 
*********************************************************************/
module write_pointer
#
(parameter MEM_DEPTH=4,parameter ADDR_WIDTH=CeilLog2(MEM_DEPTH))
(
	input push, 
	input clk,
	input reset,
	input full,
	
	output reg [(ADDR_WIDTH-1):0] write_addr
);


always@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 											//reset
		write_addr <= 0;
	else if (push) begin										//push 
			if(write_addr == (MEM_DEPTH-1))
				write_addr <= 0;
			else
				write_addr <= write_addr + 1;
		end
		else
			write_addr <= write_addr;

end



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