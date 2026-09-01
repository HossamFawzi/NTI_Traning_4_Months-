module game_controller_tb;
    output  reg clk,
    output  reg rst,
    output  reg [9:0] switch,led,
	input wire start	
);




game_controller dut(
	.clk(clk),
    .rst(rst),
    .led(led),
	.switch(switch),
	.start(start)
);


initial 
begin
clk =0 ;
forever #10 clk = ~clk ;
end


initial begin
$monitor("time=%0t rst=%b led=%b start=%b switch=%b", $time, rst, led, start,switch);

rst = 0;
#50 rst =1 ;

#5000
$finish;
end
/*
// next state logic
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        //led       <= 10'b1000000000; 
        state <= IDEL;
		 
    end else begin
        if (state == IDEL) begin
            if (led == switch ) begin
                state <= PLAY;
			
				
            end else begin
				state <= IDEL;
				//led <= 10'b0000010000;
               // led <= led >> 1;
            end
        end/* else begin
            if (led == 10'b1000000000) begin
                direction <= RIGHT;
                led       <= led >> 1;
            end else begin
                led <= led << 1;
            end
        end*/
    end
end

//output logic

always @(*)
 begin
 case (state)

	IDEL : start<= 0 ;

	 PLAY: start<= 1 ;

	BOSS : start<= 1 ;

	LOSE : start<= 0;
	
	endcase 



end

*/

endmodule
