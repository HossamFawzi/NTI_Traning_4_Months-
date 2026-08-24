module ANDGate (a ,b , c ) ; //using NAND 
 input wire  a , b ;
 wire c_wire;
 output c;
 assign c_wire = a !& b ;
 assign c = c_wire !& (a !& b); 
endmodule 

