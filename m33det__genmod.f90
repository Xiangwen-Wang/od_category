        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:21 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE M33DET__genmod
          INTERFACE 
            FUNCTION M33DET(A) RESULT(DET)
              REAL(KIND=8), INTENT(IN) :: A(3,3)
              REAL(KIND=8) :: DET
            END FUNCTION M33DET
          END INTERFACE 
        END MODULE M33DET__genmod
