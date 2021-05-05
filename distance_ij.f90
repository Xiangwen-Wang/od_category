!------------------------------------------------------------------------------------------------------------------------------!
SUBROUTINE distance_ij (a_x, a_y, a_z, b_x, b_y, b_z, c_x, c_y, c_z, rx, ry, rz, natms, natms_1, natms_2, d_atms_12)
!------------------------------------------------------------------------------------------------------------------------------!
!c
!c                             SUBROUTINE DISTANCE_TIME
!c
!c     Version:  03 May 2010
!c
!c     Author:   Devis Di Tommaso, UCL, Chemistry Department (uccaddi@ucl.ac.uk)
!c
!c
!c     Purpose:  To compute the distances 'rml' between the atoms atm_1 and atm_2 at each md 
!c               time step, and construct the array RML: 
!c                      rml(i,j,p), i = 1, n1
!c                                  j = 1, n2
!c                                  s = 1, nstep
!c
!c     History: 
!c              
!c     Input:    
!c
!c     Output:   
!c
!c     Calls:   
!c
!c
!c     Glossary:
!c
!ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
!ccend.

USE shared_data

IMPLICIT NONE
 
!-----------------------------------------------!
! Declare calling parameter types & definitions	!
!-----------------------------------------------!

INTEGER, INTENT(IN) :: natms
INTEGER, INTENT(IN) :: natms_1
INTEGER, INTENT(IN) :: natms_2
!INTEGER, INTENT(IN) :: nstep

REAL(KIND=dbl), INTENT(IN) :: a_x
REAL(KIND=dbl), INTENT(IN) :: a_y
REAL(KIND=dbl), INTENT(IN) :: a_z
REAL(KIND=dbl), INTENT(IN) :: b_x
REAL(KIND=dbl), INTENT(IN) :: b_y
REAL(KIND=dbl), INTENT(IN) :: b_z
REAL(KIND=dbl), INTENT(IN) :: c_x
REAL(KIND=dbl), INTENT(IN) :: c_y
REAL(KIND=dbl), INTENT(IN) :: c_z

REAL(KIND=dbl), INTENT(IN), DIMENSION(2,natms) :: rx 
REAL(KIND=dbl), INTENT(IN), DIMENSION(2,natms) :: ry
REAL(KIND=dbl), INTENT(IN), DIMENSION(2,natms) :: rz

REAL(KIND=dbl), INTENT(OUT), DIMENSION(natms_1,natms_2) :: d_atms_12

!-----------------------------------------------!
! Declare local parameter types & definitions   !
!-----------------------------------------------!

INTEGER, PARAMETER :: NAT_MAX = 2000
INTEGER, PARAMETER :: NSTEP_MAX = 4000

INTEGER :: i, j

REAL(KIND=dbl) :: rxij, ryij, rzij
REAL(KIND=dbl) :: rijsq
REAL(KIND=dbl) :: rij
REAL(KIND=dbl) :: boxl_a, boxl_b, boxl_c

! Compute the size of each side box
! THIS ONLY WORKS UP TO ORTHOROMBIC UNIT CELLS
boxl_a = SQRT(a_x**2 + a_y**2 + a_z**2)
boxl_b = SQRT(b_x**2 + b_y**2 + b_z**2)
boxl_c = SQRT(c_x**2 + c_y**2 + c_z**2)

!--------------------------------------------------------!
! Compute r_ij for species of different type (e.g. r_oh) !
!--------------------------------------------------------!
DO i = 1, natms_1
	DO j = 1, natms_2
		rxij = rx(1,i) - rx(2,j)
		ryij = ry(1,i) - ry(2,j)
		rzij = rz(1,i) - rz(2,j)

		! Calculate minimum image distances
		rxij = rxij - boxl_a*anint(rxij/boxl_a)
		ryij = ryij - boxl_b*anint(ryij/boxl_b)
		rzij = rzij - boxl_c*anint(rzij/boxl_c)

		rijsq = rxij*rxij + ryij*ryij + rzij*rzij
		rij = SQRT(rijsq)
		! WRITE (*,*)'	rij =', rij

		!rml(i,j,s) = rij
		d_atms_12(i,j) = rij

		!cbugc***DEBUG begins.
		!9902 format (' i=', i3, ' j=', i3, ' p=', i6, 2X, 'rml =', 1f10.5)
		!write ( 3,9901)
		!write ( 3, 9902) i, j, p, rml(i,j,p) 
		!cbugc***DEBUG ends.
	ENDDO 
ENDDO 

END SUBROUTINE 

