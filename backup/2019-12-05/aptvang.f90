      subroutine aptvang (ax, ay, az, bx, by, bz, costh, nerr)

!ccbeg.
!cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
!c
!c                             SUBROUTINE APTVANG
!c
!c     call aptvang (ax, ay, az, bx, by, bz, np, tol, costh, nerr)
!c
!c     Version:  aptvang  Originated 26 Feb 2009 
!c
!c     Author:   Devis Di Tommaso, UCL, Chemistry Department (uccaddi@ucl.ac.uk)
!c
!c
!c     Purpose:  To find the cosine costh of the angle between the pair of
!c               vectors a = (ax, ay, az) and b = (bx, by, bz), for each of np
!c               sets of input data.  
!c               Flag nerr indicates any input error.
!c
!c     History:  26 Feb 2009. Modified version of aptvan.f subroutine of A. L. Edwards
!c		 (http://nuclear.llnl.gov/CNP/apt/apt/aptvang.html)
!c		 27 Feb 2009. Find the cosine from unit vectors parallel to vectors "a" and "b"
!c		 which are computed calling "aptvunb" subroutine.
!c		 01 March 2009. Corrected the problem with tye tol parameter (save attribute)
!c
!c     Input:    ax, ay, az, bx, by, bz.
!c
!c     Output:   costh, nerr.
!c
!c     Calls:	 aptvunb
!c               
!c
!c     Glossary:
!c
!c     ax,ay,az  Input    The x, y, z components of a vector.  
!c
!c     bx,by,bz  Input    The x, y, z components of a vector. 
!c
!c     costh     Output   Cosine of the angle between the vectors "a" and "b".
!c                          Will be truncated to zero, if less than the estimated
!c                          error in its calculation, based on tol. 
!c
!c     nerr      Output   Indicates an input error, if not 0.
!c                          1 if np is not positive.
!c
!c     tol       Local    Numerical tolerance limit.
!c		 Param    On Cray computers, Edwards recommends 1.e-5 to 1.e-11.   
!c
!cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
!ccend.

use shared_data

implicit none

!c
!c....declare calling parameter types & definitions
!c

integer, intent(out) :: nerr

!c---- Components x,y and z of input vector "a".
real(kind=dbl), intent(in) :: ax
real(kind=dbl), intent(in) :: ay
real(kind=dbl), intent(in) :: az

!c---- Component x of input vector "b".
real(kind=dbl), intent(in) :: bx
real(kind=dbl), intent(in) :: by
real(kind=dbl), intent(in) :: bz

!c---- Cosine of angle between "a" and "b".
real(kind=dbl), intent(out) :: costh

!c.... Local variables.

real(kind=dbl), save :: tol 

!c---- Components x,y and z of unit vectors "ua" "ub".
real(kind=dbl) :: uax 
real(kind=dbl) :: uay
real(kind=dbl) :: uaz 

real(kind=dbl) :: ubx           
real(kind=dbl) :: uby
real(kind=dbl) :: ubz       

real(kind=dbl) :: vlen
real(kind=dbl) :: vlena
real(kind=dbl) :: vlenb
real(kind=dbl) :: spab
real(kind=dbl) :: sperr

!cbugc***DEBUG begins.
!c9901 format (/ 'aptvang finding cosine costh between the vectors')
!c9902 format (' ax,ay,az=',3f15.9) 
!c9903 format (' bx,by,bz=',3f15.9) 
!cwrite ( 3, 9901)
!cwrite ( 3, 9902) ax, ay, az 
!cwrite ( 3, 9902) bx, by, bz
!cbugc***DEBUG ends.

!c.... Initialize.

	nerr = 0

	tol = 0.0_dbl

!c.... Test for input errors.

!c.... Find the unit vectors parallel to vectors "a" and "b".

	call aptvunb (ax, ay, az, 1, tol, uax, uay, uaz, vlen, nerr)

	call aptvunb (bx, by, bz, 1, tol, ubx, uby, ubz, vlen, nerr)

!c.... Compute the lenght of the vectors "a" and "b".

!c	vlena = sqrt (ax**2 + ay**2 + az**2)
!c	vlenb = sqrt (bx**2 + by**2 + bz**2)

!c.... Find the the scalar (dot) product spab between the unit vectors parallel to "a" and "b".
!c.... The value of spab will be truncated to zero, if less than the estimated error
!c.... in its calculation, based on tol.

!c	spab = ax * bx + ay * by + az * bz
	spab = uax * ubx + uay * uby + uaz * ubz

!c---- Truncate small values to zero.
	if (tol .gt. 0.0_dbl ) then
		sperr = 2.0_dbl * tol * (abs (ax * bx) + abs (ay * by) + abs (az * bz))
		if (abs (spab) .lt. sperr) then
			spab = 0.0_dbl
		endif
	endif

!c.... Find the cosine of the angle between unit vectors "a" and "b".

	costh =	spab 

!c	costh = spab/(vlena*vlenb)

	if (costh .lt. (-1.0_dbl + tol)) costh = -1.0_dbl
	if (costh .gt. ( 1.0_dbl - tol)) costh =  1.0_dbl

!c.... See if all data subsets are done.

!cbugc***DEBUG begins.
!c9904 format (/ 'aptvang cosines:')
!c9905 format (' costh=   ',3f15.9)
!cwrite ( 3, 9904)
!cwrite ( 3, 9905) costh
!cbugc***DEBUG ends.

!c.... End of subroutine aptvang.      (+1 line.)
      end

