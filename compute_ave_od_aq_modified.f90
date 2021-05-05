!-------------------------------------------------------------------------------------------!
SUBROUTINE   compute_ave_od_aq_modified (atmnam_wc ,nwaters, nstep, ini, skip, atm_w1, atm_w2, atm_w3, atm_w4, atm_w5, atm_w6, atm_w7, atm_w8, atm_w9, atm_w10, atm_w11, atm_w12, atm_w13,&
				atm_w14, atm_w15, atm_w16, atm_w17, atm_w18, mux, muy, muz, tcf_auto_all, tcf_cross_all)
	
!-------------------------------------------------------------------------------------------!

USE shared_data

IMPLICIT NONE

!------------------------------------------------!
! Declare calling parameter types & definitions	 !
!------------------------------------------------!

INTEGER, INTENT(IN) :: nwaters, nstep, ini, skip  

CHARACTER(LEN=8), INTENT(IN) :: atm_w1
CHARACTER(LEN=8), INTENT(IN) :: atm_w2
CHARACTER(LEN=8), INTENT(IN) :: atm_w3
CHARACTER(LEN=8), INTENT(IN) :: atm_w4
CHARACTER(LEN=8), INTENT(IN) :: atm_w5
CHARACTER(LEN=8), INTENT(IN) :: atm_w6
CHARACTER(LEN=8), INTENT(IN) :: atm_w7
CHARACTER(LEN=8), INTENT(IN) :: atm_w8
CHARACTER(LEN=8), INTENT(IN) :: atm_w9
CHARACTER(LEN=8), INTENT(IN) :: atm_w10
CHARACTER(LEN=8), INTENT(IN) :: atm_w11
CHARACTER(LEN=8), INTENT(IN) :: atm_w12
CHARACTER(LEN=8), INTENT(IN) :: atm_w13
CHARACTER(LEN=8), INTENT(IN) :: atm_w14
CHARACTER(LEN=8), INTENT(IN) :: atm_w15
CHARACTER(LEN=8), INTENT(IN) :: atm_w16
CHARACTER(LEN=8), INTENT(IN) :: atm_w17
CHARACTER(LEN=8), INTENT(IN) :: atm_w18

CHARACTER(LEN=8), INTENT(IN), DIMENSION(nstep,nwaters) :: atmnam_wc
REAL(KIND=dbl), INTENT(IN), DIMENSION(nstep,nwaters) ::mux
REAL(KIND=dbl), INTENT(IN), DIMENSION(nstep,nwaters) ::muy
REAL(KIND=dbl), INTENT(IN), DIMENSION(nstep,nwaters) ::muz

!------------------------------------------------!
! Declare local parameter types & definitions	 !
!------------------------------------------------!


REAL(KIND=dbl), INTENT(OUT), DIMENSION(18, nstep) :: tcf_auto_all, tcf_cross_all

REAL(KIND=dbl), DIMENSION(1,nstep) :: tcf_auto
REAL(KIND=dbl), DIMENSION(1,nstep) :: tcf_cross



CALL correlation_modified(atmnam_wc, atm_w1, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(1,:) = tcf_auto(1,:)
!tcf_cross_all(1,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0

CALL correlation_modified(atmnam_wc, atm_w2, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(2,:) = tcf_auto(1,:)
!tcf_cross_all(2,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w3, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(3,:) = tcf_auto(1,:)
!tcf_cross_all(3,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w4, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(4,:) = tcf_auto(1,:)
!tcf_cross_all(4,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w5, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(5,:) = tcf_auto(1,:)
!tcf_cross_all(5,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w6, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(6,:) = tcf_auto(1,:)
!tcf_cross_all(6,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w7, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(7,:) = tcf_auto(1,:)
!tcf_cross_all(7,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w8, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(8,:) = tcf_auto(1,:)
!tcf_cross_all(8,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w9, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(9,:) = tcf_auto(1,:)
!tcf_cross_all(9,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w10, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(10,:) = tcf_auto(1,:)
!tcf_cross_all(10,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w11, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(11,:) = tcf_auto(1,:)
!tcf_cross_all(11,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w12, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(12,:) = tcf_auto(1,:)
!tcf_cross_all(12,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w13, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(13,:) = tcf_auto(1,:)
!tcf_cross_all(13,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w14, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(14,:) = tcf_auto(1,:)
!tcf_cross_all(14,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w15, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(15,:) = tcf_auto(1,:)
!tcf_cross_all(15,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w16, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(16,:) = tcf_auto(1,:)
!tcf_cross_all(16,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w17, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(17,:) = tcf_auto(1,:)
!tcf_cross_all(17,:) = tcf_cross(1,:)
tcf_auto = 0
!tcf_cross = 0



CALL correlation_modified(atmnam_wc, atm_w18, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)

tcf_auto_all(18,:) = tcf_auto(1,:)
!tcf_cross_all(18,:) = tcf_cross(1,:)


101 FORMAT (I9, F8.5)
201 FORMAT (a8, I9)
END SUBROUTINE compute_ave_od_aq_modified
