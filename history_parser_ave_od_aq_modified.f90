!----------------------------------------------------------------------------------------------------------!
SUBROUTINE history_parser_ave_od_aq_modified ( nstep, nw, atm_1, atm_2, atm_3, atm_4,	    		  &!		  
						     a_x, a_y, a_z, 		    	    		  &! 		  
                                                     b_x, b_y, b_z, 		  	    		  &!	 		  
                         		             c_x, c_y, c_z, 		  	    		  &! 		  
						     rcut_mg_o_1, rcut_mg_o_2, 	  	   		  &! 
						     rcut_cl_h_1, rcut_cl_h_2,    		          &!
					     	     rcut_ohw, naverage, offset, skip ,atm_w1, atm_w2,    &!
					             atm_w3, atm_w4, atm_w5, atm_w6, atm_w7,		  &!
						     atm_w8, atm_w9, atm_w10, atm_w11,      		  &!
						     atm_w12, atm_w13, atm_w14, atm_w15,    		  &!
						     atm_w16, atm_w17, atm_w18)		     		   !
!----------------------------------------------------------------------------------------------------------!

USE shared_data

IMPLICIT NONE

!-----------------------------------------------!
! Declare calling parameter types & definitions !
!-----------------------------------------------!

INTEGER, INTENT(IN) :: nstep
INTEGER, INTENT(IN) :: naverage
INTEGER, INTENT(IN) :: nw
INTEGER, INTENT(IN) :: offset
INTEGER, INTENT(IN) :: skip

CHARACTER(LEN=8), INTENT(IN) :: atm_1
CHARACTER(LEN=8), INTENT(IN) :: atm_2
CHARACTER(LEN=8), INTENT(IN) :: atm_3
CHARACTER(LEN=8), INTENT(IN) :: atm_4
CHARACTER(LEN=8), INTENT(IN) :: atm_w1
CHARACTER(LEN=8), INTENT(IN) :: atm_w2
CHARACTER(LEN=8), INTENT(IN) :: atm_w3
CHARACTER(LEN=8), INTENT(IN) :: atm_w4
CHARACTER(LEN=8), INTENT(IN) :: atm_w5
CHARACTER(LEN=8), INTENT(IN) :: atm_w6
CHARACTER(LEN=8), INTENT(IN) :: atm_w7
CHARACTER(LEN=8), INTENT(IN) :: atm_w8
CHARACTER(LEN=8), INTENT(IN) :: atm_w9
CHARACTER(LEN=8), INTENT(IN) :: atm_w10
CHARACTER(LEN=8), INTENT(IN) :: atm_w11
CHARACTER(LEN=8), INTENT(IN) :: atm_w12
CHARACTER(LEN=8), INTENT(IN) :: atm_w13
CHARACTER(LEN=8), INTENT(IN) :: atm_w14
CHARACTER(LEN=8), INTENT(IN) :: atm_w15
CHARACTER(LEN=8), INTENT(IN) :: atm_w16
CHARACTER(LEN=8), INTENT(IN) :: atm_w17
CHARACTER(LEN=8), INTENT(IN) :: atm_w18

REAL(KIND=dbl), INTENT(IN) :: a_x, a_y, a_z
REAL(KIND=dbl), INTENT(IN) :: b_x, b_y, b_z
REAL(KIND=dbl), INTENT(IN) :: c_x, c_y, c_z
REAL(KIND=dbl), INTENT(IN) :: rcut_mg_o_1
REAL(KIND=dbl), INTENT(IN) :: rcut_mg_o_2
REAL(KIND=dbl), INTENT(IN) :: rcut_cl_h_1
REAL(KIND=dbl), INTENT(IN) :: rcut_cl_h_2
REAL(KIND=dbl), INTENT(IN) :: rcut_ohw

CHARACTER(LEN=8) :: atmnam

INTEGER :: i, j, k, l, m
INTEGER :: iloop
INTEGER :: istep
INTEGER :: md_step

INTEGER :: md_counter
INTEGER :: nwaters

INTEGER :: istat
INTEGER :: istats
INTEGER :: natms
INTEGER :: natms_1
INTEGER :: natms_2
INTEGER :: natms_3
INTEGER :: natms_4
INTEGER :: ini
INTEGER :: stepsize

