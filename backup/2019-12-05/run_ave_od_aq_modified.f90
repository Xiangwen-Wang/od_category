!----------------------------------------!
SUBROUTINE run_ave_od_aq_modified ()	 !
!----------------------------------------!

USE shared_data

IMPLICIT NONE

INTEGER :: nstep
INTEGER :: nw

CHARACTER(LEN=8) :: atm_1
CHARACTER(LEN=8) :: atm_2
CHARACTER(LEN=8) :: atm_3
CHARACTER(LEN=8) :: atm_4
CHARACTER(LEN=8) :: atm_w1
CHARACTER(LEN=8) :: atm_w2
CHARACTER(LEN=8) :: atm_w3
CHARACTER(LEN=8) :: atm_w4
CHARACTER(LEN=8) :: atm_w5
CHARACTER(LEN=8) :: atm_w6
CHARACTER(LEN=8) :: atm_w7
CHARACTER(LEN=8) :: atm_w8
CHARACTER(LEN=8) :: atm_w9
CHARACTER(LEN=8) :: atm_w10
CHARACTER(LEN=8) :: atm_w11
CHARACTER(LEN=8) :: atm_w12
CHARACTER(LEN=8) :: atm_w13
CHARACTER(LEN=8) :: atm_w14
CHARACTER(LEN=8) :: atm_w15
CHARACTER(LEN=8) :: atm_w16
CHARACTER(LEN=8) :: atm_w17
CHARACTER(LEN=8) :: atm_w18

!Cell parameters and geometric criteria of water molecule and ion hydration

REAL(KIND=dbl) :: a_x, a_y, a_z
REAL(KIND=dbl) :: b_x, b_y, b_z
REAL(KIND=dbl) :: c_x, c_y, c_z
REAL(KIND=dbl) :: rcut_mg_o_1
REAL(KIND=dbl) :: rcut_mg_o_2
REAL(KIND=dbl) :: rcut_cl_h_1
REAL(KIND=dbl) :: rcut_cl_h_2
REAL(KIND=dbl) :: rcut_ohw

!Statistical parameter to average correlation function

INTEGER :: naverage !Number of averaging pts
INTEGER :: offset !Indendent offset to make time origin sets (should be lesser than total nstep/naverage)
INTEGER :: skip !Number of skipping pts (should be factor of nstep/naverage)

INTEGER :: istat

! Open 'PARAM' file and read the control parameters
OPEN (UNIT=8, FILE='PARAM_AVE_OD', STATUS='old', action='READ', iostat=istat)
IF (istat == 0) THEN
    	READ(8,*) nstep
	READ(8,*) atm_1, atm_2, atm_3, atm_4 ! cation, anion, oxygen, hydrogen
	READ(8,*) a_x, a_y, a_z
	READ(8,*) b_x, b_y, b_z
	READ(8,*) c_x, c_y, c_z
	READ(8,*) rcut_mg_o_1 ! cation hydration criteria - from 1st minimum of M+ -- O RDF
	READ(8,*) rcut_mg_o_2 ! cation hydration criteria (2nd shell) - from 2nd minimum of M+ -- O RDF
	READ(8,*) rcut_cl_h_1 ! anion hydration criteria - from 1st minimum of X- -- H RDF 
	READ(8,*) rcut_cl_h_2 ! anion hydration criteria (2nd shell) - from 2nd minimum of X- -- H RDF
	READ(8,*) rcut_ohw
	READ(8,*) naverage
	READ(8,*) nw
	READ(8,*) offset
	READ(8,*) skip
	READ(8,*) atm_w1, atm_w2, atm_w3, atm_w4, atm_w5, atm_w6, atm_w7, atm_w8, atm_w9, atm_w10, atm_w11, atm_w12, atm_w13, atm_w14, atm_w15, atm_w16, atm_w17, atm_w18
	WRITE(*,*) atm_w1, atm_w2, atm_w3, atm_w4, atm_w5, atm_w6, atm_w7, atm_w8, atm_w9, atm_w10, atm_w11, atm_w12, atm_w13, atm_w14, atm_w15, atm_w16, atm_w17, atm_w18

	CALL history_parser_ave_od_aq_modified (nstep, nw, atm_1, atm_2, atm_3, atm_4, &
				 	        a_x, a_y, a_z, &
				 	        b_x, b_y, b_z, &
				 	        c_x, c_y, c_z, &
				 	        rcut_mg_o_1, rcut_mg_o_2, &
				                rcut_cl_h_1, rcut_cl_h_2, rcut_ohw, naverage, offset, skip, atm_w1, &
					        atm_w2, atm_w3, atm_w4, atm_w5, atm_w6, atm_w7, atm_w8, &
					        atm_w9, atm_w10, atm_w11, atm_w12, atm_w13, atm_w14, atm_w15, atm_w16, atm_w17, atm_w18)
ELSE
	WRITE (*,1000) istat
	1000 FORMAT (' ', 'Error opening file PARAM_AVE_OD = ', i6)
ENDIF

END SUBROUTINE run_ave_od_aq_modified

