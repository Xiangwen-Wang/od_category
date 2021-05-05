        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:21 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE MINIMUM_DISTANCE__genmod
          INTERFACE 
            SUBROUTINE MINIMUM_DISTANCE(R_I,R_J,H,R_IJ,D_IJ)
              REAL(KIND=8), INTENT(IN) :: R_I(3)
              REAL(KIND=8), INTENT(IN) :: R_J(3)
              REAL(KIND=8), INTENT(IN) :: H(3,3)
              REAL(KIND=8), INTENT(OUT) :: R_IJ(3)
              REAL(KIND=8), INTENT(OUT) :: D_IJ
            END SUBROUTINE MINIMUM_DISTANCE
          END INTERFACE 
        END MODULE MINIMUM_DISTANCE__genmod
