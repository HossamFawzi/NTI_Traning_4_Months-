
module seven_seg (
    input  wire [3:0] B,
    output reg  [6:0] H  // Active-low output (0 = segment ON, 1 = segment OFF)
);

    always @(*) begin
        casex (B)
            4'd0:    H = 7'b1000000; // 0 (turns on a,b,c,d,e,f; turns off g)
            4'd1:    H = 7'b1111001; // 1 (turns on b,c)
            4'd2:    H = 7'b0100100; // 2
            4'd3:    H = 7'b0110000; // 3
            4'd4:    H = 7'b0011001; // 4
            4'd5:    H = 7'b0010010; // 5
            4'd6:    H = 7'b0000010; // 6
            4'd7:    H = 7'b1111000; // 7
            4'd8:    H = 7'b0000000; // 8 (all segments on)
            4'd9:    H = 7'b0010000; // 9
            default: H = 7'b1111111; // Blank display for inputs A-F
        endcase
    end

endmodule

