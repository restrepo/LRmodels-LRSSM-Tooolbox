      SUBROUTINE ML5_0_LOOP_CT_CALLS_1(P,NHEL,H,IC)
C     
C     Modules
C     
      USE ML5_0_POLYNOMIAL_CONSTANTS
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=5)
      INTEGER    NCOMB
      PARAMETER (NCOMB=32)
      INTEGER NBORNAMPS
      PARAMETER (NBORNAMPS=2)
      INTEGER    NLOOPS, NLOOPGROUPS, NCTAMPS
      PARAMETER (NLOOPS=11, NLOOPGROUPS=9, NCTAMPS=28)
      INTEGER    NLOOPAMPS
      PARAMETER (NLOOPAMPS=39)
      INTEGER    NWAVEFUNCS,NLOOPWAVEFUNCS
      PARAMETER (NWAVEFUNCS=10,NLOOPWAVEFUNCS=27)
      REAL*8     ZERO
      PARAMETER (ZERO=0D0)
      REAL*16     MP__ZERO
      PARAMETER (MP__ZERO=0.0E0_16)
C     These are constants related to the split orders
      INTEGER    NSO, NSQUAREDSO, NAMPSO
      PARAMETER (NSO=0, NSQUAREDSO=0, NAMPSO=0)
C     
C     ARGUMENTS
C     
      REAL*8 P(0:3,NEXTERNAL)
      INTEGER NHEL(NEXTERNAL), IC(NEXTERNAL)
      INTEGER H
C     
C     LOCAL VARIABLES
C     
      INTEGER I,J,K
      COMPLEX*16 COEFS(MAXLWFSIZE,0:VERTEXMAXCOEFS-1,MAXLWFSIZE)

      LOGICAL DUMMYFALSE
      DATA DUMMYFALSE/.FALSE./
C     
C     GLOBAL VARIABLES
C     
      INCLUDE 'coupl.inc'
      INCLUDE 'mp_coupl.inc'

      INTEGER HELOFFSET
      INTEGER GOODHEL(NCOMB)
      LOGICAL GOODAMP(NSQUAREDSO,NLOOPGROUPS)
      COMMON/ML5_0_FILTERS/GOODAMP,GOODHEL,HELOFFSET

      LOGICAL CHECKPHASE
      LOGICAL HELDOUBLECHECKED
      COMMON/ML5_0_INIT/CHECKPHASE, HELDOUBLECHECKED

      INTEGER SQSO_TARGET
      COMMON/ML5_0_SOCHOICE/SQSO_TARGET

      LOGICAL UVCT_REQ_SO_DONE,MP_UVCT_REQ_SO_DONE,CT_REQ_SO_DONE
     $ ,MP_CT_REQ_SO_DONE,LOOP_REQ_SO_DONE,MP_LOOP_REQ_SO_DONE
     $ ,CTCALL_REQ_SO_DONE,FILTER_SO
      COMMON/ML5_0_SO_REQS/UVCT_REQ_SO_DONE,MP_UVCT_REQ_SO_DONE
     $ ,CT_REQ_SO_DONE,MP_CT_REQ_SO_DONE,LOOP_REQ_SO_DONE
     $ ,MP_LOOP_REQ_SO_DONE,CTCALL_REQ_SO_DONE,FILTER_SO

      INTEGER I_SO
      COMMON/ML5_0_I_SO/I_SO
      INTEGER I_LIB
      COMMON/ML5_0_I_LIB/I_LIB

      COMPLEX*16 AMP(NBORNAMPS)
      COMMON/ML5_0_AMPS/AMP
      COMPLEX*16 W(20,NWAVEFUNCS)
      COMMON/ML5_0_W/W

      COMPLEX*16 WL(MAXLWFSIZE,0:LOOPMAXCOEFS-1,MAXLWFSIZE
     $ ,0:NLOOPWAVEFUNCS)
      COMPLEX*16 PL(0:3,0:NLOOPWAVEFUNCS)
      COMMON/ML5_0_WL/WL,PL

      COMPLEX*16 AMPL(3,NCTAMPS)
      COMMON/ML5_0_AMPL/AMPL

C     
C     ----------
C     BEGIN CODE
C     ----------

C     The target squared split order contribution is already reached
C      if true.
      IF (FILTER_SO.AND.CTCALL_REQ_SO_DONE) THEN
        GOTO 1001
      ENDIF

C     CutTools call for loop numbers 1
      CALL ML5_0_LOOP_2(6,9,DCMPLX(ZERO),DCMPLX(ZERO),1,I_SO,1)
C     CutTools call for loop numbers 2
      CALL ML5_0_LOOP_3(2,7,6,DCMPLX(ZERO),DCMPLX(ZERO),DCMPLX(ZERO),2
     $ ,I_SO,2)
C     CutTools call for loop numbers 3
      CALL ML5_0_LOOP_3(1,7,8,DCMPLX(ZERO),DCMPLX(ZERO),DCMPLX(ZERO),2
     $ ,I_SO,3)
C     CutTools call for loop numbers 4
      CALL ML5_0_LOOP_4(1,2,5,7,DCMPLX(ZERO),DCMPLX(ZERO),DCMPLX(ZERO)
     $ ,DCMPLX(ZERO),3,I_SO,4)
C     CutTools call for loop numbers 5,8
      CALL ML5_0_LOOP_3(1,5,9,DCMPLX(ZERO),DCMPLX(ZERO),DCMPLX(ZERO),2
     $ ,I_SO,5)
C     CutTools call for loop numbers 6
      CALL ML5_0_LOOP_4(1,5,2,7,DCMPLX(ZERO),DCMPLX(ZERO),DCMPLX(ZERO)
     $ ,DCMPLX(ZERO),3,I_SO,6)
C     CutTools call for loop numbers 7
      CALL ML5_0_LOOP_4(1,2,7,5,DCMPLX(ZERO),DCMPLX(ZERO),DCMPLX(ZERO)
     $ ,DCMPLX(ZERO),3,I_SO,7)
C     CutTools call for loop numbers 9
      CALL ML5_0_LOOP_2(8,10,DCMPLX(ZERO),DCMPLX(ZERO),1,I_SO,8)
C     CutTools call for loop numbers 10,11
      CALL ML5_0_LOOP_3(2,5,10,DCMPLX(ZERO),DCMPLX(ZERO),DCMPLX(ZERO)
     $ ,2,I_SO,9)

      GOTO 1001
 5000 CONTINUE
      CTCALL_REQ_SO_DONE=.TRUE.
 1001 CONTINUE
      END

