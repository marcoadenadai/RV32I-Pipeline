view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/processador/CLK 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/processador/RESET 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/processador/RESET 
WaveCollapseAll -1
wave clipboard restore
