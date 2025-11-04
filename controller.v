`define A   4'b000             
`define B   4'b001             
`define C   4'b010   
`define D   4'b011                
`define E   4'b100                     
         
module controller(

    input clk,rst,start,done0 , done1,
    output reg load0,load1,load_acc,s,is_first,ready,clear
);

 reg [2:0] pstate;
 reg [2:0] nstate;

 always @(posedge clk or posedge rst) begin
    if (rst)
    pstate <= `A;
    else 
    pstate <= nstate;
 end

always @(pstate or start or done0 or done1) begin
  case (pstate)
    `A:   
    begin 
          if(start==1'b1)
             nstate=`B;
           else
           nstate=`A;  

        end

    `B:    
          nstate=`C;
    `C:      
     	begin
        	if (done0 && done1)
            	nstate = `E;
            else
            	nstate = `D;
        end
    `D: 
        nstate = `C;
    `E:   

    nstate = `A;
  endcase
end


always @(pstate) begin
  {load0,load1,load_acc,s,is_first,ready,clear} = 7'b0;
  case (pstate)
    `A: begin
        clear=1;
    end

    `B: begin
        s=0;
        load0=1;
        load1=1;
        is_first=1;
    end

    `C: begin
	
    end

    `D: begin
 	load_acc=1;
    s=1;
    load0=1;
    load1=1;

    end

    `E: begin
        ready=1;
    end
  endcase

end
 
endmodule