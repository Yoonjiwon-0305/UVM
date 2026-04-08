verdiWindowResize -win $_vdCoverage_1 "830" "370" "900" "700"
gui_set_pref_value -category {coveragesetting} -key {geninfodumping} -value 1
gui_exclusion -set_force true
verdiSetFont  -font  {DejaVu Sans}  -size  11
verdiSetFont -font "DejaVu Sans" -size "11"
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
verdiSetActWin -dock widgetDock_Message
gui_open_cov  -hier coverage.vdb -testdir {} -test {coverage/test coverage/sim1} -merge MergedTest -db_max_tests 10 -sdc_level 1 -fsm transition
verdiWindowResize -win $_vdCoverage_1 "830" "370" "1015" "709"
verdiWindowResize -win $_vdCoverage_1 "830" "370" "1015" "709"
verdiWindowResize -win $_vdCoverage_1 "1281" "727" "1278" "664"
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {} 
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<CovSrc.1>
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {} 
verdiSetActWin -dock widgetDock_<Summary>
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} -descending  {Name}
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} {Name}
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} -descending  {Name}
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} {Name}
gui_list_sort -id  CoverageTable.1   -list {covtblInstancesList} -descending  {Name}
verdiWindowResize -win $_vdCoverage_1 "1138" "736" "1015" "709"
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::counter_coverage::counter_cg}   }
gui_list_expand -id  CoverageTable.1   -list {covtblFGroupsList} {/$unit::counter_coverage::counter_cg}
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::counter_coverage::counter_cg}   }
verdiSetActWin -dock widgetDock_<CovDetail>
verdiWindowResize -win $_vdCoverage_1 "957" "617" "1559" "709"
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::counter_coverage::counter_cg}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {/$unit::counter_coverage::counter_cg}  -column {Group} 
verdiSetActWin -dock widgetDock_<Summary>
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list {covergroup detail} { max   }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   } -type { {Cover Group} {Cover Group}  }
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   } -type { {Cover Group} {Cover Group}  }
verdiSetActWin -dock widgetDock_<Summary>
verdiWindowResize -win $_vdCoverage_1 "683" "665" "1876" "709"
verdiSetActWin -dock widgetDock_<CovDetail>
verdiSetActWin -dock widgetDock_<Summary>
verdiWindowResize -win $_vdCoverage_1 "490" "671" "1876" "709"
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{off,zero}}   }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{off,zero}}  {{[on],[max]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}  {{[off],[max , high , low]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[off],[max , high , low]}}  {{on,zero}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,zero}}  {{on,low}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{on,low}}  {{[on],[max]}}   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}  {{[off],[max , high , low]}}   }
verdiWindowResize -win $_vdCoverage_1 "490" "608" "1876" "772"
verdiWindowResize -win $_vdCoverage_1 "490" "672" "1876" "708"
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::counter_coverage::counter_cg}  {$unit::counter_coverage::counter_cg.cp_count}   }
verdiSetActWin -dock widgetDock_<Summary>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cp_enable}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_reset_n}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_reset_n}  -column {Group} 
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_reset_n}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_reset_n}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {Group} 
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_rst_en}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_count}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cp_enable}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_enable}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_rst_en}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_count}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cp_enable}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_reset_n}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_reset_n}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_reset_n}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_reset_n}  {$unit::counter_coverage::counter_cg.cp_enable}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_count}   }
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
gui_list_expand -id  CoverageTable.1   -list {covtblStatModuleList} Assert
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} Assertion
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} {Cover Property}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} {Cover Sequence}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertInstList} Total
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} Assertion
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} {Cover Property}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} {Cover Sequence}
gui_list_expand -id  CoverageTable.1   -list {covtblStatAssertDefList} Total
verdiWindowResize -win $_vdCoverage_1 "2" "672" "2364" "708"
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Tests } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cx_rst_en}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_rst_en}  -column {} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_rst_en}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {} 
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<CovSrc.1>
gui_src_highlight_item -id CovSrc.1 -lfrom 234 -idxfrom 8 -fileIdFrom 0 -lto 234 -idxto 17 -fileIdTo 0 -selection {super.new} -selectionId 0 -replace 0
gui_list_select -id CovDetail.1 -list covergroup { {$unit::counter_coverage::counter_cg.cx_rst_en}   } -type { {Cover Group}  }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_reset_n}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_reset_n}  -column {} 
verdiSetActWin -dock widgetDock_<Summary>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_reset_n}  {$unit::counter_coverage::counter_cg.cp_enable}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_count}  -column {} 
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_count}  -column {} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}  {/$unit::counter_coverage::counter_cg}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {/$unit::counter_coverage::counter_cg}  -column {} 
gui_list_select -id CovDetail.1 -list {covergroup detail} { max   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { max   }
verdiSetActWin -dock widgetDock_<CovDetail>
verdiDockWidgetSetCurTab -dock widgetDock_<HvpDetail>
verdiSetActWin -dock widgetDock_<HvpDetail>
verdiDockWidgetSetCurTab -dock widgetDock_<CovDetail>
verdiSetActWin -dock widgetDock_<CovDetail>
verdiDockWidgetSetCurTab -dock widgetDock_<Hvp>
verdiSetActWin -dock widgetDock_<Hvp>
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
verdiDockWidgetSetCurTab -dock widgetDock_<CovSrc.1>
verdiSetActWin -dock widgetDock_<CovSrc.1>
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
gui_list_select -id CoverageTable.1 -list covtblInstancesList { uvm_pkg   }
gui_list_action -id  CoverageTable.1 -list {covtblInstancesList} uvm_pkg  -column {} 
gui_list_select -id CovDetail.1 -list Cover { Total   } -type { {}  }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
gui_src_highlight_item -id CovSrc.1 -lfrom 2014 -idxfrom 4 -fileIdFrom 0 -lto 2014 -idxto 27 -fileIdTo 0 -selection {seq.set_parent_sequence} -selectionId 0 -replace 0
verdiSetActWin -dock widgetDock_<CovSrc.1>
gui_covtable_show -show  { Statistics } -id  CoverageTable.1  -test  MergedTest
verdiSetActWin -dock widgetDock_<Summary>
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {/$unit::counter_coverage::counter_cg}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_reset_n}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_reset_n}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_reset_n}  {$unit::counter_coverage::counter_cg.cx_en_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cx_en_count}  -column {Group} 
gui_list_select -id CovDetail.1 -list {covergroup detail} { {{[on],[max]}}   }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cx_en_count}  {$unit::counter_coverage::counter_cg.cp_enable}   }
verdiSetActWin -dock widgetDock_<Summary>
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_enable}  -column {Group} 
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_enable}  {$unit::counter_coverage::counter_cg.cp_count}   }
gui_list_action -id  CoverageTable.1 -list {covtblFGroupsList} {$unit::counter_coverage::counter_cg.cp_count}  -column {Group} 
gui_list_select -id CovDetail.1 -list {covergroup detail} { max   }
verdiSetActWin -dock widgetDock_<CovDetail>
gui_list_select -id CovDetail.1 -list {covergroup detail} { max  zero   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { zero  max   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { max  low   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { low  high   }
gui_list_select -id CovDetail.1 -list {covergroup detail} { high   }
verdiWindowResize -win $_vdCoverage_1 "8" "672" "2547" "708"
verdiWindowResize -win $_vdCoverage_1 "8" "722" "2547" "658"
verdiWindowResize -win $_vdCoverage_1 "8" "31" "2547" "1360"
verdiWindowResize -win $_vdCoverage_1 "8" "722" "2547" "658"
gui_list_select -id CoverageTable.1 -list covtblFGroupsList { {$unit::counter_coverage::counter_cg.cp_count}   }
verdiSetActWin -dock widgetDock_<Summary>
vdCovExit -noprompt
