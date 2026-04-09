verdiWindowResize -win $_vdCoverage_1 "0" "23" "2560" "1369"
gui_set_pref_value -category {coveragesetting} -key {geninfodumping} -value 1
gui_exclusion -set_force true
verdiSetFont  -font  {DejaVu Sans}  -size  11
verdiSetFont -font "DejaVu Sans" -size "11"
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
verdiSetActWin -dock widgetDock_<CovDetail>
gui_open_cov  -hier coverage.vdb -testdir  {coverage.vdb} -test { coverage/sim1 } -merge MergedTest -db_max_tests 10 -sdc_level 1 -fsm transition
gui_set_pref_value -category {ColumnCfg} -key {covtblAssertList_Match} -value {false}
gui_set_pref_value -category {ColumnCfg} -key {covtblAssertList_Success} -value {false}
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_list_select -id CoverageTable.1 -list covtblModulesList { /uvm_pkg   } -type { Module  }
gui_list_expand -id  CoverageTable.1   -list {covtblModulesList} /uvm_pkg
gui_list_expand -id CoverageTable.1   /uvm_pkg
gui_list_action -id  CoverageTable.1 -list {covtblModulesList} /uvm_pkg  -type {Module}  -column {} 
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::ram_coverage::ram_cg}   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} {/$unit::ram_coverage::ram_cg}
gui_list_expand -id CoverageTable.1   {/$unit::ram_coverage::ram_cg}
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {/$unit::ram_coverage::ram_cg}  -column {Group} 
verdiWindowResize -win $_vdCoverage_1 "474" "31" "2094" "1369"
verdiWindowResize -win $_vdCoverage_1 "607" "319" "1633" "1119"
verdiSetActWin -dock widgetDock_<CovDetail>
verdiSetActWin -dock widgetDock_<Summary>
verdiDockWidgetSetCurTab -dock widgetDock_<RMSERVER>
verdiSetActWin -dock widgetDock_<RMSERVER>
verdiDockWidgetSetCurTab -dock widgetDock_<ExclMgr>
verdiSetActWin -dock widgetDock_<ExclMgr>
verdiDockWidgetSetCurTab -dock widgetDock_<RMSERVER>
verdiSetActWin -dock widgetDock_<RMSERVER>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::ram_coverage::ram_cg}  {$unit::ram_coverage::ram_cg.cx_rst_write}   }
verdiSetActWin -dock widgetDock_<Summary>
verdiDockWidgetSetCurTab -dock widgetDock_<ExclMgr>
verdiSetActWin -dock widgetDock_<ExclMgr>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::ram_coverage::ram_cg.cx_rst_write}  {$unit::ram_coverage::ram_cg.cp_wdata}   }
verdiSetActWin -dock widgetDock_<Summary>
gui_list_set_filter -id ExclMgr.1 -list {exclMgrList} -text {"$unit::ram_coverage::ram_cg.cp_wdata"}
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::ram_coverage::ram_cg.cp_wdata}  {$unit::ram_coverage::ram_cg.cp_write}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::ram_coverage::ram_cg.cp_write}  {$unit::ram_coverage::ram_cg.cx_write_addr}   }
vdCovExit -noprompt
