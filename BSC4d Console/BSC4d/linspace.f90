	subroutine linspace(xmin,xmax,n,x) 
	real*8 xmin,xmax,x(1),d
! Формирование вектора х(i), содержащего n-элементов, 
! значения которых лежат в диапазоне xmin..xmax.

	d=(xmax-xmin)/(n-1)
	do 1 i=1,n
1	x(i)=xmin + d*(i-1)

	return
	end