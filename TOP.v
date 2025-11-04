module TOP(
   input clk,rst,start,
   input [7:0] A0,W0,A1,W1,
    output ready,
    output [15:0] acc_out     
);


    wire load0,load1,load_acc,s,is_first,clear;
    wire done0 , done1;


 data_path dp(clk,rst||clear,load0,load1,load_acc,s,is_first,A0,W0,A1,W1, acc_out,done0,done1);


controller cu(clk,rst,start,done0 , done1, load0,load1,load_acc,s,is_first,ready,clear);



endmodule


