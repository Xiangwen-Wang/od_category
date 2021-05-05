# od_category
Water reorientation dynamics. 

The purpose:
Rotational motion of water molecules plays a crucial role in the breaking and making of HBs. We have therefore quantified the rotational relaxation of the water dipole by computing the first-order Legendre polynomial time correlation function

P_1 (t)=  <μ ⃗(0)∙μ ⃗(t)>/ <μ ⃗(0)>^2 	

where μ(0) and μ(t) are the unit vectors defining the orientation of the dipole moment of a water molecule at times 0 and t, respectively. The average in Equation more strongly hydrogen-bonded water molecules reorient more slowly was computed over all water molecules in the solution, using several time origins and overlapping intervals [0, t] of equal time length (t = 16 ps)  
The P1(t) function starts at 1 and decays asymptotically to zero because of the random and isotropic orientation of the water molecules in solution. The early stages of fast loss of correlation is caused by librational motion, whereas the long term decay is due to reorientational motion and can be fit by a bi-exponential model, exp(−t/τ1) + b exp(−t/τ2). The overall time associated with this process, τreor, is given by the sum of the fitting parameters τ1 and τ2.


The code is a bit messy. No instruction is included in line by line.

It is constructed of four parts.

1. Categorize water molecule and write all-atom position(WOHH)
2. Calculate dipole unit vector of all waters in every timestep
3. Calculate the time correlation function of each water categories with given time origin
4. Average over different time origin


There is a good working example of PARAM file for MgCl2. Here I clarify the meaning of the parameters.


 rcut_ohw =    This is the cut-off value which is used to define OH covalent bond by distance from Oxygen to Hydrogen

 naverage =     This is number of average (sampling number). I tried to get sufficient number of naverage testing the graph is unchanged when I take more average number (ex) 1,4,8,16,32..... after 256 sampling then graph show similar results then I choose the number above 256..



  nw = number of water moleucuels in system

  offset = time origin offset (ex) 1 --> time origin 1, 11, 21, ...  5--> time origin 5, 15, 25 ....

  skip = data skipping point (to minimize computation cost)

  atm_w1, atm_w2, atm_w3, atm_w4, atm_w5, atm_w6, atm_w7, atm_w8, atm_w9, atm_w10, atm_w11, atm_w12, atm_w13, atm_w14, atm_w15, atm_w16, atm_w17, atm_w18 = subpopulations
