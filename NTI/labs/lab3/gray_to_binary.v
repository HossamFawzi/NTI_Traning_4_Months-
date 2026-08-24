module gray_to_binary #(
parameter N = 4 
)(
    input  [N-1:0] G ,
    output [N-1:0] B
);

  assign  B[3] = G[3];
  assign  B[2] = G[3] ^  G[2];
  assign  B[1] = B[2] ^  G[1];
  assign  B[0] = B[1] ^  G[0];
  

endmodule



