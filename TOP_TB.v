`timescale 1ns/1ns

module Top_TB;
    reg clk , rst , start ;
    reg [7:0] A0,W0,A1,W1;
    wire ready;
    wire [15:0] acc_out;

 TOP top(clk,rst,start, A0,W0,A1,W1,ready,acc_out);



    
    always #5 clk = ~clk;

    initial begin
        A0=8'd10;
        W0=8'd10;
        A1=8'd7;
        W1=8'd12;
        clk=0;
        rst = 1;
        start = 0;
        #12 rst = 0;
        start = 1;
        #12
        start = 0;
        #600
        A0=8'd19;
        W0=8'd25;
        A1=8'd68;
        W1=8'd25;
        start=1;
        #20
        start=0;
        #400
       A0=8'd53;
        W0=8'd97;
        A1=8'd37;
        W1=8'd69;
        start=1;
        #20
        start=0;
        #400
        A0=8'd112;
        W0=8'd97;
        A1=8'd98;
        W1=8'd69;
        start=1;
        #20
        start=0;
        #400
         A0=8'd127;
        W0=8'd55;
        A1=8'd63;
        W1=8'd47;
        start=1;
        #20
        start=0;
        #400
        A0=8'd0;
        W0=8'd51;
        A1=8'd64;
        W1=8'd42;
        start=1;
        #20
        start=0;
        #400

        $finish;
    end

endmodule





