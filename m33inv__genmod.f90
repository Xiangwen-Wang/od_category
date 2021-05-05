        !COMPILER-GENERATED INTERFACE MODULE: Sat Jun 27 16:27:21 2020
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE M33INV__genmod
          INTERFACE 
            SUBROUTINE M33INV(A,AINV,OK_FLAG)
              REAL(KIND=8), INTENT(IN) :: A(3,3)
              REAL(KIND=8), INTENT(OUT) :: AINV(3,3)
              LOGICAL(KIND=4), INTENT(OUT) :: OK_FLAG
            END SUBROUTINE M33INV
          END INTERFACE 
        END MODULE M33INV__genmod
