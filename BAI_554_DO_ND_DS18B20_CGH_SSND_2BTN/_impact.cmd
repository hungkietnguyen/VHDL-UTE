setMode -bs
setMode -bs
setMode -bs
setCable -port auto
Identify -inferir 
identifyMPM 
assignFile -p 1 -file "C:/.Xilinx/BAI_554_DO_ND_DS18B20_CGH_SSND_2BTN/do_nd_ds18b20_cgh_ssnd_2btn.bit"
Program -p 1 
assignFile -p 1 -file "C:/.Xilinx/BAI_553_DO_ND_DS18B20_DEM_NP_8BIT_HT7D/do_nd_ds18b20_dem_np_8bit_ht7d.bit"
Identify -inferir 
identifyMPM 
assignFile -p 1 -file "C:/.Xilinx/BAI_553_DO_ND_DS18B20_DEM_NP_8BIT_HT7D/do_nd_ds18b20_dem_np_8bit_ht7d.bit"
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
