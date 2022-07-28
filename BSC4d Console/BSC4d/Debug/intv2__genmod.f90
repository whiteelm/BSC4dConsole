        !COMPILER-GENERATED INTERFACE MODULE: Tue Feb 22 16:14:04 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE INTV2__genmod
          INTERFACE 
            FUNCTION INTV2(N,LINE,AMIN,AMAX,BMIN,BMAX,E1,E2)
              INTEGER(KIND=4) :: N
              COMPLEX(KIND=8) :: LINE(N)
              REAL(KIND=8) :: AMIN
              REAL(KIND=8) :: AMAX
              REAL(KIND=8) :: BMIN
              REAL(KIND=8) :: BMAX
              REAL(KIND=8) :: E1
              REAL(KIND=8) :: E2
              REAL(KIND=8) :: INTV2
            END FUNCTION INTV2
          END INTERFACE 
        END MODULE INTV2__genmod
