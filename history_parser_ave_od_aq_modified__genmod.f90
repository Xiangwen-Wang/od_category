        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:22 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE HISTORY_PARSER_AVE_OD_AQ_MODIFIED__genmod
          INTERFACE 
            SUBROUTINE HISTORY_PARSER_AVE_OD_AQ_MODIFIED(NSTEP,NW,ATM_1,&
     &ATM_2,ATM_3,ATM_4,A_X,A_Y,A_Z,B_X,B_Y,B_Z,C_X,C_Y,C_Z,RCUT_MG_O_1,&
     &RCUT_MG_O_2,RCUT_CL_H_1,RCUT_CL_H_2,RCUT_OHW,NAVERAGE,OFFSET,SKIP,&
     &ATM_W1,ATM_W2,ATM_W3,ATM_W4,ATM_W5,ATM_W6,ATM_W7,ATM_W8,ATM_W9,   &
     &ATM_W10,ATM_W11,ATM_W12,ATM_W13,ATM_W14,ATM_W15,ATM_W16,ATM_W17,  &
     &ATM_W18)
              INTEGER(KIND=4), INTENT(IN) :: NAVERAGE
              INTEGER(KIND=4), INTENT(IN) :: NW
              INTEGER(KIND=4), INTENT(IN) :: NSTEP
              CHARACTER(LEN=8), INTENT(IN) :: ATM_1
              CHARACTER(LEN=8), INTENT(IN) :: ATM_2
              CHARACTER(LEN=8), INTENT(IN) :: ATM_3
              CHARACTER(LEN=8), INTENT(IN) :: ATM_4
              REAL(KIND=8), INTENT(IN) :: A_X
              REAL(KIND=8), INTENT(IN) :: A_Y
              REAL(KIND=8), INTENT(IN) :: A_Z
              REAL(KIND=8), INTENT(IN) :: B_X
              REAL(KIND=8), INTENT(IN) :: B_Y
              REAL(KIND=8), INTENT(IN) :: B_Z
              REAL(KIND=8), INTENT(IN) :: C_X
              REAL(KIND=8), INTENT(IN) :: C_Y
              REAL(KIND=8), INTENT(IN) :: C_Z
              REAL(KIND=8), INTENT(IN) :: RCUT_MG_O_1
              REAL(KIND=8), INTENT(IN) :: RCUT_MG_O_2
              REAL(KIND=8), INTENT(IN) :: RCUT_CL_H_1
              REAL(KIND=8), INTENT(IN) :: RCUT_CL_H_2
              REAL(KIND=8), INTENT(IN) :: RCUT_OHW
              INTEGER(KIND=4), INTENT(IN) :: OFFSET
              INTEGER(KIND=4), INTENT(IN) :: SKIP
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W1
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W2
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W3
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W4
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W5
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W6
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W7
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W8
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W9
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W10
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W11
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W12
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W13
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W14
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W15
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W16
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W17
              CHARACTER(LEN=8), INTENT(IN) :: ATM_W18
            END SUBROUTINE HISTORY_PARSER_AVE_OD_AQ_MODIFIED
          END INTERFACE 
        END MODULE HISTORY_PARSER_AVE_OD_AQ_MODIFIED__genmod
