SUBROUTINE correlation_modified (atmnam_wc, waternam, nwaters, nstep, ini, skip, mux, muy, muz, tcf_auto, tcf_cross)


!This subroutine is to calculate dipole correlation P1
!---------------------------------------------------------------!
!Parameter define                                               !
!---------------------------------------------------------------!

USE shared_data

INTEGER, INTENT(IN) :: nwaters, nstep, ini, skip

CHARACTER(LEN=8), INTENT(IN), DIMENSION(nstep,nwaters) :: atmnam_wc
CHARACTER(LEN=8), INTENT(IN) ::waternam

REAL(kind=dbl), INTENT(IN), DIMENSION(nstep,nwaters) :: mux
REAL(kind=dbl), INTENT(IN), DIMENSION(nstep,nwaters) :: muy
REAL(kind=dbl), INTENT(IN), DIMENSION(nstep,nwaters) :: muz

INTEGER :: i, j, k

REAL(kind=dbl) :: costh_a
REAL(kind=dbl) :: costh_c

INTEGER :: nerr_a
INTEGER :: nerr_c

REAL(kind=dbl) :: p1_a
REAL(kind=dbl) :: p1_c

REAL(KIND=dbl), DIMENSION(nwaters,nwaters) :: c_1_jk
REAL(KIND=dbl), DIMENSION(nwaters,nwaters) :: a_1_jk
REAL(KIND=dbl), DIMENSION(1,nwaters) :: tr
REAL(KIND=dbl), DIMENSION(nwaters, 1) :: tr_t

REAL(KIND=dbl), DIMENSION(1,nwaters) :: tcf_buff_a, tcf_buff_c

REAL(KIND=dbl), DIMENSION(1,1) :: matrix_buff_a
REAL(KIND=dbl), DIMENSION(1,1) :: matrix_buff_c

REAL(KIND=dbl), INTENT(OUT), DIMENSION(1,nstep) :: tcf_auto
REAL(KIND=dbl), INTENT(OUT), DIMENSION(1,nstep) :: tcf_cross

!---------------------------------------------------------------!
!Calculating dipole correlation                                 !
!---------------------------------------------------------------!
tr = 1
tr_t = 1

DO i = 0, nstep-ini, skip

c_1_jk = 0
a_1_jk = 0
tcf_buff_a = 0
matrix_buff_a = 0
tcf_buff_c = 0
matrix_buff_c = 0


	DO j = 1, nwaters
		IF (atmnam_wc(ini,j) == waternam) THEN
		
			
			CALL aptvang(mux(ini,j), muy(ini,j), muz(ini,j), mux(ini+i,j), muy(ini+i,j), muz(ini+i,j), costh_a, nerr_a)
				
				a_1_jk(j,j) = costh_a



			!DO k = 1, nwaters
			!	IF (k == j) THEN
			!		CALL aptvang(mux(ini,j), muy(ini,j), muz(ini,j), mux(ini+i,k), muy(ini+i,k), muz(ini+i,k), costh_a, nerr_a)
				
			!		p1_a = costh_a 
	
			!		a_1_jk(k,j) = p1_a
			!	ELSE
					!CALL aptvang(mux(ini,j), muy(ini,j), muz(ini,j), mux(ini+i,k), muy(ini+i,k), muz(ini+i,k), costh_c, nerr_c)
					
					!p1_c = costh_c
					
					!c_1_jk(k,j) = p1_c	
			!	ENDIF
			!ENDDO
		
		ENDIF
	ENDDO		

!Elements of tcf_buff are sum of cross
!correlation of specific water (ex) tcf_buff (1,1) = sum(mu1*mu2, mu1*mu3,..., mu1*mun)

tcf_buff_a = MATMUL(tr,a_1_jk)
tcf_buff_c = MATMUL(tr,c_1_jk)

matrix_buff_a = MATMUL(tcf_buff_a,tr_t)	
tcf_auto(1,i+1) = matrix_buff_a(1,1)	

matrix_buff_c = MATMUL(tcf_buff_c,tr_t)
tcf_cross(1,i+1) = matrix_buff_c(1,1)	
ENDDO





IF (tcf_auto(1,1) == 0) THEN
tcf_auto = 0
ELSE
tcf_auto = tcf_auto/(tcf_auto(1,1))
ENDIF

!IF (tcf_cross(1,1) == 0) THEN
!tcf_cross = 0
!ELSE
!tcf_cross = tcf_cross/(tcf_cross(1,1))
!ENDIF

END SUBROUTINE correlation_modified					
