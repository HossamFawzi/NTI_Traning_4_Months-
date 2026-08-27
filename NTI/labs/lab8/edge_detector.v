module edge_detector (clk,rst,in,tick_moore,tick_meely);
input wire clk,rst,in;

output reg tick_moore,tick_meely;  
  localparam low    = 2'b00;
  localparam Rising = 2'b01;
  localparam High   = 2'b01;
  localparam Faling = 2'b01 
  localparam Double_edge = 2'b01;

  reg [1:0] Current_state, next_state;

  always @(posedge clk or negedge rst) begin
    if (!rst) Current_state <= low;
    else Current_state <= next_state;
  end

  
  always @(*) begin
    next_state = Current_state;
    case (Current_state)
	  low: begin
        if (in == 1'b0 ) begin
          next_state = low;
          tick_moore = low;
          tick_meely = low;
          
        end 
		else if (in == 1'b1) begin
         next_state = low;
         tick_moore = low;
          tick_meely = low;
        end 
      end
      Rising: begin
        if (in == 1'b1) begin
          next_state = Rising;
          tick_moore = low;
          tick_meely = high;
        end else if (in == 1'b0) begin
          next_state = low;
          tick_moore = low;
          tick_meely = low;
        end
      end
      High: begin
        if (in == 1'b1) begin
          next_state = High;
          tick_moore = low;
          tick_meely = low;
        end else if (in == 1'b0) begin
          next_state = low;
          tick_moore = low;
          tick_meely = low;
          
        end
      end
	  Faling: begin
        if (in == 1'b1) begin
          next_state = Faling;
          tick_moore = low;
          tick_meely = low;
        end else if (in == 1'b0) begin
          next_state = low;
        end
      end
      default: begin
        next_state = low;
      end
    endcase
  end

  always @(*) begin
    
    tick_meely = 1'b0;
    tick_moore = 1'b0;

    case (Current_state)  
      low: begin
        
      tick_meely = 1'b0;
	   	tick_moore = 1'b0;

      end

      Rising:
      begin
      tick_meely = 1'b1;
		  tick_moore = 1'b0;
      end

      High: 
      begin
      tick_meely = 1'b0;
	   	tick_moore = 1'b0;
      end
      
	   Faling: 
	   begin
     tick_meely = 1'b0;
		 tick_moore = 1'b0;
      end
      
	   Double_edge: 
	   begin
     tick_meely = 1'b0;
		 tick_moore = 1'b0;
      end

      default: begin
        tick_moore = 1'b0;
        tick_meely = 1'b0;
      end
    endcase
  end

endmodule 