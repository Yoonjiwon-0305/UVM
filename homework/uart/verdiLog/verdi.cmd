simSetSimulator "-vcssv" -exec "simv" -args \
           "+UVM_TESTNAME=uart_base_test +UVM_VERBOSITY=UVM_MEDIUM +ntb_random_seed=1234 -cm line+cond+fsm+tgl+branch+assert -cm_dir coverage.vdb -cm_name sim1"
debImport "-dbdir" "simv.daidir"
debLoadSimResult /home/hedu21/jiwon/homework/uart/novas.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "1281" "31" "1278" "1360"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBDrag -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvSetPosition -win $_nWave2 {("dut" 0)}
wvRenameGroup -win $_nWave2 {G1} {dut}
wvAddSignal -win $_nWave2 "/tb_uart/dut/clk" "/tb_uart/dut/reset" \
           "/tb_uart/dut/tx_start" "/tb_uart/dut/tx_data\[7:0\]" \
           "/tb_uart/dut/tx_busy" "/tb_uart/dut/tx_done" "/tb_uart/dut/tx" \
           "/tb_uart/dut/rx" "/tb_uart/dut/rx_data\[7:0\]" \
           "/tb_uart/dut/rx_done"
wvSetPosition -win $_nWave2 {("dut" 0)}
wvSetPosition -win $_nWave2 {("dut" 10)}
wvSetPosition -win $_nWave2 {("dut" 10)}
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
debExit
osition -win $_nWave2 {("dut" 0)}
wvSetPosition -win $_nWave2 {("dut" 1)}
wvSetPosition -win $_nWave2 {("dut" 2)}
wvSetPosition -win $_nWave2 {("dut" 3)}
wvSetPosition -win $_nWave2 {("dut" 4)}
wvSetPosition -win $_nWave2 {("dut" 5)}
wvSetPosition -win $_nWave2 {("dut" 6)}
wvSetPosition -win $_nWave2 {("dut" 7)}
wvSetPosition -win $_nWave2 {("dut" 8)}
wvSetPosition -win $_nWave2 {("dut" 9)}
wvSetPosition -win $_nWave2 {("dut" 10)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("u_if(uart_if)" 0)}
wvRenameGroup -win $_nWave2 {G2} {u_if(uart_if)}
wvAddSignal -win $_nWave2 "/tb_uart/u_if/clk" "/tb_uart/u_if/reset" \
           "/tb_uart/u_if/tx_start" "/tb_uart/u_if/tx_data\[7:0\]" \
           "/tb_uart/u_if/tx_busy" "/tb_uart/u_if/tx_done" "/tb_uart/u_if/tx" \
           "/tb_uart/u_if/rx" "/tb_uart/u_if/rx_data\[7:0\]" \
           "/tb_uart/u_if/rx_done"
wvSetPosition -win $_nWave2 {("u_if(uart_if)" 0)}
wvSetPosition -win $_nWave2 {("u_if(uart_if)" 10)}
wvSetPosition -win $_nWave2 {("u_if(uart_if)" 10)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSelectSignal -win $_nWave2 {( "dut" 7 )} 
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut" 6 )} 
wvZoomAll -win $_nWave2
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
debExit
