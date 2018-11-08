/******************************************************************* 
* Name:
*	CounterFIFO.v
* Description:
* 	This module is the counter of data in the FIFO
* Inputs:
*	push: Push signal  
*	pop: Pop signal
*  reset: Reset input line
*	clk: Input Clock signal
* Outputs:
* 	Full: Full flag output
*	Empty: Empty flag output
* Versión:  
*	1.0
* Author: 
*	José Antonio Rodríguez Castañeda  md193781
* Date :
*	V1.0       02/11/2018
* 
*********************************************************************/
module CounterFIFO
#
(parameter MEM_DEPTH=4,parameter Count=CeilLog2(MEM_DEPTH))
(
	input push, 
	input pop,
	input clk,
	input reset,
	
	output full,
	output empty

);

reg [Count:0] counter;

always@(posedge clk or negedge reset) begin
	if(reset == 1'b0) 											//reset
		counter <= 0;
	else if (push) begin										//push 
			counter <= counter + 1;
		end
		else if (pop) begin
			counter <= counter - 1;
		end
		else
			counter <= counter;

end

assign full = (counter >= MEM_DEPTH ) ? 1'b1 : 1'b0;
assign empty = (counter == 0 ) ? 1'b1 : 1'b0;



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