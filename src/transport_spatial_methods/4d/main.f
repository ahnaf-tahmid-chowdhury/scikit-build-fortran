      SUBROUTINE MAIN
      USE FIB1_MODULE
      USE FIB2_MODULE
      IMPLICIT NONE
      REAL*8, DIMENSION(10) :: A, B
      CALL FIB1(A, 10)  ! This calls the FIB1 subroutine
      CALL FIB2(B, 10)  ! This calls the FIB2 subroutine
      PRINT*, A
      PRINT*, B
      END