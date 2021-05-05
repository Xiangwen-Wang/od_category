        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:21 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE APTVUNB__genmod
          INTERFACE 
            SUBROUTINE APTVUNB(AX,AY,AZ,NP,TOL,UX,UY,UZ,VLEN,NERR)
              INTEGER(KIND=4), INTENT(IN) :: NP
              REAL(KIND=8), INTENT(IN) :: AX(NP)
              REAL(KIND=8), INTENT(IN) :: AY(NP)
              REAL(KIND=8), INTENT(IN) :: AZ(NP)
              REAL(KIND=8), INTENT(IN) :: TOL
              REAL(KIND=8), INTENT(OUT) :: UX(NP)
              REAL(KIND=8), INTENT(OUT) :: UY(NP)
              REAL(KIND=8), INTENT(OUT) :: UZ(NP)
              REAL(KIND=8), INTENT(OUT) :: VLEN(NP)
              INTEGER(KIND=4), INTENT(OUT) :: NERR
            END SUBROUTINE APTVUNB
          END INTERFACE 
        END MODULE APTVUNB__genmod
