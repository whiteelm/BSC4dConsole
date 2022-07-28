    program bsc4d_
!	���� ������������ bsc4d(iprint,aa,dL,dC)
!   BSCL (Broad-Side Coupled Line)- ��������� ����� � ������� ������ 
	implicit real*8(a-b,d-h,o-v,x-y)
    dimension aa(9),dL(4),dC(4),Um(4),dZ0(4),em(2),dCC(4),dLL(4)
!------------------------------------------------------------------------------
! �������� ������:
! ������������� ���  ������������:
  n=2; aw1=.4; aw2=.8; h1=.2; h2=.25;  t=.015; e1=20; e2=1 ! �������� !
!==============================================================================
 !	�������� ������ ��� ������������ bsc4d1(iprint,aa,dL,dC):
    aa(1) = n    ! ���������� �����
    aa(2) = aw1  ! ������ ������� ����� 
	aa(3) = aw2  ! ������ ������ �����
    aa(4) = h1   ! ������ �������� ������-��������
    aa(5) = h2   ! ������ ������ �����
	aa(6) = t    ! ������� ������� (�����)
    aa(7) = e1   ! ����.���������. ������-��������
    aa(8) = e2   ! ����.���������. �����
!------------------------------------------------------------------------------
	iprint = -2   ! ������ ������ = -2,-1,0,1.  ��� ������������ ����� iprint = 0.
			     ! ���� ������ �� �������� � ������������ bsc4d, �� iprint = -2.
    print*,'Input BSCL:'; write(*,1) aw1,aw2,h1,h2,t,e1,e2 
1   format(' w1=',f5.2,' w2=',f5.2,' h1=',f5.3,' h2=',f5.3,' t=',f5.3,' e1=',f5.2,' e2=',f5.2)
	call bsc4d(iprint,aa,dL,dC)			! ��������� � ������������
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