module stream_parity_gen (
    input  wire clk,
    input  wire reset,
    input  wire serial_in,
    output wire parity_out
);
reg [7:0] shift_reg;
function parity_calc;
        input [7:0] data;
        integer i;
        reg parity;
        begin
            parity = 0;
            for (i = 0; i < 8; i = i + 1)
                parity = parity ^ data[i]; 
            parity_calc = parity; 
        end
    endfunction

    always @(posedge clk) begin
        if (reset)
            shift_reg <= 8'b0;
        else
            shift_reg <= {shift_reg[6:0], serial_in};
    end

    assign parity_out = parity_calc(shift_reg);

endmodule
