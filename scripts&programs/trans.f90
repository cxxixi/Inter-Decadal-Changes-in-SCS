program trans 
parameter(ix=360,iy=240,it=12)
real heat(ix,iy)
integer i,j

open(1,file='C:\Users\think\Desktop\pottmp.1980.dat',form='unformatted',access='direct',recl=4*ix*iy)
open(2,file='C:\Users\think\Desktop\pottmp.1980.txt')
read(1,rec=1) ((heat(i,j),i=1,360),j=1,240)

write(2,*) ((heat(i,j),i=1,360),j=1,240)

end

