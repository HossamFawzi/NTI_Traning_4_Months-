module one_hot_tb(
    input  wire clk,
    input  wire rst,
    output reg [9:0] led
);
reg direction;
localparam RIGHT = 1'b0;
localparam LEFT  = 1'b1;

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        led       <= 10'b1000000000; 
        direction <= RIGHT;
    end else begin
        if (direction == RIGHT) begin
            if (led == 10'b0000000001) begin
                direction <= LEFT;
                led       <= led << 1;
            end else begin
                led <= led >> 1;
            end
        end else begin
            if (led == 10'b1000000000) begin
                direction <= RIGHT;
                led       <= led >> 1;
            end else begin
                led <= led << 1;
            end
        end
    end
end

endmodule
