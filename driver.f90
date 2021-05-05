!-----------------------------------------------------------------------------------!
!cOrientational Dynamics - correlation function of water dipole of each category----!
PROGRAM driver
!-----------------------------------------------------------------------------------!

USE shared_data

IMPLICIT NONE

INTEGER :: action

REAL(KIND=dbl) :: finish_time, start_time

CALL CPU_TIME(start_time)

WRITE (*,1310)
1310 FORMAT (' ', 'test                    Orientational Dynamics - correlation function of water dipole of each category')

CALL run_ave_od_aq_modified()

CALL CPU_TIME(finish_time)

PRINT ''
PRINT '("Time = ",f12.1," seconds.")', (finish_time - start_time)

END PROGRAM driver

