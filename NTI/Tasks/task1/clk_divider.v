
module clk_divider(clk_in , rst ,clk);
input wire clk_in;
input wire rst;
output reg clk;
reg [22:0] clk_in_counter;



always@(posedge  clk_in or negedge rst)

if (!rst)begin
clk <= 0;
clk_in_counter <= 0;
end
else 
if (clk_in_counter == 6249999)begin 
clk_in_counter <= 0;
clk <= ~clk;
end
else 
clk_in_counter <= clk_in_counter+1;


endmodule