
module gray_to_binary (
    input  wire [3:0] gray,
    output wire [3:0] binary
);
    
    integer i;
    reg [3:0] result; 
    
    always @(*) begin
        result[3] = gray[3];
        for (i = 2; i >= 0; i = i - 1) begin
            result[i] = gray[i] ^ result[i + 1];
        end
    end
    
    assign binary = result;
    
endmodule 