REAL(KIND=dbl) :: a_length, b_length, c_length
REAL(KIND=dbl) :: xx, yy, zz
REAL(KIND=dbl) :: energy
REAL(KIND=dbl) :: time
REAL(KIND=dbl) :: d_ij, d_lm, d_kn, d_kp

REAL(KIND=dbl) :: ox, oy, oz, hax, hay, haz, hbx, hby, hbz

REAL(KIND=dbl), ALLOCATABLE, DIMENSION(:,:) :: rx 
REAL(KIND=dbl), ALLOCATABLE, DIMENSION(:,:) :: ry
REAL(KIND=dbl), ALLOCATABLE, DIMENSION(:,:) :: rz
REAL(KIND=dbl), ALLOCATABLE, DIMENSION(:,:) :: ws


CHARACTER(LEN=8), ALLOCATABLE, DIMENSION(:) :: atmnam_1
CHARACTER(LEN=8), ALLOCATABLE, DIMENSION(:) :: atmnam_2
CHARACTER(LEN=8), ALLOCATABLE, DIMENSION(:) :: atmnam_3
CHARACTER(LEN=8), ALLOCATABLE, DIMENSION(:) :: atmnam_4
CHARACTER(LEN=8), ALLOCATABLE, DIMENSION(:) :: atmnam_w
CHARACTER(LEN=8), DIMENSION(nstep,nw) :: atmnam_wc

REAL(KIND=dbl), DIMENSION(3) :: r_i, r_j, r_ij, r_k, r_n, r_p, r_kn, r_kp, r_l, r_m, r_lm   

REAL(KIND=dbl), ALLOCATABLE, DIMENSION(:,:) :: atmpos

REAL(KIND=dbl), DIMENSION(3,3) :: h
REAL(KIND=dbl), DIMENSION(3,2) :: oh
REAL(KIND=dbl), ALLOCATABLE, DIMENSION(:,:) :: mu
REAL(KIND=dbl), DIMENSION(nstep,nw) :: mux
REAL(KIND=dbl), DIMENSION(nstep,nw) :: muy
REAL(KIND=dbl), DIMENSION(nstep,nw) :: muz

REAL(KIND=dbl), DIMENSION(18,nstep) :: tcf_auto_all
REAL(KIND=dbl), DIMENSION(18,nstep) :: tcf_cross_all

REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_1, corr_cross_1
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_2, corr_cross_2
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_3, corr_cross_3
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_4, corr_cross_4
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_5, corr_cross_5
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_6, corr_cross_6
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_7, corr_cross_7
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_8, corr_cross_8
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_9, corr_cross_9
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_10, corr_cross_10
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_11, corr_cross_11
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_12, corr_cross_12
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_13, corr_cross_13
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_14, corr_cross_14
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_15, corr_cross_15
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_16, corr_cross_16
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_17, corr_cross_17
REAL(KIND=dbl), DIMENSION(naverage,nstep) :: corr_auto_18, corr_cross_18

REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_1, corr_avg_cross_1
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_2, corr_avg_cross_2
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_3, corr_avg_cross_3
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_4, corr_avg_cross_4
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_5, corr_avg_cross_5
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_6, corr_avg_cross_6
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_7, corr_avg_cross_7
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_8, corr_avg_cross_8
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_9, corr_avg_cross_9
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_10, corr_avg_cross_10
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_11, corr_avg_cross_11
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_12, corr_avg_cross_12
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_13, corr_avg_cross_13
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_14, corr_avg_cross_14
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_15, corr_avg_cross_15
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_16, corr_avg_cross_16
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_17, corr_avg_cross_17
REAL(KIND=dbl), DIMENSION(1,nstep) :: corr_avg_auto_18, corr_avg_cross_18

LOGICAL :: ex

a_length = SQRT(a_x*a_x + a_y*a_y + a_z*a_z)
b_length = SQRT(b_x*b_x + b_y*b_y + b_z*b_z)
c_length = SQRT(c_x*c_x + c_y*c_y + c_z*c_z)

!--------------------------------------------------------------------!
! Initialize matrix h containing crystallographic vectors a, b and c !
!--------------------------------------------------------------------!
h(1,1) = a_x
h(2,1) = a_y
h(3,1) = a_z

h(1,2) = b_x
h(2,2) = b_y
h(3,2) = b_z

