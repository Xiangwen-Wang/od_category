        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:23 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE AVGOVERTIME__genmod
          INTERFACE 
            SUBROUTINE AVGOVERTIME(NAVERAGE,NSTEP,CORR,CORR_AVG)
              INTEGER(KIND=4), INTENT(IN) :: NSTEP
              INTEGER(KIND=4), INTENT(IN) :: NAVERAGE
              REAL(KIND=8), INTENT(IN) :: CORR(NAVERAGE,NSTEP)
              REAL(KIND=8), INTENT(OUT) :: CORR_AVG(1,NSTEP)
            END SUBROUTINE AVGOVERTIME
          END INTERFACE 
        END MODULE AVGOVERTIME__genmod
