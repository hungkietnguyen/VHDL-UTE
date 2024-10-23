setMode -bs
setMode -bs
setMode -bs
setCable -port auto
Identify -inferir 
identifyMPM 
assignFile -p 1 -file "C:/.Xilinx/BAI_635_DEM_3SO_HT_LCD_SO_TO _XVN/dem_3so_ht_lcd_so_to_xvn.bit"
Program -p 1 
setMode -bs
setMode -bs
deleteDevice -position 1
deleteDevice -position 1
setMode -bs
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
