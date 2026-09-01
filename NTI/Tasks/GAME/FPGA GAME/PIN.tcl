# ============================================================
# DE10-Standard - 5CSXFC6D6F31C6
# Top module: top
# ============================================================

# -------------------------
# CLOCK
# -------------------------
set_location_assignment PIN_AF14 -to clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to clk


# -------------------------
# PUSH BUTTONS
# KEY[0] -> Reset
# KEY[1] -> Restart
# -------------------------
set_location_assignment PIN_AJ4 -to key_rst_n
set_location_assignment PIN_AK4 -to key_restart_n

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to key_rst_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to key_restart_n


# -------------------------
# SWITCHES SW[9:0]
# -------------------------
set_location_assignment PIN_AB30 -to switch[0]
set_location_assignment PIN_Y27  -to switch[1]
set_location_assignment PIN_AB28 -to switch[2]
set_location_assignment PIN_AC30 -to switch[3]
set_location_assignment PIN_W25  -to switch[4]
set_location_assignment PIN_V25  -to switch[5]
set_location_assignment PIN_AC28 -to switch[6]
set_location_assignment PIN_AD30 -to switch[7]
set_location_assignment PIN_AC29 -to switch[8]
set_location_assignment PIN_AA30 -to switch[9]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to switch[9]


# -------------------------
# LEDs LED[9:0]
# -------------------------
set_location_assignment PIN_AA24 -to led[0]
set_location_assignment PIN_AB23 -to led[1]
set_location_assignment PIN_AC23 -to led[2]
set_location_assignment PIN_AD24 -to led[3]
set_location_assignment PIN_AG25 -to led[4]
set_location_assignment PIN_AF25 -to led[5]
set_location_assignment PIN_AE24 -to led[6]
set_location_assignment PIN_AF24 -to led[7]
set_location_assignment PIN_AB22 -to led[8]
set_location_assignment PIN_AC22 -to led[9]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to led[9]


# ============================================================
# 7-SEGMENT DISPLAY
# seg0 -> HEX0
# seg1 -> HEX1
# seg2 -> HEX2
# seg3 -> HEX3
# ============================================================

# -------------------------
# HEX0 -> seg0
# -------------------------
set_location_assignment PIN_W17 -to seg0[0]
set_location_assignment PIN_V18 -to seg0[1]
set_location_assignment PIN_AG17 -to seg0[2]
set_location_assignment PIN_AG16 -to seg0[3]
set_location_assignment PIN_AH17 -to seg0[4]
set_location_assignment PIN_AG18 -to seg0[5]
set_location_assignment PIN_AH18 -to seg0[6]


# -------------------------
# HEX1 -> seg1
# -------------------------
set_location_assignment PIN_AF16 -to seg1[0]
set_location_assignment PIN_V16  -to seg1[1]
set_location_assignment PIN_AE16 -to seg1[2]
set_location_assignment PIN_AD17 -to seg1[3]
set_location_assignment PIN_AE18 -to seg1[4]
set_location_assignment PIN_AE17 -to seg1[5]
set_location_assignment PIN_V17  -to seg1[6]


# -------------------------
# HEX2 -> seg2
# -------------------------
set_location_assignment PIN_AA21 -to seg2[0]
set_location_assignment PIN_AB17 -to seg2[1]
set_location_assignment PIN_AA18 -to seg2[2]
set_location_assignment PIN_Y17  -to seg2[3]
set_location_assignment PIN_Y18  -to seg2[4]
set_location_assignment PIN_AF18 -to seg2[5]
set_location_assignment PIN_W16  -to seg2[6]


# -------------------------
# HEX3 -> seg3
# -------------------------
set_location_assignment PIN_Y19  -to seg3[0]
set_location_assignment PIN_W19  -to seg3[1]
set_location_assignment PIN_AD19 -to seg3[2]
set_location_assignment PIN_AA20 -to seg3[3]
set_location_assignment PIN_AC20 -to seg3[4]
set_location_assignment PIN_AA19 -to seg3[5]
set_location_assignment PIN_AD20 -to seg3[6]


# -------------------------
# IO STANDARD - 7 SEG
# -------------------------
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg0[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg0[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg0[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg0[6]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg1[6]

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg2[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg2[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg2[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg2[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg2[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg2[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg2[6]



set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg3[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg3[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg3[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg3[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg3[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg3[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to seg3[6]