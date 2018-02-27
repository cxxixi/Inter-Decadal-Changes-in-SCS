program scsmi
	integer t
	real value1,value2,count
	real::a(9,9)
	real::b(5,9)
	character(len=30)::filename,dir
	character(len=4)::str

open(2,file='F:\data\jra55\u\scsmi.txt')

do t=1981,1986
	value1=0 
	value2=0
	write(str,'(i4)')t
    filename='F:\data\jra55\u\'//trim(adjustl(str))//'1.dat'
	open(1,file=filename,form='binary',access='direct',recl=4*9*9)
	read(1,rec=1) ((a(i,j),j=1,9),i=1,9)
	count=0
	do i=1,9
		do j=1,9
			if (abs(a(i,j))>100) then
				count=count+1
			endif 
		enddo
	enddo
	print*, count
	
	do i=1,9
		do j=1,9
			value1=value1+a(i,j)/(81.0-count)	
		enddo
	enddo
	close(1)
	
	filename='F:\data\jra55\u\'//trim(adjustl(str))//'2.dat'
	open(1,file=filename,form='binary',access='direct',recl=4*9*5)
	read(1,rec=1) ((b(i,j),j=1,9),i=1,5)
	
	count=0
	do i=1,5
		do j=1,9
			if (abs(b(i,j))>100) then
				count=count+1
			end if
		enddo
	enddo
	print*, count
	do i=1,5
		do j=1,9
			value2=value2+b(i,j)/(45.0-count)
		enddo
	enddo	
	close(1)
	write(2,*) t,value1-value2
enddo

close(2)
end
	
