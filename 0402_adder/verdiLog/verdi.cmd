verdiFindBar -show
simSetSimulator "-vcssv" -exec "./simv" -args
debImport "-dbdir" "./simv.daidir"
debLoadSimResult /home/hedu21/jiwon/0402_adder/wave.fsdb
wvCreateWindow
verdiSetActWin -win $_nWave2
verdiWindowResize -win $_Verdi_1 "1281" "31" "1278" "1360"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "tb_adder.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBDrag -win $_nTrace1
wvAddSignal -win $_nWave2 "tb_adder/dut/a\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/b\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/y\[8:0\]"
wvSetPosition -win $_nWave2 {("dut" 0)}
wvRenameGroup -win $_nWave2 {G1} {dut}
wvUnknownSaveResult -win $_nWave2 -clear
wvSetCursor -win $_nWave2 564.168937
verdiSetActWin -win $_nWave2
srcHBDrag -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvAddSignal -win $_nWave2 "tb_adder/dut/a\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/b\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/y\[8:0\]"
wvSetPosition -win $_nWave2 {("dut#1" 0)}
wvRenameGroup -win $_nWave2 {dut} {dut#1}
wvUnknownSaveResult -win $_nWave2 -clear
srcHBDrag -win $_nTrace1
wvAddSignal -win $_nWave2 "tb_adder/dut/a\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/b\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/y\[8:0\]"
wvSetPosition -win $_nWave2 {("dut" 0)}
wvRenameGroup -win $_nWave2 {dut#1} {dut}
wvUnknownSaveResult -win $_nWave2 -clear
wvSetCursor -win $_nWave2 1082.470481
verdiSetActWin -win $_nWave2
srcHBSelect "tb_adder.dut" -win $_nTrace1
srcSetScope "tb_adder.dut" -delim "." -win $_nTrace1
srcHBDrag -win $_nTrace1
wvAddSignal -win $_nWave2 "tb_adder/dut/a\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/b\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/y\[8:0\]"
wvSetPosition -win $_nWave2 {("dut#1" 0)}
wvRenameGroup -win $_nWave2 {dut} {dut#1}
srcHBDrag -win $_nTrace1
wvAddSignal -win $_nWave2 "tb_adder/dut/a\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/b\[7:0\]"
wvAddSignal -win $_nWave2 "tb_adder/dut/y\[8:0\]"
wvSetPosition -win $_nWave2 {("dut" 0)}
wvRenameGroup -win $_nWave2 {dut#1} {dut}
srcHBSelect "tb_adder" -win $_nTrace1
srcSetScope "tb_adder" -delim "." -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcTBInvokeSim
verdiSetActWin -dock widgetDock_<Member>
verdiDockWidgetSetCurTab -dock windowDock_nWave_2
verdiSetActWin -win $_nWave2
srcTBRunSim
srcTBSimReset
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "tb_adder.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBDrag -win $_nTrace1
wvDumpScope "tb_adder.dut"
wvSetPosition -win $_nWave2 {("dut#1" 0)}
wvRenameGroup -win $_nWave2 {dut} {dut#1}
wvAddSignal -win $_nWave2 "/tb_adder/dut/a\[7:0\]" "/tb_adder/dut/b\[7:0\]" \
           "/tb_adder/dut/y\[8:0\]"
wvSetPosition -win $_nWave2 {("dut#1" 0)}
wvSetPosition -win $_nWave2 {("dut#1" 3)}
wvSetPosition -win $_nWave2 {("dut#1" 3)}
srcTBRunSim
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
verdiSetActWin -dock widgetDock_<Inst._Tree>
wvSelectSignal -win $_nWave2 {( "dut#1" 2 )} 
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut#1" 3 )} 
wvSelectSignal -win $_nWave2 {( "dut#1" 2 )} 
wvSelectSignal -win $_nWave2 {( "dut#1" 1 )} 
wvSelectGroup -win $_nWave2 {G2}
wvSetCursor -win $_nWave2 18116.591928 -snap {("G2" 0)}
srcHBSelect "tb_adder.dut" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcTBAddBrkPnt -line 13 -file /home/hedu21/jiwon/0402_adder/tb_adder.sv
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {16 16 1 7 1 1}
srcTBAddBrkPnt -line 16 -file /home/hedu21/jiwon/0402_adder/tb_adder.sv
srcSelect -win $_nTrace1 -range {15 15 1 7 1 1}
srcTBAddBrkPnt -line 15 -file /home/hedu21/jiwon/0402_adder/tb_adder.sv
srcSelect -win $_nTrace1 -range {16 16 1 7 1 1}
srcTBSetBrkPnt -disable -index 1
srcSelect -win $_nTrace1 -range {16 16 1 7 1 1}
srcTBSetBrkPnt -delete -index 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "a" -line 3 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "b" -line 4 -pos 1 -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
srcSetScope "tb_adder" -delim "." -win $_nTrace1
srcHBSelect "tb_adder" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
srcSelect -signal "a" -line 3 -pos 1 -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcTBInsertDataTree -win $_nTrace1 -tab 1 -tree "tb_adder.a\[7:0\]"
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "b" -line 4 -pos 1 -win $_nTrace1
srcAction -pos 3 9 0 -win $_nTrace1 -name "b" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "b" -line 4 -pos 1 -win $_nTrace1
srcTBInsertDataTree -win $_nTrace1 -tab 1 -tree "tb_adder.b\[7:0\]"
srcDeselectAll -win $_nTrace1
srcSelect -signal "y" -line 5 -pos 1 -win $_nTrace1
wvSetPosition -win $_nWave2 {("dut#1" 0)}
wvSetPosition -win $_nWave2 {("dut#1" 1)}
wvSetPosition -win $_nWave2 {("dut#1" 2)}
wvSetPosition -win $_nWave2 {("dut#1" 3)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("dut#1" 0)}
srcTBInsertDataTree -win $_nTrace1 -tab 1 -tree "tb_adder.y\[8:0\]"
verdiSetActWin -dock widgetDock_<Watch>
srcTBSimReset
srcTBRunSim
wvSelectSignal -win $_nWave2 {( "dut#1" 1 )} 
verdiSetActWin -win $_nWave2
wvSelectSignal -win $_nWave2 {( "dut#1" 2 )} 
wvSelectSignal -win $_nWave2 {( "dut#1" 3 )} 
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
verdiDockWidgetSetCurTab -dock windowDock_InteractiveConsole_3
verdiSetActWin -win $_InteractiveConsole_3
viaLogViewerGoToTime -logID 5 -next -window "$_InteractiveConsole_3"
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcTBStepNext
srcSelect -win $_nTrace1 -range {15 15 1 7 1 1}
srcTBSetBrkPnt -disable -index 1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcSelect -win $_nTrace1 -range {15 15 1 7 1 1}
srcTBSetBrkPnt -delete -index 1
srcSelect -win $_nTrace1 -range {15 15 1 7 1 1}
srcTBAddBrkPnt -line 15 -file /home/hedu21/jiwon/0402_adder/tb_adder.sv
srcSelect -win $_nTrace1 -range {15 15 1 7 1 1}
srcTBSetBrkPnt -disable -index 2
srcSelect -win $_nTrace1 -range {15 15 1 7 1 1}
srcTBSetBrkPnt -delete -index 2
srcSelect -win $_nTrace1 -range {17 17 1 14 1 1}
srcTBAddBrkPnt -line 17 -file /home/hedu21/jiwon/0402_adder/tb_adder.sv
srcAction -pos 16 0 0 -win $_nTrace1 -name "	" -ctrlKey off
verdiSetActWin -dock widgetDock_<Inst._Tree>
nsMsgSwitchTab -tab general
debExit
