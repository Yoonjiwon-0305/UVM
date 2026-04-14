verdiSetActWin -dock widgetDock_<Watch>
simSetSimulator "-vcssv" -exec "simv" -args \
           "+UVM_TESTNAME=apb_base_test +UVM_VERBOSITY=UVM_HIGH +ntb_random_seed=1234 -cm line+cond+fsm+tgl+branch+assert -cm_dir coverage.vdb -cm_name sim1"
debImport "-dbdir" "simv.daidir"
debLoadSimResult /home/hedu21/jiwon/0410_APB_RAM/novas.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "1281" "31" "1278" "1360"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
debExit
