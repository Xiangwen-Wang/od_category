        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:23 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE CORRELATION_MODIFIED__genmod
          INTERFACE 
            SUBROUTINE CORRELATION_MODIFIED(ATMNAM_WC,WATERNAM,NWATERS, &
     &NSTEP,INI,SKIP,MUX,MUY,MUZ,TCF_AUTO,TCF_CROSS)
              INTEGER(KIND=4), INTENT(IN) :: NSTEP
              INTEGER(KIND=4), INTENT(IN) :: NWATERS
              CHARACTER(LEN=8), INTENT(IN) :: ATMNAM_WC(NSTEP,NWATERS)
              CHARACTER(LEN=8), INTENT(IN) :: WATERNAM
              INTEGER(KIND=4), INTENT(IN) :: INI
              INTEGER(KIND=4), INTENT(IN) :: SKIP
              REAL(KIND=8), INTENT(IN) :: MUX(NSTEP,NWATERS)
              REAL(KIND=8), INTENT(IN) :: MUY(NSTEP,NWATERS)
              REAL(KIND=8), INTENT(IN) :: MUZ(NSTEP,NWATERS)
              REAL(KIND=8), INTENT(OUT) :: TCF_AUTO(1,NSTEP)
              REAL(KIND=8), INTENT(OUT) :: TCF_CROSS(1,NSTEP)
            END SUBROUTINE CORRELATION_MODIFIED
          END INTERFACE 
        END MODULE CORRELATION_MODIFIED__genmod
