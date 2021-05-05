        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:20 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE DISTANCE_IJ__genmod
          INTERFACE 
            SUBROUTINE DISTANCE_IJ(A_X,A_Y,A_Z,B_X,B_Y,B_Z,C_X,C_Y,C_Z, &
     &RX,RY,RZ,NATMS,NATMS_1,NATMS_2,D_ATMS_12)
              INTEGER(KIND=4), INTENT(IN) :: NATMS_2
              INTEGER(KIND=4), INTENT(IN) :: NATMS_1
              INTEGER(KIND=4), INTENT(IN) :: NATMS
              REAL(KIND=8), INTENT(IN) :: A_X
              REAL(KIND=8), INTENT(IN) :: A_Y
              REAL(KIND=8), INTENT(IN) :: A_Z
              REAL(KIND=8), INTENT(IN) :: B_X
              REAL(KIND=8), INTENT(IN) :: B_Y
              REAL(KIND=8), INTENT(IN) :: B_Z
              REAL(KIND=8), INTENT(IN) :: C_X
              REAL(KIND=8), INTENT(IN) :: C_Y
              REAL(KIND=8), INTENT(IN) :: C_Z
              REAL(KIND=8), INTENT(IN) :: RX(2,NATMS)
              REAL(KIND=8), INTENT(IN) :: RY(2,NATMS)
              REAL(KIND=8), INTENT(IN) :: RZ(2,NATMS)
              REAL(KIND=8), INTENT(OUT) :: D_ATMS_12(NATMS_1,NATMS_2)
            END SUBROUTINE DISTANCE_IJ
          END INTERFACE 
        END MODULE DISTANCE_IJ__genmod
