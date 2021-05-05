module shared_data

implicit none

save

integer, parameter :: sgl = selected_real_kind(p=6)
integer, parameter :: dbl = selected_real_kind(p=12)
integer, parameter :: str_length = 8

real, parameter :: pi    = 3.141592650_dbl      ! pi_greco

!##################################################################################
!real, parameter :: delr = 0.025_dbl		! bin size in Ang
!real, parameter :: delr = 1.0_dbl		! bin size in Ang
real, parameter :: delr = 0.005_dbl		! bin size in Ang
!
!  Bin size used by S.Izvekov et al., JCP (2002), 116, 10372. Smaller bin size
!  gave indistinguishable results.
!##################################################################################

!##################################################################################
!real, parameter :: del_theta = 0.03_dbl            ! bin size in radiants
real, parameter :: del_theta = 0.005_dbl            ! bin size in radiants
!real, parameter :: del_theta = 0.0025_dbl           ! bin size in radiants
!real, parameter :: del_theta = 0.0008_dbl           ! bin size in radiants
!##################################################################################


end module shared_data

