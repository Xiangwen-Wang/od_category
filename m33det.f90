!***********************************************************************************************************************************
!
!                                                       M 3 3 D E T _ M
!                                                       A I N
!
!  Subroutine:      M33DET_MAIN
!
!  Programmer:   David G. Simpson
!                NASA Goddard Space Flight Center
!                Greenbelt, Maryland  20771
!
!  Date:         July 22, 2005
!
!  Language:     Fortran-90
!
!  Version:      1.00a
!
!  Description:  M33DET computes the determinant a 3x3 matrix.
!
!  Files:        Source files:
!
!                   m33det.f90                   Main program
!
!***********************************************************************************************************************************

      FUNCTION M33DET (A) RESULT (DET)

      IMPLICIT NONE

      DOUBLE PRECISION, DIMENSION(3,3), INTENT(IN)  :: A

      DOUBLE PRECISION :: DET


      DET =   A(1,1)*A(2,2)*A(3,3)  &
            - A(1,1)*A(2,3)*A(3,2)  &
            - A(1,2)*A(2,1)*A(3,3)  &
            + A(1,2)*A(2,3)*A(3,1)  &
            + A(1,3)*A(2,1)*A(3,2)  &
            - A(1,3)*A(2,2)*A(3,1)

      RETURN

      END FUNCTION M33DET

