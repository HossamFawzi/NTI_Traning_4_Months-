module edge_detector (
    input  wire clk,
    input  wire rst,
    input  wire in,
    output wire press
);
reg in_d;
always @(posedge clk or negedge rst) begin
    if (!rst)
        in_d <= 1'b0;
    else
        in_d <= in;
end
assign press = in & ~in_d;
endmodule