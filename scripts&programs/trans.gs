'reinit'
'i=1980'
while (i<1983)
'sdfopen F:\data\pottmp.'i'.nc'
'set fwrite C:\Users\think\Desktop\pottmp.'i'.dat'
'set gxout fwrite'
'set x 0 360'
'set y 111 350'
'define sumheat=ave(ave(pottmp,z=14,z=40),t=1,t=12)'
'd sumheat'
'disable fwrite'
i=i+1
endwhile