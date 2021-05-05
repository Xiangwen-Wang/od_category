#!/bin/bash

module load intel
FC=ifort

FOPT="-O2"
#FOPT="-O0 -g -traceback -check all -check bounds -check uninit -ftrapuv -debug all -gen-interfaces -warn all -warn interfaces -fp-stack-check -heap-arrays"

rm -f *.o
rm -f *genmod*

# MODULES: compile to an object (.o) file only
$FC -c $FOPT shared_data.f90


# SUBROUTINES: compile to an object (.o) file only

$FC -c $FOPT driver.f90

$FC -c $FOPT distance_ij.f90
$FC -c $FOPT minimum_distance.f90
$FC -c $FOPT m33det.f90
$FC -c $FOPT m33inv.f90
$FC -c $FOPT find_inv.f90
$FC -c $FOPT aptvang.f90
$FC -c $FOPT aptvunb.f90

# Compile subroutines to compute ave_od_aq 
$FC -c $FOPT run_ave_od_aq_modified.f90
$FC -c $FOPT history_parser_ave_od_aq_modified.f90
$FC -c $FOPT compute_ave_od_aq_modified.f90
$FC -c $FOPT correlation_modified.f90
$FC -c $FOPT avgovertime.f90

# Compile executable file
$FC -o cp2k_od_tester.x *.o

exit 0

