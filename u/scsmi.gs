'reinit'
i=1980
while(i<1987)
'open F:\data\jra55\u\'i'\u.ctl'
'set fwrite F:\data\jra55\u\'i'1.dat'
'set gxout fwrite'
'set z 7'
'set lon 110 120'
if (i=1980|1984)
'define a=ave(u,t=609,t=976)' 
else
'define a=ave(u,t=605,t=972)' 
endif
'set lat 5 15'
'd a'
'disable fwrite'
'set fwrite F:\data\jra55\u\'i'2.dat'
'set gxout fwrite'
'set lat 20 25'
'd a'
'disable fwrite'
i=i+1
'reinit'
endwhile
