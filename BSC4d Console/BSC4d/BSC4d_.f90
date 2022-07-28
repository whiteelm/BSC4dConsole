    program bsc4d_
!	Тест подпрограммы bsc4d(iprint,aa,dL,dC)
!   BSCL (Broad-Side Coupled Line)- Связанные линии с лицевой связью 
	implicit real*8(a-b,d-h,o-v,x-y)
    dimension aa(9),dL(4),dC(4),Um(4),dZ0(4),em(2),dCC(4),dLL(4)
!------------------------------------------------------------------------------
! Исходные данные:
! Инициализация для  тестирования:
  n=2; aw1=.4; aw2=.8; h1=.2; h2=.25;  t=.015; e1=20; e2=1 ! Тестовый !
!==============================================================================
 !	Исходные данные для подпрограммы bsc4d1(iprint,aa,dL,dC):
    aa(1) = n    ! количество линий
    aa(2) = aw1  ! ширина верхней линии 
	aa(3) = aw2  ! ширина нижней линии
    aa(4) = h1   ! высота верхнего бруска-подложки
    aa(5) = h2   ! высота зазора снизу
	aa(6) = t    ! толщина полосок (линий)
    aa(7) = e1   ! диэл.проницаем. бруска-подложки
    aa(8) = e2   ! диэл.проницаем. среды
!------------------------------------------------------------------------------
	iprint = -2   ! Индекс печати = -2,-1,0,1.  Для тестирования лучше iprint = 0.
			     ! Если ничего не печатать в подпрограмме bsc4d, то iprint = -2.
    print*,'Input BSCL:'; write(*,1) aw1,aw2,h1,h2,t,e1,e2 
1   format(' w1=',f5.2,' w2=',f5.2,' h1=',f5.3,' h2=',f5.3,' t=',f5.3,' e1=',f5.2,' e2=',f5.2)
	call bsc4d(iprint,aa,dL,dC)			! Обращение к подпрограмме
	dCC=dC
    dLL=dL
    call dminv(dLL,n,ad)
    call nroot(n,dCC,11.127*dLL,em,Um)
    call impedance(n,dC,Um,em,dZ0)
    print*,'Capacitance matrix [C] (pF/m)';		call DPRINT(dC, n)
    print*,'Inductance matrix [L] (uH/m)';		call DPRINT(dL, n)
    print*,'Modal voltage matrix [Um] (V)'; 	call DPRINT(Um, n)
    print*,'Impedance matrix [Z0] (Ohm)'; 	    call DPRINT(dZ0, n)
    print*,'Modal dielectric permitivities [em]';
    do i =1,n;
        print '(f8.2)',em(i);
    enddo;
    if(n==2) print'(a20,f8.4)','m = sqrt(em1/em2) =', sqrt(em(1)/em(2));  print*
	end