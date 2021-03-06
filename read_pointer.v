/******************************************************************* 
* Name:
*	read_pointer.v
* Description:
* 	This module is read pointer for the read address
*  pop: Pop input signal
*	read_addr: Read Address input 
*  reset: Reset input signal
*	clk: Input Clock signal
*	empty: Empty flag input
* Outputs:
* 	read_addr: Read address pointer
* Versión:  
*	1.0
* Author: 
*	José Antonio Rodríguez Castañeda  md193781
* Date :
*	V1.0       01/11/2018
* 
*********************************************************************/
module read_pointer
#
(parameter MEM_DEPTH=4,parameter ADDR_WIDTH=CeilLog2(MEM_DEPTH))
(
	input pop, 
	input clk,
	input reset,
	input empty,
	
	output reg [(ADDR_WIDTH-1):0] read_addr
);


always@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 											//reset
		read_addr <= 0;
	else if (pop) begin										//push 
			if(read_addr == (MEM_DEPTH-1))
				read_addr <= 0;
			else
				read_addr <= read_addr + 1;
		end
		else
			read_addr <= read_addr;

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