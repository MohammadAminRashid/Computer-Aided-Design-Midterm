module data_path (
input clk,rst,load0,load1,load_acc,s,is_first,
input [7:0] A0,W0,A1,W1,
output [15:0] acc_out,
output done0,done1
);


wire[7:0] A0_out,A1_out , par_load0 , par_load1 , new_A0 , new_A1;
wire[15:0] adder_out , P0 , P1 ,mult0_out , mult1_out;
wire [2:0] y0 , y1 ;

  register #(8) A0Reg (clk,load0,rst , par_load0 , A0_out );
  register #(8) A1Reg (clk ,load1,rst ,  par_load1 ,A1_out );

  assign done0 = !(|A0_out);
  assign done1 = !(|A1_out);

  LOD lod0(A0_out,y0);
  LOD lod1(A1_out,y1);

  mult mult0({{8{1'b0}},W0} , y0 , mult0_out);
  mult mult1({{8{1'b0}},W1} , y1 , mult1_out);

  mux2to1 #(16) mux0(mult0_out,16'b0 , done0 , P0);
  mux2to1 #(16) mux1(mult1_out,16'b0 , done1 , P1);
  adder4 #(16) adder (P0 , P1 , 16'b0 , acc_out,adder_out);

  register #(16) Accumulator (clk ,load_acc ,rst , adder_out , acc_out );

  mux4to1 #(8) mux_A0_src (A0,new_A0,8'b0,8'b0 ,{done0&&(!is_first),s} , par_load0);
  mux4to1 #(8) mux_A1_src (A1,new_A1,8'b0,8'b0 ,{done1&&(!is_first),s}, par_load1);


  G g0 (A0_out, y0,new_A0);
  G g1 (A1_out, y1,new_A1);
  
endmodule