h(1,3) = c_x
h(2,3) = c_y
h(3,3) = c_z

!--------------------------------------------------------------------!
! Open "HISTORY" file and READ the trajectory file		     !
!--------------------------------------------------------------------!
WRITE(*,*) 'naverage = ', naverage
WRITE(*,*) 'nskip = ', skip
WRITE(*,*) 'offset = ', offset

stepsize = (nstep-MOD(nstep,naverage))/naverage	

DO iloop = 1, naverage !outerloop

	ini =stepsize*(iloop-1)+offset

	INQUIRE (FILE = 'water_classification.txt', EXIST=ex)
	
	IF (.NOT.ex) THEN
	!water_classification build

		OPEN (UNIT=10, FILE='water_classification.txt', STATUS='NEW', ACTION = 'WRITE')

		OPEN (UNIT=9, FILE='HISTORY', STATUS='old', action='READ', iostat=istat)

			IF (istat == 0) THEN !History read stage

				DO istep = 1, nstep !Read loop
		
					!WRITE(10,1090) istep
					!1090 FORMAT ('istep =' I9)


					READ (9,*) natms
                			READ (9,100) md_step, time, energy
                			100 FORMAT (4X, I9, 8X, F13.3, 5X, F21.10)

					ALLOCATE(atmnam_1(natms))
					ALLOCATE(atmnam_2(natms))
					ALLOCATE(atmnam_3(natms))
					ALLOCATE(atmnam_4(natms))

					ALLOCATE(rx(4,natms))
					ALLOCATE(ry(4,natms))
					ALLOCATE(rz(4,natms))

					natms_1 = 0
					natms_2 = 0
					natms_3 = 0
					natms_4 = 0	

					DO i = 1, natms !Atmnam,position loop
						READ (9,*) atmnam, xx, yy, zz
						IF (atmnam == atm_1) THEN
							natms_1 = natms_1 + 1
							atmnam_1(natms_1) = atmnam
							rx(1,natms_1) = xx
							ry(1,natms_1) = yy
							rz(1,natms_1) = zz
							!WRITE (*,1010) atmnam, rx(1,natms_1), ry(1,natms_1), rz(1,natms_1)
						ELSEIF (atmnam == atm_2) THEN
							natms_2 = natms_2 + 1
							atmnam_2(natms_2) = atmnam
							rx(2,natms_2) = xx
							ry(2,natms_2) = yy
							rz(2,natms_2) = zz
							!WRITE (*,1010) atmnam, rx(2,natms_2), ry(2,natms_2), rz(2,natms_2)
						ELSEIF (atmnam == atm_3) THEN
							natms_3 = natms_3 + 1
							atmnam_3(natms_3) = atmnam
							rx(3,natms_3) = xx
							ry(3,natms_3) = yy
							rz(3,natms_3) = zz
							!WRITE (*,1010) atmnam, rx(3,natms_2), ry(3,natms_2), rz(3,natms_2)
						ELSEIF (atmnam == atm_4) THEN
							natms_4 = natms_4 + 1
							atmnam_4(natms_4) = atmnam
							rx(4,natms_4) = xx
							ry(4,natms_4) = yy
							rz(4,natms_4) = zz
							!WRITE (*,1010) atmnam, rx(4,natms_4), ry(4,natms_4), rz(4,natms_4)
						ENDIF
						1010 FORMAT (a8, 3F12.6)
					ENDDO !Atmnam,position loop end

					ALLOCATE (ws(natms_3,3))
					ALLOCATE (atmnam_w(natms_3))

					ws = 0

					DO i = 1, natms_1 !Cation-Oxygen loop

						r_i(1) = rx(1,i)
						r_i(2) = ry(1,i)
						r_i(3) = rz(1,i)
					
						DO j = 1, natms_3
							r_j(1) = rx(3,j)
							r_j(2) = ry(3,j)
							r_j(3) = rz(3,j)

							CALL minimum_distance (r_i, r_j, h, r_ij, d_ij)
					
							IF (d_ij < rcut_mg_o_1) THEN
								atmnam_3(j) = "O_1"
						
							ELSEIF ((rcut_mg_o_1 < d_ij) .AND. (d_ij < rcut_mg_o_2)) THEN
						
								IF (atmnam_3(j) /= "O_1") THEN 
									atmnam_3(j) = "O_2"
								ENDIF
						
							ELSEIF ((atmnam_3(j) /= "O_1") .AND. (atmnam_3(j) /= "O_2")) THEN 
								atmnam_3(j) = "O_B"	
							ENDIF
						ENDDO
					ENDDO !Cation-Oxygen loop
		
		

					DO l = 1, natms_2 !Anion-Hydrogen loop
						
						r_l(1) = rx(2,l)
						r_l(2) = ry(2,l)
						r_l(3) = rz(2,l)
			
						DO m = 1, natms_4
							r_m(1) = rx(4,m)
							r_m(2) = ry(4,m)
							r_m(3) = rz(4,m)

							CALL minimum_distance (r_l, r_m, h, r_lm, d_lm)
					
							IF (d_lm < rcut_cl_h_1) THEN
								atmnam_4(m) = "H_1"
							ELSEIF ((rcut_cl_h_1 < d_lm) .AND. (d_lm < rcut_cl_h_2)) THEN
								IF (atmnam_4(m) /= "H_1") THEN 
									atmnam_4(m) = "H_2"
								ENDIF
							ELSEIF ((atmnam_4(m) /= "H_1") .AND. (atmnam_4(m) /= "H_2")) THEN 
								atmnam_4(m) = "H_B"	
							ENDIF
						ENDDO
					ENDDO !Anion-Hydrogen loop

		
					DO i = 1, natms_3 !water-hydrogen pair matching
						ws(i,1) = i
						ws(i,2) = 2*i-1
						ws(i,3) = 2*i
					ENDDO !water-hydrogen pair matching	

					WRITE (10,*) natms_3
					WRITE (10,1020) md_step, time, energy
					1020 FORMAT (' i =', I9, ', time =', F13.3, ', E =', F21.10)


		
					DO l = 1, natms_3 !Water category loop
		
					!WRITE (*,1050) istep
					!1050 FORMAT ('istep =', I8)
					!WRITE (*,1060) l
					!1060 FORMAT ('l =' , I8)
					!WRITE (*,1040) atmnam_3(l)
					!1040 FORMAT ('atmnam =', a8)
					!WRITE (*,1070) ini
					!1070 FORMAT ('ini =' , I8)

					i = ws(l,1)
					j = ws(l,2)
					k = ws(l,3)
		

					IF (atmnam_3(i) == "O_1") THEN
						IF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "W111"

						ELSEIF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "W112"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "W112"

						ELSEIF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_B")) THEN
						
							atmnam_w(l) = "W11B"

						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "W11B"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "W122"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_B")) THEN
					
							atmnam_w(l) = "W12B"

						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "W12B"
						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_B")) THEN
					
							atmnam_w(l) = "W1BB"
						ENDIF

					ELSEIF (atmnam_3(i) == "O_2") THEN
						IF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "W211"

						ELSEIF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "W212"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "W212"

						ELSEIF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_B")) THEN
					
							atmnam_w(l) = "W21B"

						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "W21B"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "W222"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_B")) THEN
					
							atmnam_w(l) = "W22B"

						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "W22B"

						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_B")) THEN
					
							atmnam_w(l) = "W2BB"
						ENDIF

					ELSEIF (atmnam_3(i) == "O_B") THEN
						IF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "WB11"

						ELSEIF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "WB12"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "WB12"

						ELSEIF ((atmnam_4(j) == "H_1") .AND. (atmnam_4(k) == "H_B")) THEN
					
							atmnam_w(l) = "WB1B"

						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_1")) THEN
					
							atmnam_w(l) = "WB1B"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "WB22"

						ELSEIF ((atmnam_4(j) == "H_2") .AND. (atmnam_4(k) == "H_B")) THEN
					
							atmnam_w(l) = "WB2B"
		
						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_2")) THEN
					
							atmnam_w(l) = "WB2B"

						ELSEIF ((atmnam_4(j) == "H_B") .AND. (atmnam_4(k) == "H_B")) THEN
							atmnam_w(l) = "WBBB"
						ENDIF
			
					ENDIF
	

			WRITE (10,1030) atmnam_w(l), rx(3,l), ry(3,l), rz(3,l), rx(4,j), ry(4,j), rz(4,j), rx(4,k), ry(4,k), rz(4,k)
			1030 FORMAT (a8, 9F12.6)

		
		ENDDO !Water category loop

		DEALLOCATE (atmnam_1)
		DEALLOCATE (atmnam_2)
		DEALLOCATE (atmnam_3)
		DEALLOCATE (atmnam_4)
		DEALLOCATE (atmnam_w)
		DEALLOCATE (rx)
		DEALLOCATE (ry)
		DEALLOCATE (rz)
		DEALLOCATE (ws)

	ENDDO !Read loop 
