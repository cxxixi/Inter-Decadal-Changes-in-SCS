program trans 
implicit none
integer ix,iy,it
parameter(ix=360,iy=418,it=12)
real heat(ix,iy,it)
integer i,j,k,rec,t
character(len=30)::filename,dir
character(len=4)::str

do t=1980,2002
	write(str,'(i4)')t
    filename='F:\data\pottmp.'//trim(adjustl(str))//'.dat'
	dir='F:\data\pottmp.'//trim(adjustl(str))//'.txt'
	open(1,file=filename,form='binary',access='direct',recl=4*ix*iy)
	open(2,file=dir)
	do k=1,it
		read(1,rec=k) ((heat(i,j,k),i=1,ix),j=1,iy)
	enddo

	do k=1,it
	 do j=1,iy
		write(2,100) (heat(i,j,k),i=1,ix)
	 end do
	enddo
	100 format(360(f6.2,2x)) 
close(1)
close(2)
enddo
end

