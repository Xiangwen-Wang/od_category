      subroutine aptvunb (ax, ay, az, np, tol, ux, uy, uz, vlen, nerr)

!ccbeg.
!cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
!c
!c                             SUBROUTINE APTVUNB
!c
!c     call aptvunb (ax, ay, az, np, tol, ux, uy, uz, vlen, nerr)
!c
!c     Version:  aptvunb  Originated 27 Feb 2009
!c
!c     Author:   Devis Di Tommaso, Dept of Chemistry (uccaddi@ucl.ac.uk)
!c
!c
!c     Purpose:  To find the np unit vectors u = (ux, uy, uz) parallel to the
!c               np vectors a = (ax, ay, az).  If any component of vector "a"
!c               is no greater than tol, or no greater than tol times the length
!c               of "a", then the corresponding component of "u" will be
!c               truncated to zero.  If all are zero, or are truncated to zero,
!c               vlen will be zero.  Flag nerr indicates any input error.
!c
!c               With no truncation,
!c                 (ux, uy, uz) = (ax, ay, az) / sqrt (ax**2 + ay**2 + az**2).
!c
!c     History:  27 Feb 2009.   Modified version of aptvan.f subroutine of A. L. Edwards
!c               (http://nuclear.llnl.gov/CNP/apt/apt/aptvunb.html)
!c
!c     Input:    ax, ay, az, np, tol.
!c
!c     Output:   ux, uy, uz, vlen, nerr.
!c
!c     Glossary:
!c
!c     ax,ay,az  Input    The x, y, z components of a vector.  Size np.
!c
!c     nerr      Output   Indicates an input error, it not 0.
!c                          1 if np is not positive.
!c
!c     np        Input    Size of arrays ax, ay, az, ux, uy, uz, vlen.
!c
!c     tol       Input    Numerical tolerance limit.
!c                          On Cray computers, recommend 1.e-5 to 1.e-11.
!c
!c     ux,uy,uz  Output   The x, y, z components of a unit vector.  Size np.
!c                          A component will be zero if the corresponding
!c                          component of vector "a" is no greater than tol,
!c                          or no greater than tol times the length of "a".
!c
!c     vlen      Output   Magnitude of vector "u", after any truncation of
!c                          components has been done, but before division by
!c                          vlen to form a unit vector.  Size np.
!c
!cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
!ccend.

use shared_data

implicit none

!c.... Dimensioned arguments.

integer, intent(in) :: np

real(kind=dbl), intent(in) :: tol

!c---- Components x y z of input vectors "a".
real(kind=dbl), intent(in), dimension(np) :: ax
real(kind=dbl), intent(in), dimension(np) :: ay
real(kind=dbl), intent(in), dimension(np) :: az

!c---- Components x y z of unit vectors "a".
real(kind=dbl), intent(out), dimension(np) :: ux
real(kind=dbl), intent(out), dimension(np) :: uy
real(kind=dbl), intent(out), dimension(np) :: uz

!c---- Magnitude of input vectors "a".
real(kind=dbl), intent(out), dimension(np) :: vlen

!c--- Input error
integer, intent(out) :: nerr

!c.... Local variables.

!c.... Counting indexes.
integer :: n

!c---- A very small number.
real, parameter :: fuz = 1.0E-20_dbl

!c---- Square of estimated error in "a".
real(kind=dbl) :: aerr2

!cbugc***DEBUG begins.
!c9901 format (/ 'aptvunb finding unit vectors with tol=',1pe13.5)
!c9902 format (i3,' ax,ay,az=',3f15.9)
!cwrite ( 3, 9901) tol
!cwrite ( 3, 9902) (n, ax(n), ay(n), az(n), n = 1, np)
!cbugc***DEBUG ends.

!c.... Initialize.

      nerr = 0

!c.... Test for input errors.

      if (np .le. 0) then
        nerr = 1
!cbugc***DEBUG begins.
!cbug        write ( 3, '(/ "aptvunb fatal.  bad np=",i3)') np
!cbugc***DEBUG ends.

      else 

!c.... Find the unit vectors.

!c---- No truncation.
      if (tol .le. 0.0_dbl) then

!c---- Loop over vectors.
        do n = 1, np

          vlen(n) = sqrt (ax(n)**2 + ay(n)**2 + az(n)**2)
          ux(n)   = ax(n) / (vlen(n) + fuz)
          uy(n)   = ay(n) / (vlen(n) + fuz)
          uz(n)   = az(n) / (vlen(n) + fuz)

!c---- End of loop over vectors.
	enddo

!c---- Truncate small components to zero.
      else

!c---- Loop over vectors.
        do n = 1, np

          aerr2  = tol**2 * max(1.0_dbl, ax(n)**2 + ay(n)**2 + az(n)**2)

          if (ax(n)**2 .lt. aerr2) then
            ux(n) = 0.0_dbl
          else
            ux(n) = ax(n)
          endif

          if (ay(n)**2 .lt. aerr2) then
            uy(n) = 0.0_dbl
          else
            uy(n) = ay(n)
          endif

          if (az(n)**2 .lt. aerr2) then
            uz(n) = 0.0_dbl
          else
            uz(n) = az(n)
          endif

          vlen(n) = sqrt (ux(n)**2 + uy(n)**2 + uz(n)**2)
          ux(n)   = ux(n) / (vlen(n) + fuz)
          uy(n)   = uy(n) / (vlen(n) + fuz)
          uz(n)   = uz(n) / (vlen(n) + fuz)

!c---- End of loop over vectors.
	enddo

!c---- Tested tol.
      endif

!c.... Tested nerr
	endif

!cbugc***DEBUG begins.
!9903 format ( / 'aptvunb results:',/, &
!c    	      i3,' vlen=    ',f15.9,/, &
!c    	      '    ux,uy,uz=',3f15.9)
!c      write ( 3, 9903) (n, vlen(n), ux(n), uy(n), uz(n), n = 1, np)
!cbugc***DEBUG ends.

!c.... End of subroutine aptvunb.      (+1 line.)
      end

