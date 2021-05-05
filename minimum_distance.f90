SUBROUTINE minimum_distance (r_i, r_j, h, r_ij, d_ij) 

USE shared_data

IMPLICIT NONE

!-----------------------------------------------!
! Declare calling parameter types & definitions !
!-----------------------------------------------!
REAL(KIND=dbl), INTENT(IN), DIMENSION(3)   :: r_i, r_j
REAL(KIND=dbl), INTENT(IN), DIMENSION(3,3) :: h

REAL(KIND=dbl), INTENT(OUT), DIMENSION(3) :: r_ij

REAL(KIND=dbl), INTENT(OUT)  :: d_ij

!---------------------------------------------!
! Declare local parameter types & definitions !
!---------------------------------------------!
LOGICAL :: ok_flag

REAL(KIND=dbl), DIMENSION(3)   :: s_i, s_j, s_ij

REAL(KIND=dbl), DIMENSION(3,3) :: h_inv

!---------------------------------------------!
! Compute the inverse of the matrix           !
!---------------------------------------------!
CALL m33inv (h, h_inv, ok_flag)

!---------------------------------------------!
! Compute fractional coordinates of the atoms !
!---------------------------------------------!
s_i = MATMUL(h_inv,r_i)
s_j = MATMUL(h_inv,r_j)
 
!WRITE (*,*) '           Fractional coordinates of i-th atom: ', s_i(1), s_i(2), s_i(3)
!WRITE (*,*) '           Fractional coordinates of j-th atom: ', s_j(1), s_j(2), s_j(3)

!---------------------------------------------!
! Compute the distance between the atoms      !
!---------------------------------------------!
s_ij = s_i - s_j 
s_ij = s_ij - NINT(s_ij)

r_ij = MATMUL (h, s_ij)

d_ij = NORM2(r_ij)

!WRITE (*,*) '           d_ij = ', d_ij

END SUBROUTINE MINIMUM_DISTANCE

