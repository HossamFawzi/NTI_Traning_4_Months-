`timescale 1ns/1ps

module debouncing_circuit_tb;

reg clk;
reg rst;
reg sw;
reg m_tick;
wire out;

debouncing_circuit #(
    .clk_in(50_000),
    .TICK(100)
) dut (
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .m_tick(m_tick),
    .out(out)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk; 
end

initial begin
    $monitor("time=%0t rst=%b sw=%b out=%b", $time, rst, sw, out);

    rst = 0;
    sw  = 0;
    m_tick = 0;

    #100 rst = 1; 

    #200 sw = 1;
    #30  sw = 0;
    #30  sw = 1;
    #30  sw = 0;
    #200 sw = 1; // stable press
	#60000 rst = 0;
    #100000 $finish;
end

endmodule
