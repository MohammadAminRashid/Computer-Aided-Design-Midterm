module LOD(
    input [7:0] a,
    output reg [2:0] y
);
  wire [7:0] in_encoder;
  assign in_encoder[0]=a[0] && !a[7] && !a[6] && !a[5] && !a[4] && !a[3] && !a[2] && !a[1];
  assign in_encoder[1]=a[1] && !a[7] && !a[6] && !a[5] && !a[4] && !a[3] && !a[2];
  assign in_encoder[2]=a[2] && !a[7] && !a[6] && !a[5] && !a[4] && !a[3];
  assign in_encoder[3]=a[3] && !a[7] && !a[6] && !a[5] && !a[4];
  assign in_encoder[4]=a[4] && !a[7] && !a[6] && !a[5];
  assign in_encoder[5]=a[5] && !a[7] && !a[6];
  assign in_encoder[6]=a[6] && !a[7];
  assign in_encoder[7]=a[7];
    always @(in_encoder) begin
        case (in_encoder)
            8'b10000000: y = 3'd7;
            8'b01000000: y = 3'd6;
            8'b00100000: y = 3'd5;
            8'b00010000: y = 3'd4;
            8'b00001000: y = 3'd3;
            8'b00000100: y = 3'd2;
            8'b00000010: y = 3'd1;
            8'b00000001: y = 3'd0;
            default:y = 3'd0; 
        endcase
    end

endmodule
