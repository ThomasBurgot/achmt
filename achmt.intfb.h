INTERFACE
#ifdef USE_ACC
!$acc routine (ACHMT)
#endif
SUBROUTINE ACHMT ( KIDIA,KFDIA,KLON,KLEV,LDZ0H,&
 !-----------------------------------------------------------------------
 ! - INPUT  2D .
 & PAPHI,PAPHIF,PAPRS,PAPRSF,PCP,PQ,PR,PT,PU,PV,&
 & PFPLSH,PFPLCH,&
 ! - INPUT  1D .
 & PDPHIT,PDPHIV,PGZ0F,PGZ0HF,PGZ0RLF,PHV,PLSM,&
 & PNEIJG,PNEIJV,PSNS,PTS,PVEG0,PWFC,PWS,PWSI,&
 ! - INPUT  LOGIQUE .
 & LDCLS,LDHMT,&
 ! - OUTPUT 2D .
 & PNBVNO,PMRIPP,&
 ! - OUTPUT 1D .
 & PCD,PCDN,PCDROV,PCH,PCHROV,PCPS,PDQSTS,PGWDCS,&
 & PGZ0,PGZ0H,PHQ,PHU,PNEIJ,PQCLS,PQS,PQSATS,&
 & PRHCLS,PRS,PRTI,PSTAB,PTCLS,PUCLS,PVCLS,PUCLN,PVCLN,PZPCLS,PVEG,&
 & PXDROV,PXHROV,PURAF,PVRAF,KSTPT,KSTSZ,PSTACK)



#include "temp.h"

USE PARKIND1  ,ONLY : JPIM     ,JPRB     ,JPRD

!USE YOMPHY   , ONLY : YRPHY
!USE YOMCST   , ONLY : RPI      ,RG       ,RD       ,RV       ,&
! & RCPD     ,RCPV     ,RKAPPA   ,RETV     ,RCW      ,&
! & RCS      ,RLVTT    ,RLSTT    ,RTT      ,RALPW    ,&
! & RBETW    ,RGAMW    ,RALPS    ,RBETS    ,RGAMS    ,&
! & RALPD    ,RBETD    ,RGAMD  
!USE YOMPHY0  , ONLY : YRPHY0
!USE YOMPHY1  , ONLY : YRPHY1
!USE YOMPHY2  , ONLY : YRPHY2
!USE YOMCLI   , ONLY : STHER    ,SZZ0D


INTEGER(KIND=JPIM),INTENT(IN)    :: KLON 
INTEGER(KIND=JPIM),INTENT(IN)    :: KLEV 
INTEGER(KIND=JPIM),INTENT(IN)    :: KIDIA 
INTEGER(KIND=JPIM),INTENT(IN)    :: KFDIA 
LOGICAL, INTENT(IN) :: LDZ0H
REAL(KIND=JPRB)   ,INTENT(IN)    :: PAPHI(KLON,0:KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PAPHIF(KLON,KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PAPRS(KLON,0:KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PAPRSF(KLON,KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PCP(KLON,KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PQ(KLON,KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PR(KLON,KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PT(KLON,KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PU(KLON,KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PV(KLON,KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PFPLSH(KLON,0:KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PFPLCH(KLON,0:KLEV) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PDPHIT(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PDPHIV(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PGZ0F(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PGZ0HF(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PGZ0RLF(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PHV(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PLSM(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PNEIJG(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PNEIJV(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PSNS(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PTS(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PVEG0(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PWFC(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PWS(KLON) 
REAL(KIND=JPRB)   ,INTENT(IN)    :: PWSI(KLON) 
LOGICAL           ,INTENT(IN)    :: LDCLS 
LOGICAL           ,INTENT(IN)    :: LDHMT 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PNBVNO(KLON,0:KLEV) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PMRIPP(KLON,0:KLEV)
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PCD(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PCDN(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PCDROV(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PCH(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PCHROV(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PCPS(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PDQSTS(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PGWDCS(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PGZ0(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PGZ0H(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PHQ(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PHU(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PNEIJ(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PQCLS(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PQS(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PQSATS(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PRHCLS(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PRS(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PRTI(KLON)
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PSTAB(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PTCLS(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PUCLS(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PVCLS(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PUCLN(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PVCLN(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PZPCLS(KLON) 
REAL(KIND=JPRB)   ,INTENT(INOUT) :: PVEG(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PXDROV(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PXHROV(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PURAF(KLON) 
REAL(KIND=JPRB)   ,INTENT(OUT)   :: PVRAF(KLON) 
INTEGER,            INTENT(IN)   :: KSTSZ
INTEGER,            INTENT(IN)   :: KSTPT
REAL   ,            INTENT(INOUT):: PSTACK (KSTSZ)

END SUBROUTINE ACHMT

END INTERFACE
