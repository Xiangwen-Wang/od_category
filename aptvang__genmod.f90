        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:21 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE APTVANG__genmod
          INTERFACE 
            SUBROUTINE APTVANG(AX,AY,AZ,BX,BY,BZ,COSTH,NERR)
              REAL(KIND=8), INTENT(IN) :: AX
              REAL(KIND=8), INTENT(IN) :: AY
              REAL(KIND=8), INTENT(IN) :: AZ
              REAL(KIND=8), INTENT(IN) :: BX
              REAL(KIND=8), INTENT(IN) :: BY
              REAL(KIND=8), INTENT(IN) :: BZ
              REAL(KIND=8), INTENT(OUT) :: COSTH
              INTEGER(KIND=4), INTENT(OUT) :: NERR
            END SUBROUTINE APTVANG
          END INTERFACE 
        END MODULE APTVANG__genmod
