module top_gray_to_sev (
    input  wire [3:0] grey_in,   
    output wire [6:0] H   
);

    wire [3:0] binary;

    // Instantiate Gray to Binary converter
    gray_to_binary GtoB_1 (
        .gray_in(grey_in),
        .binary(binary)
    );

    // Instantiate 7-Segment Decoder
    seven_seg Sev_Seg_1 (
        .B(binary),
        .H(H)
    );

endmodule


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


module gray_to_binary (
    input  wire [3:0] gray_in,
    output wire [3:0] binary
);
    
    integer i;
    reg [3:0] result; 
    
    always @(*) begin
        result[3] = gray_in[3];
        for (i = 2; i >= 0; i = i - 1) begin
            result[i] = gray_in[i] ^ result[i + 1];
        end
    end
    
    assign binary = result;
    
endmodule 


module gray_to_binary_tb();
    
    reg  [3:0] gray_in;
    wire [3:0] binary;
    
    // Explicit port mapping for standard Verilog compatibility
    gray_to_binary dut (
        .gray(gray),
        .binary(binary)
    );
    
    initial begin
        gray_in = 4'b1110;
        #10 gray_in = 4'b0100;
        #10 gray_in = 4'b1100;
        #10 $stop;
    end
    
endmodule