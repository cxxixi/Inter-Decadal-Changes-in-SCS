program trans 
implicit none
integer ix,iy,it
parameter(ix=360,iy=418,it=12)
real heat(ix,iy,it)
real ave1(ix,iy,it)
real ave2(ix,iy,it)
real subtract(ix,iy,it)
real season(ix,iy)
integer i,j,k,rec,t
character(len=30)::filename,dir
character(len=4)::str,str1

do t=1980,1993
	write(str,'(i4)')t
    filename='F:\data\pottmp.'//trim(adjustl(str))//'.dat'
	open(1,file=filename,form='binary',access='direct',recl=4*ix*iy)
	do k=1,it
		read(1,rec=k) ((heat(i,j,k),i=1,ix),j=1,iy)
	enddo
	do k=1,it
		do j=1,iy
			do i=1,ix
				ave1(i,j,k)=ave1(i,j,k)+1.0/14*heat(i,j,k)
			enddo
		enddo
	enddo
	close(1)
enddo

do t=1994,2002
	write(str,'(i4)')t
    filename='F:\data\pottmp.'//trim(adjustl(str))//'.dat'
	open(1,file=filename,form='binary',access='direct',recl=4*ix*iy)
	do k=1,it
		read(1,rec=k) ((heat(i,j,k),i=1,ix),j=1,iy)
	enddo
	do k=1,it
		do j=1,iy
			do i=1,ix
				ave2(i,j,k)=ave2(i,j,k)+1.0/9*heat(i,j,k)
			enddo
		enddo
	enddo
	close(1)
enddo

do k=1,it
	do j=1,iy
		do i=1,ix
			subtract(i,j,k)=ave2(i,j,k)-ave1(i,j,k)
		enddo
	enddo
enddo

do j=1,iy
	do i=1,ix
		season(i,j)=(subtract(i,j,12)+subtract(i,j,1)+subtract(i,j,2))/3.0
	enddo
enddo
open(3,file='F:\data\winter.dat',form='binary',access='direct',recl=4*ix*iy)
write(3,rec=1) ((season(i,j),i=1,ix),j=1,iy)

do j=1,iy
	do i=1,ix
		season(i,j)=(subtract(i,j,3)+subtract(i,j,4)+subtract(i,j,5))/3.0
	enddo
enddo
open(3,file='F:\data\spring.dat',form='binary',access='direct',recl=4*ix*iy)
write(3,rec=1) ((season(i,j),i=1,ix),j=1,iy)

do j=1,iy
	do i=1,ix
		season(i,j)=(subtract(i,j,6)+subtract(i,j,7)+subtract(i,j,8))/3.0
	enddo
enddo
open(3,file='F:\data\summer.dat',form='binary',access='direct',recl=4*ix*iy)
write(3,rec=1) ((season(i,j),i=1,ix),j=1,iy)


dir='F:\data\subtraction.txt'
open(2,file=dir)
do k=1,it
  do j=1,iy
	write(2,100) (subtract(i,j,k),i=1,ix)
  end do
enddo
100 format(360(f20.2,2x)) 
close(2)

end

