module top_gray_to_sev(gray , H );
input wire [3:0] gray;
output reg  [6:0] H;
wire [3:0] binary 

gray_to_binary GtoB_1(
.gray(gray),
.binary(binary)
);

seven_seg Sev_Seg_1 (
.B(B),
.H(H)
);

GtoB_1 (gray , binary);
Sev_Seg_1 (binary,H);




endmodule