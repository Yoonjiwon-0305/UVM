verdiSetActWin -dock widgetDock_<Watch>
simSetSimulator "-vcssv" -exec "simv" -args \
           "+UVM_VERBOSITY=UVM_HIGH +ntb_random_seed=1234 +UVM_TESTNAME=ram_write_read_test"
debImport "-dbdir" "simv.daidir"
debLoadSimResult /home/hedu21/jiwon/0409_ram/novas.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "1281" "31" "1278" "1360"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBDrag -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvSetPosition -win $_nWave2 {("r_if(ram_if)" 0)}
wvRenameGroup -win $_nWave2 {G1} {r_if(ram_if)}
wvAddSignal -win $_nWave2 "/tb_ram/r_if/clk" "/tb_ram/r_if/wr" \
           "/tb_ram/r_if/addr\[7:0\]" "/tb_ram/r_if/wdata\[15:0\]" \
           "/tb_ram/r_if/rdata\[15:0\]"
wvSetPosition -win $_nWave2 {("r_if(ram_if)" 0)}
wvSetPosition -win $_nWave2 {("r_if(ram_if)" 5)}
wvSetPosition -win $_nWave2 {("r_if(ram_if)" 5)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
verdiInvokeApp -vdCov
debExit
