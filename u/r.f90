module variable
	integer ix,iy,it,t1,season
	parameter(ix=360,iy=418,it=12,yr=21,jd=3)
	real::heat(iy,ix,it)
	real::heat21(iy,ix,yr,jd)
	real::r(iy,ix)
	real::test(iy,ix)
	real::scsmi(yr)
	real::ave(iy,ix)
	real ave_scsmi,ave1,ave2,ave3,fz,fm1,fm2
	integer i,j,k,rec,t
	character(len=30)::filename
	character(len=4)::str
	character(len=1)::str1
endmodule
!____________________________________________________________________________________________________________
subroutine cal_heat(a,b,c,year,s)
    use variable
	integer s,a,b,c,year
	do i=1,iy
		do j=1,ix
			if (year>=1997) then
				heat21(i,j,year-1981,s)=(heat(i,j,a)+heat(i,j,b)+heat(i,j,c))/3.0
			else 
				heat21(i,j,year-1980,s)=(heat(i,j,a)+heat(i,j,b)+heat(i,j,c))/3.0
			endif
		enddo
	enddo
end

!______________________________________________________________________________________________
subroutine ave_(s)
	use variable
	integer s
	do i=1,iy
		do j=1,ix
			ave(i,j)=0
			do k=1,21
				ave(i,j)=ave(i,j)+heat21(i,j,k,s)/21.0
			end do
		enddo
	enddo
end

!计算相关系数 
subroutine cal_r(s)
	use variable
	integer s
	do i=1,iy
		do j=1,ix
			if (abs(ave(i,j))<350) then 
			fm1=0;fm2=0;fz=0
			do k=1,yr
				fz=fz+(scsmi(k)-ave_scsmi)*(heat21(i,j,k,s)-ave(i,j))
				fm1=fm1+(scsmi(k)-ave_scsmi)**2
				fm2=fm2+(heat21(i,j,k,s)-ave(i,j))**2
			enddo
			r(i,j)=fz/(sqrt(fm1*fm2))
			else
				r(i,j)=0;
			endif
		enddo
	end do	
end

!____________________________________________________________________________________
subroutine printit(s)!打印
	use variable
	integer s
	write(str1,'(i1)')s
	open(2,file='F:\data\jra55\u\r_'//trim(adjustl(str1))//'.dat',form='binary',recl=4*ix*iy) 
	open(3,file='F:\data\jra55\u\r_'//trim(adjustl(str1))//'.txt') 
	write(2,rec=1) ((r(i,j),j=1,ix),i=1,iy)
	close(2)
	do i=1,iy
		write(3,100) (r(i,j),j=1,ix)
	enddo
100 format(360(f5.2))
	close(3)

	open(2,file='F:\data\jra55\u\test_'//trim(adjustl(str1))//'.dat',form='binary',recl=4*ix*iy) 
	open(3,file='F:\data\jra55\u\test_'//trim(adjustl(str1))//'.txt') 
	write(2,rec=1) ((test(i,j),j=1,ix),i=1,iy)
	close(2)
	do i=1,iy
		write(3,100) (test(i,j),j=1,ix)
	enddo
	close(3)
end

subroutine test_r(s)
	use variable 
	integer s
	real t_r
	do i=1,iy
		do j=1,ix
			test(i,j)=0
		enddo
	enddo
	do i=1,iy
		do j=1,ix
			t_r=abs(r(i,j))*sqrt(19/(1-r(i,j)**2))
			if(t_r>2.086) test(i,j)=0.95
			if((t_r<2.086).and.(t_r>1.725)) test(i,j)=0.90
			if((t_r<1.725).and.(t_r>1.325)) test(i,j)=0.8
			if((t_r<1.325).and.(t_r>0.86)) test(i,j)=0.6
			if((t_r<0.86).and.(t_r>0.533)) test(i,j)=0.4
			if((t_r<0.533).and.(t_r>0.257)) test(i,j)=0.2
			if (t_r<0.257) test(i,j)=0
		enddo
	enddo
end
!计算22年三季度的热含量_________________________________________________________________________________________

program r_calculation
	use variable
	open(1,file='F:\data\jra55\u\scsmi.txt')
	read(1,*) (scsmi(i),i=1,21)
	close(1)
do t=1981,2002
	if (t==1996) cycle
	write(str,'(i4)')t
    filename='F:\data\pottmp.'//trim(adjustl(str))//'.dat'
	open(1,file=filename,form='binary',access='direct',recl=4*ix*iy)
	do k=1,11
		read(1,rec=k) ((heat(j,i,k),i=1,ix),j=1,iy)
	enddo
	close(1)

!打开上一年的数据，用前一年十二月的数据替换这一年的数据
	t1=t-1
	write(str,'(i4)')t1
    filename='F:\data\pottmp.'//trim(adjustl(str))//'.dat'
	open(1,file=filename,form='binary',access='direct',recl=4*ix*iy)
	read(1,rec=12)((heat(j,i,12),i=1,ix),j=1,iy)

!算东春夏季度的热含量
	call cal_heat(12,1,2,t,1)
	call cal_heat(3,4,5,t,2)
	call cal_heat(6,7,8,t,3)
	close(1)
enddo

!计算相关系数——————————————————————————————
!计算平均值
	ave_scsmi=0; mean=0;
	do i=1,yr
		ave_scsmi=ave_scsmi+scsmi(i)/yr
	end do
	call ave_(1)
	call cal_r(1)
	call test_r(1)
	call printit(1)
	call ave_(2)
	call cal_r(2)
	call test_r(2)
	call printit(2)
	call ave_(3)
	call cal_r(3)
	call test_r(3)
	call printit(3)
end