ELSE
	WRITE(*,2000) istat
	2000 format (' ', 'Error opening file: HISTORY = ', i6)
ENDIF


CLOSE(9)
CLOSE(10)

ENDIF !Water classification build

!WRITE(*,*) 'iloop = ' ,iloop

IF (iloop == 1) THEN 

!WRITE(*,*) 'mu_building if statement'

OPEN (UNIT=11, FILE='water_classification.txt', STATUS ='OLD',action='READ', iostat=istats)
	
		Loop_MD: DO md_counter = 1, nstep
		
		!WRITE(*,*) 'md_counter =', md_counter

		READ (11,*) nwaters
		READ (11,100) md_step, time, energy
		
		ALLOCATE (atmpos(9,nwaters))
		
		DO i = 1, nwaters
			READ (11,*) atmnam, ox, oy, oz, hax, hay, haz, hbx, hby, hbz
				
				atmnam_wc(md_counter,i) = atmnam

				atmpos(1,i) = ox
				atmpos(2,i) = oy
				atmpos(3,i) = oz
				
				atmpos(4,i) = hax
				atmpos(5,i) = hay
				atmpos(6,i) = haz
				
				atmpos(7,i) = hbx
				atmpos(8,i) = hby
				atmpos(9,i) = hbz
				
				! WRITE (*,1010) atmnam, rx(1,natms_1), ry(1,natms_1), rz(1,natms_1)
			!1010 FORMAT (a8, 3F12.6)
		ENDDO
		
		ALLOCATE (mu(3,nwaters))
		
		!Insert Oxygen atoms for the atm_1

		Loop_OW1: DO i = 1, nwaters 
			!c.... Set the number of HB per water molecule to zero
			!WRITE (*,*) 'i =	', i
			
			r_k(1) = atmpos(1,i)
			r_k(2) = atmpos(2,i)
			r_k(3) = atmpos(3,i)

			r_n(1) = atmpos(4,i)
			r_n(2) = atmpos(5,i)
			r_n(3) = atmpos(6,i)

			r_p(1) = atmpos(7,i)
			r_p(2) = atmpos(8,i)
			r_p(3) = atmpos(9,i)		
				
			CALL minimum_distance (r_k, r_n, h, r_kn, d_kn)
				
				oh(1,1) = r_kn(1)
				oh(2,1) = r_kn(2)
				oh(3,1) = r_kn(3)

			CALL minimum_distance (r_k, r_p, h, r_kp, d_kp)
		
				oh(1,2) = r_kp(1)
				oh(2,2) = r_kp(2)
				oh(3,2) = r_kp(3)

				mu(1,i) = oh(1,1)+oh(1,2)
				mu(2,i) = oh(2,1)+oh(2,2) 
				mu(3,i) = oh(3,1)+oh(3,2) 
				

				!Normalization of mu vectors (mu(t) vectors to directional vectors u(t)

			  	!dmu(1,1) = mu(1,i)
				!dmu(2,1) = mu(2,i)
				!dmu(3,1) = mu(3,i)
	
				!dmu_s= NORM2(dmu)

				!mu(1,i) = mu(1,i)/dmu_s
				!mu(2,i) = mu(2,i)/dmu_s
				!mu(3,i) = mu(3,i)/dmu_s
		
				!WRITE (*,1020) mu(1,i), mu(2,i), mu(3,i)
		        	!1020 format (3F12.6)
				
				mux(md_counter,i) = mu(1,i)
				muy(md_counter,i) = mu(2,i)
				muz(md_counter,i) = mu(3,i)

				!WRITE (*,1020) mux(md_counter,i), muy(md_counter,i), muz(md_counter,i)
				!1020 format (62F12.6)
		ENDDO Loop_OW1

		DEALLOCATE (atmpos)
		DEALLOCATE (mu)
	
		ENDDO Loop_MD
	WRITE(*,*) 'End of mu construction'

        CLOSE (11)
	ENDIF !iloop == 1 syntax
	
	CALL compute_ave_od_aq_modified (atmnam_wc ,nwaters, nstep, ini, skip, atm_w1, atm_w2, atm_w3, atm_w4, atm_w5, atm_w6, atm_w7, atm_w8, atm_w9, atm_w10, atm_w11, atm_w12, atm_w13,&
				atm_w14, atm_w15, atm_w16, atm_w17, atm_w18, mux, muy, muz, tcf_auto_all, tcf_cross_all)
	

	DO i = 1, nstep
	
	corr_auto_1(iloop,i) = tcf_auto_all(1, i)
	corr_auto_2(iloop,i) = tcf_auto_all(2, i)
	corr_auto_3(iloop,i) = tcf_auto_all(3, i)
	corr_auto_4(iloop,i) = tcf_auto_all(4, i)
	corr_auto_5(iloop,i) = tcf_auto_all(5, i)
	corr_auto_6(iloop,i) = tcf_auto_all(6, i)
	corr_auto_7(iloop,i) = tcf_auto_all(7, i)
	corr_auto_8(iloop,i) = tcf_auto_all(8, i)
	corr_auto_9(iloop,i) = tcf_auto_all(9, i)
	corr_auto_10(iloop,i) = tcf_auto_all(10, i)
	corr_auto_11(iloop,i) = tcf_auto_all(11, i)
	corr_auto_12(iloop,i) = tcf_auto_all(12, i)
	corr_auto_13(iloop,i) = tcf_auto_all(13, i)
	corr_auto_14(iloop,i) = tcf_auto_all(14, i)
	corr_auto_15(iloop,i) = tcf_auto_all(15, i)
	corr_auto_16(iloop,i) = tcf_auto_all(16, i)
	corr_auto_17(iloop,i) = tcf_auto_all(17, i)
	corr_auto_18(iloop,i) = tcf_auto_all(18, i)

	!corr_cross_1(iloop,i) = tcf_cross_all(1, i)
	!corr_cross_2(iloop,i) = tcf_cross_all(2, i)
	!corr_cross_3(iloop,i) = tcf_cross_all(3, i)
	!corr_cross_4(iloop,i) = tcf_cross_all(4, i)
	!corr_cross_5(iloop,i) = tcf_cross_all(5, i)
	!corr_cross_6(iloop,i) = tcf_cross_all(6, i)
	!corr_cross_7(iloop,i) = tcf_cross_all(7, i)
	!corr_cross_8(iloop,i) = tcf_cross_all(8, i)
	!corr_cross_9(iloop,i) = tcf_cross_all(9, i)
	!corr_cross_10(iloop,i) = tcf_cross_all(10, i)
	!corr_cross_11(iloop,i) = tcf_cross_all(11, i)
	!corr_cross_12(iloop,i) = tcf_cross_all(12, i)
	!corr_cross_13(iloop,i) = tcf_cross_all(13, i)
	!corr_cross_14(iloop,i) = tcf_cross_all(14, i)
	!corr_cross_15(iloop,i) = tcf_cross_all(15, i)
	!corr_cross_16(iloop,i) = tcf_cross_all(16, i)
	!corr_cross_17(iloop,i) = tcf_cross_all(17, i)
	!corr_cross_18(iloop,i) = tcf_cross_all(18, i)

	ENDDO

	!WRITE(*,*) 'average_stage'
	!DO i = 1, nstep
	!WRITE(*,*) tcf_1_avg1 (1, i)
	!ENDDO

	CLOSE(9)
	CLOSE(10)
ENDDO


CALL avgovertime(naverage, nstep, corr_auto_1,corr_avg_auto_1)
!CALL avgovertime(naverage, nstep, corr_cross_1,corr_avg_cross_1)
	
WRITE (*,*)  atm_w1
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_1(1,j)!, corr_avg_cross_1(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_2,corr_avg_auto_2)
!CALL avgovertime(naverage, nstep, corr_cross_2,corr_avg_cross_2)
	
WRITE (*,*)  atm_w2
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_2(1,j)!, corr_avg_cross_2(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_3,corr_avg_auto_3)
!CALL avgovertime(naverage, nstep, corr_cross_3,corr_avg_cross_3)
	
WRITE (*,*)  atm_w3
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_3(1,j)!, corr_avg_cross_3(1,j)

ENDDO


CALL avgovertime(naverage, nstep, corr_auto_4,corr_avg_auto_4)
!CALL avgovertime(naverage, nstep, corr_cross_4,corr_avg_cross_4)
	
WRITE (*,*)  atm_w4
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_4(1,j)!, corr_avg_cross_4(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_5,corr_avg_auto_5)
!CALL avgovertime(naverage, nstep, corr_cross_5,corr_avg_cross_5)
	
WRITE (*,*)  atm_w5
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_5(1,j)!, corr_avg_cross_5(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_6,corr_avg_auto_6)
!CALL avgovertime(naverage, nstep, corr_cross_6,corr_avg_cross_6)
	
WRITE (*,*)  atm_w6
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_6(1,j)!, corr_avg_cross_6(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_7,corr_avg_auto_7)
!CALL avgovertime(naverage, nstep, corr_cross_7,corr_avg_cross_7)
	
WRITE (*,*)  atm_w7
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_7(1,j)!, corr_avg_cross_7(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_8,corr_avg_auto_8)
!CALL avgovertime(naverage, nstep, corr_cross_8,corr_avg_cross_8)
	
WRITE (*,*)  atm_w8
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_8(1,j)!, corr_avg_cross_8(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_9,corr_avg_auto_9)
!CALL avgovertime(naverage, nstep, corr_cross_9,corr_avg_cross_9)
	
WRITE (*,*)  atm_w9
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_9(1,j)!, corr_avg_cross_9(1,j)

ENDDO


CALL avgovertime(naverage, nstep, corr_auto_10,corr_avg_auto_10)
!CALL avgovertime(naverage, nstep, corr_cross_10,corr_avg_cross_10)
	
WRITE (*,*)  atm_w10
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_10(1,j)!, corr_avg_cross_10(1,j)

ENDDO


CALL avgovertime(naverage, nstep, corr_auto_11,corr_avg_auto_11)
!CALL avgovertime(naverage, nstep, corr_cross_11,corr_avg_cross_11)
	
WRITE (*,*)  atm_w11
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_11(1,j)!, corr_avg_cross_11(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_12,corr_avg_auto_12)
!CALL avgovertime(naverage, nstep, corr_cross_12,corr_avg_cross_12)
	
WRITE (*,*)  atm_w12
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_12(1,j)!, corr_avg_cross_12(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_13,corr_avg_auto_13)
!CALL avgovertime(naverage, nstep, corr_cross_13,corr_avg_cross_13)
	
WRITE (*,*)  atm_w13
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_13(1,j)!, corr_avg_cross_13(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_14,corr_avg_auto_14)
!CALL avgovertime(naverage, nstep, corr_cross_14,corr_avg_cross_14)	
WRITE (*,*)  atm_w14
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_14(1,j)!, corr_avg_cross_14(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_15,corr_avg_auto_15)
!CALL avgovertime(naverage, nstep, corr_cross_1,corr_avg_cross_15)
	
WRITE (*,*)  atm_w15
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_15(1,j)!, corr_avg_cross_15(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_16,corr_avg_auto_16)
!CALL avgovertime(naverage, nstep, corr_cross_16,corr_avg_cross_16)
	
WRITE (*,*)  atm_w16
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_16(1,j)!, corr_avg_cross_16(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_17,corr_avg_auto_17)
!CALL avgovertime(naverage, nstep, corr_cross_17,corr_avg_cross_17)
	
WRITE (*,*)  atm_w17
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_17(1,j)!, corr_avg_cross_17(1,j)

ENDDO

CALL avgovertime(naverage, nstep, corr_auto_18,corr_avg_auto_18)
!CALL avgovertime(naverage, nstep, corr_cross_18,corr_avg_cross_18)
	
WRITE (*,*)  atm_w18
WRITE (*,*) 'md_step', 'OCF_AUTO', 'OCF_CROSS'
WRITE (*,*)

DO j = 1, nstep, skip

WRITE(*, 1100) j, corr_avg_auto_18(1,j)!, corr_avg_cross_18(1,j)

ENDDO



1100 FORMAT (I9, 2X, F8.5)

END SUBROUTINE history_parser_ave_od_aq_modified
