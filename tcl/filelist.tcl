#------------------------------------------------------------
# Do NOT arbitrarily change the order of files. Some module
# and macro definitions may be needed by the subsequent files
#------------------------------------------------------------

set basejump_stl_dir       $::env(BASEJUMP_STL_DIR)
set bsg_designs_target_dir $::env(BSG_DESIGNS_TARGET_DIR)

set bsg_packaging_dir $::env(BSG_PACKAGING_DIR)
set bsg_package       $::env(BSG_PACKAGE)
set bsg_pinout        $::env(BSG_PINOUT)
set bsg_padmapping    $::env(BSG_PADMAPPING)

set SVERILOG_SOURCE_FILES [join "
    $bsg_designs_target_dir/v/bsg_chip_pkg.v

    $basejump_stl_dir/bsg_misc/bsg_adder_ripple_carry.v
    $basejump_stl_dir/bsg_misc/bsg_dff.v
    $basejump_stl_dir/bsg_misc/bsg_mul_synth.v

    $bsg_designs_target_dir/v/bsg_chip.v
"]

