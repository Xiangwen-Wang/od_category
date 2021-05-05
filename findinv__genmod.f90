        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:21 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE FINDINV__genmod
          INTERFACE 
            SUBROUTINE FINDINV(MATRIX,INVERSE,N,ERRORFLAG)
              INTEGER(KIND=4), INTENT(IN) :: N
              REAL(KIND=4), INTENT(IN) :: MATRIX(N,N)
              REAL(KIND=4), INTENT(OUT) :: INVERSE(N,N)
              INTEGER(KIND=4), INTENT(OUT) :: ERRORFLAG
            END SUBROUTINE FINDINV
          END INTERFACE 
        END MODULE FINDINV__genmod
