module encoder16to4 #(
    parameter N = 16 
)(
    input  wire [N-1:0] in,
    output reg  [N-13:0] out
);
  /*
  encoder4to2 00 (a0 , a1 , a2 , a3 ,v0);
  encoder4to2 01(a4 , a5 , a6 , a7 ,v1);
  encoder4to2 10 (a8 , a9 , a10 , a11 , v2);
  encoder4to2 11 (a12 , a13 , a14 , a15 , v3);
  encoder4to2 o_p_decoders (v0 , v1 , v2 , v3 ,V);
   */
   always@(*)
   begin
    if(in[16 ])out =16 ;
    else if (in[15])out =15 ;
    else if (in[14])out =14 ;
    else if (in[13])out =13 ;
    else if(in[12])out =12 ;
    else if (in[11])out =11 ;
    else if (in[10])out =10 ;
    else if (in[9])out =9 ;
    else if(in[8])out =8 ;
    else if (in[7])out =7 ;
    else if (in[6])out =6 ;
    else if (in[5])out =5 ;
    else if(in[4])out =4 ;
    else if (in[3])out =3 ;
    else if (in[2])out =2 ;
    else if (in[1])out =1 ;
    else if (in[0])out =0 ;
    
end
endmodule 
/*
module encoder4to2 #(
    parameter N = 4
)(
    input  wire [N-1:0] in,
    output reg  [N-3:0] out
);

always @(*) begin
    out = 0;
    if (in[3])out =3 ;
    elseif (in[2])out =2 ;
    elseif (in[1])out =1 ;
    elseif (in[0])out =0 ;
    
    else
end



endmodule

*/ 