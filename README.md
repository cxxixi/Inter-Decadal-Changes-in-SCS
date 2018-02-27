## Inter-Decadal-Changes-in-SCS

This Project uses reanalysis data(JRA-55) produced by JMA to analyse the inter-decadal changes occured in the South China Sea. 


## DATA
Sea Surface Temperature(SST) reanalysis data from 1980-present is available on this [weibsite](http://jra.kishou.go.jp/JRA-55/index_en.html#jra-55)

## Prerequisits 
Notice : This project is mainly done using `Fortran`(A programming language designed for distributed calculation) and `GrADS`(a data visualization software mainly used in meteorological community). `Gv GrADS metafile viewer` is also needed for viewing the .gmf pictures.

#### Links  
1.[`Download Fortran`](http://tieba.baidu.com/p/2753187458)  
2.[`Download GrADS`](http://www.06climate.com/view/1501.html)  

`Notice:` Gv GrADS metafile viewer is included in the OpenGrADS files. You can search gv32.exe to find where it locates.

## Instructions
#### Major Procedures
With the data downloaded from JMA, you can take the following steps to run out your own results:

STEP1 : use the wind as an indicator of South China Sea Monsoon Index(SCSMI).  
        `Notice:` Only used the east-western wind rather than integreted wind, which means you ONLY NEED to download U wind data.  
STEP2 : use Fortran to wrangle the data and output it as legal formats that GrADS can reads.  
          Here you can implement your algorithm like PCA, SVD or wavelet method to analysis your data.  
STEP3 : use GrADS to visulize the .dat data.

#### A brief introduction to how to use .gs &. ctl files 
.gs & .ctl files are commonly used when you plot graphs using GrADS.   
`.gs` is kind of batch file in which you write batch commands and you can directly run .gs file in GrADS.   
`. ctl` files are description files that describe the format of data stored in .dat files. This file is compulsory, without which GrADS cannot interprete the data.




