SUBROUTINE avgovertime (naverage, nstep, corr,corr_avg)
!DESCRIPTION----------------------------------------------------------

!THIS SUBROUTIN CALCULATES AVERAGE OVER TIME. THE CORR MATRIX HAS 
!NAVERAGE SETS OF CORRELATION FUNCTION FROM DIFFERENT TIME ORIGIN.
!WE USE THIS DATA TO GET AVERAGED 'CORRELATION FUNCTION'


!DEFINE PARAMETERS----------------------------------------------------
use shared_data

INTEGER, INTENT(IN) :: naverage, nstep

REAL(KIND=dbl), INTENT(IN), DIMENSION(naverage,nstep) :: corr
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_null
REAL(KIND=dbl), INTENT(OUT), DIMENSION(1,nstep) :: corr_avg

INTEGER :: i,j,k

REAL(KIND=dbl), DIMENSION(1,naverage) :: tr
REAL(KIND=dbl), DIMENSION(1,nstep) :: denom, corr_sum

!----------------------------------------------------------------------

tr = 1
corr_null = 0

DO i = 1, naverage

	DO j = 1, nstep
		
		IF (corr(i,j) /=0) THEN
		
			corr_null(i,j) = 1
		ELSE
			corr_null(i,j) = 0
		ENDIF
	ENDDO
ENDDO

denom = MATMUL(tr,corr_null)
corr_sum = MATMUL(tr,corr)

DO k = 1, nstep

	IF (denom(1,k) /= 0) THEN
		
	corr_avg(1,k) = corr_sum(1,k)/denom(1,k)
	
	!WRITE(*,*) 'k'
	!WRITE(*,*) denom(1,i)
	!WRITE(*,*) corr_sum(1,i)
	!WRITE(*,*) corr_avg(1,i)
	ENDIF
ENDDO


END SUBROUTINE
