      MODULE FIB1_MODULE
         IMPLICIT NONE
         CONTAINS
         SUBROUTINE FIB1(A,N)
            INTEGER, INTENT(IN) :: N
            REAL*8, DIMENSION(N), INTENT(OUT) :: A
            INTEGER :: I
            DO I=1,N
               IF (I.EQ.1) THEN
               A(I) = 0.0D0
               ELSEIF (I.EQ.2) THEN
               A(I) = 1.0D0
               ELSE
               A(I) = A(I-1) + A(I-2)
               ENDIF
            ENDDO
         END SUBROUTINE FIB1
      END MODULE FIB1_MODULE