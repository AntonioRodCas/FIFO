/******************************************************************* 
* Name:
*	simple_dual_port_ram_single_clock.v
* Description:
* 	This module is a parameterized RAM blocks
*  data: Parallel input data 
*	read_addr: Read Address input 
*  write_addr: Write Address input
*  we: Write Enable input line
*	clk: Input Clock signal
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
module simple_dual_port_ram_single_clock
#
(parameter DATA_WIDTH=8, parameter MEM_DEPTH=4, parameter ADDR_WIDTH=CeilLog2(MEM_DEPTH))
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] read_addr, 
	input [(ADDR_WIDTH-1):0]	write_addr,
	input we, 
	input clk,
	
	output [(DATA_WIDTH-1):0] q
);


reg [DATA_WIDTH-1:0] ram [MEM_DEPTH-1:0];

always @(posedge clk)
begin
	if (we)
		ram[write_addr] <= data;
	//q <= ram[read_addr]; 
end


assign q = ram[read_addr];

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
