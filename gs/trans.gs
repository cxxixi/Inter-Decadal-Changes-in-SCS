'reinit'
i=1980
while (i<2003)
'sdfopen F:\data\pottmp.'i'.nc'
'set fwrite F:\data\pottmp.'i'.dat'
'set gxout fwrite'
'set x 1 360'
'set y 1 418'
'set t 1 12'
'define sumheat=ave(pottmp,z=14,z=40)'
'd sumheat'
'disable fwrite'
i=i+1
'reinit'
endwhile
