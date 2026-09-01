module sev_seg (
    input  wire       clk,
    input  wire       rst,
    input  wire [3:0] value,
    output reg  [6:0] seg,
    output reg        dp
);
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        seg <= 7'b111_1111;
        dp  <= 1'b1;
    end
    else begin
        dp <= 1'b1;
        case (value)
            4'd0: seg <= 7'b100_0000;
            4'd1: seg <= 7'b111_1001;
            4'd2: seg <= 7'b010_0100;
            4'd3: seg <= 7'b011_0000;
            4'd4: seg <= 7'b001_1001;
            4'd5: seg <= 7'b001_0010;
            4'd6: seg <= 7'b000_0010;
            4'd7: seg <= 7'b111_1000;
            4'd8: seg <= 7'b000_0000;
            4'd9: seg <= 7'b001_0000;
            4'd10: seg <= 7'b000_0000;
            4'd11: seg <= 7'b100_0000;
            4'd12: seg <= 7'b001_0010;
            4'd13: seg <= 7'b100_0111;
            4'd14: seg <= 7'b000_1100;
            default: seg <= 7'b111_1111;
        endcase
    end
end
endmodule
