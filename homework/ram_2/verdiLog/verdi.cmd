verdiSetActWin -dock widgetDock_<Watch>
simSetSimulator "-vcssv" -exec "simv" -args \
           "+UVM_TESTNAME=ram_test +UVM_VERBOSITY=UVM_HIGH +ntb_random_seed=1234 -cm line+cond+fsm+tgl+branch+assert -cm_dir coverage.vdb -cm_name sim1"
debImport "-dbdir" "simv.daidir" "-covdir" "coverage.vdb"
debLoadSimResult /home/hedu21/jiwon/homework/ram_2/novas.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "8" "31" "2560" "1369"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiInvokeApp -vdCov
verdiSetActWin -dock widgetDock_<Inst._Tree>
debExit
