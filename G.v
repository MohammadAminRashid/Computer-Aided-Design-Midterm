module G(
    input [7:0] A ,
    input [2:0] y,
    output [7:0] new_A 
    );
    wire [7:0] y_coded;
    decoder d(y,y_coded);

    assign new_A= A & (~y_coded);
    

endmodule