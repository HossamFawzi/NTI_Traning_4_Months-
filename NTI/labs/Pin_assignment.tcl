# -------------------------------------------------------------------------- #
# Pin Assignments for DE10-Standard Board
# -------------------------------------------------------------------------- #

# Inputs: grey_in[3:0] mapped to Slide Switches SW3 to SW0
set_location_assignment PIN_AC30 -to grey_in[3]
set_location_assignment PIN_AB28 -to grey_in[2]
set_location_assignment PIN_Y27  -to grey_in[1]
set_location_assignment PIN_AB30 -to grey_in[0]

# Outputs: seg_out_n[6:0] mapped to 7-Segment Display HEX0
set_location_assignment PIN_AH18 -to seg_out_n[6]
set_location_assignment PIN_AG18 -to seg_out_n[5]
set_location_assignment PIN_AH17 -to seg_out_n[4]
set_location_assignment PIN_AG16 -to seg_out_n[3]
set_location_assignment PIN_AG17 -to seg_out_n[2]
set_location_assignment PIN_V18  -to seg_out_n[1]
set_location_assignment PIN_W17  -to seg_out_n[0]

# I/O Standards (Optional but recommended to avoid warnings)
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to grey_in[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to grey_in[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to grey_in[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to grey_in[0]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg_out_n[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg_out_n[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg_out_n[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg_out_n[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg_out_n[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg_out_n[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg_out_n[0]