program trans 
parameter(yr=34)
real mixed(yr,0:9)
integer year,i,j
real::scs(34)=(/1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4/)

open(10,file='C:\Users\think\Desktop\time_series\time_series.txt')
open(11,file='C:\Users\think\Desktop\time_series\time_series1.txt')
open(12,file='C:\Users\think\Desktop\time_series\time_series2.txt')
open(13,file='C:\Users\think\Desktop\time_series\time_series3.txt')
open(14,file='C:\Users\think\Desktop\time_series\time_series4.txt')
open(15,file='C:\Users\think\Desktop\time_series\time_series5.txt')
open(16,file='C:\Users\think\Desktop\time_series\time_series6.txt')
open(17,file='C:\Users\think\Desktop\time_series\time_series7.txt')
open(18,file='C:\Users\think\Desktop\time_series\time_series8.txt')
open(19,file='C:\Users\think\Desktop\time_series\time_series9.txt')

open(2,file='C:\Users\think\Desktop\time_series\time_series.dat')
open(3,file='C:\Users\think\Desktop\time_series\trail.txt')

do i=1,yr
	read(10,100) mixed(i,0)
	read(11,100) mixed(i,1)
	read(12,100) mixed(i,2)
	read(13,100) mixed(i,3)
	read(14,100) mixed(i,4)
	read(15,100) mixed(i,5)
	read(16,100) mixed(i,6)
	read(17,100) mixed(i,7)
	read(18,100) mixed(i,8)
	read(19,100) mixed(i,9)
enddo

100 format(f12.10)
do i=1,yr
	!write(2,*) scs(i)
	do j=0,9
		write(2,*) mixed(i,j)
		write(3,*) mixed(i,j)
	enddo
enddo
end

