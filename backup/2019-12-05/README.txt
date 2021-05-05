Dear, Prof. Tommaso, and Xiangwen Wang 

Sorry for the late reply. The code you request is in the path: /data/home/mpx352/tools/md_analyzer/od_category
I think Prof. Tommaso has the authority to log in to my account. The code is a bit messy. No instruction is included in line by line.

It is constructed of four parts.

1. Categorize water molecule and write all-atom position(WOHH)
2. Calculate dipole unit vector of all waters in every timestep
3. Calculate the time correlation function of each water categories with given time origin
4. Average over different time origin

The file attached is the requested hydration number table.

For the paper, last week I have to spend all the time with the new experiments proposal,(deadline is early October). I'm very sorry.
I'll try to write a draft with the data in this week and probably I wish to have a chat with you about the updated draft

Best regards,

Seonmyeong Kim


***********************************

Could you send me a good working example of PARAM file that you used for MgCl2? I looked at the code and I can understand most parameters. However, could you clarify the meaning of the
 

 rcut_ohw =    This is the cut-off value which is used to define OH covalent bond by distance from Oxygen to Hydrogen   

 naverage =     Yes, this is number of average (sampling number). I tried to get sufficient number of naverage testing the graph is unchanged when I take more average number (ex) 1,4,8,16,32..... after 256 sampling then graph show similar results then I choose the number above 256..

  

  nw = number of water moleucuels in system

  offset = time origin offset (ex) 1 --> time origin 1, 11, 21, ...  5--> time origin 5, 15, 25 ....  

  skip = data skipping point (to minimize computation cost)

  atm_w1, atm_w2, atm_w3, atm_w4, atm_w5, atm_w6, atm_w7, atm_w8, atm_w9, atm_w10, atm_w11, atm_w12, atm_w13, atm_w14, atm_w15, atm_w16, atm_w17, atm_w18 =

   

   Could you send us an example of the file water_classification.txt ?
    

    Param file and water classification files is now uploaded former path

     

     /data/home/mpx352/tools/md_analyzer/od_category

      

      Best regards,

       

       Seonmyeong Kim
