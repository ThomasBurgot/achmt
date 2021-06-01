MODULE YOMCST

USE PARKIND1  ,ONLY : JPRB

IMPLICIT NONE

SAVE

!     ------------------------------------------------------------------

!*    Common of physical constants
!     You will find the meanings in the annex 1 of the documentation

! A1.0 Fundamental constants
! * RPI          : number Pi
! * RCLUM        : light velocity
! * RHPLA        : Planck constant
! * RKBOL        : Bolzmann constant
! * RNAVO        : Avogadro number
REAL(KIND=JPRB) :: RPI
!$acc declare create (RPI)
REAL(KIND=JPRB) :: RCLUM
!$acc declare create (RCLUM)
REAL(KIND=JPRB) :: RHPLA
!$acc declare create (RHPLA)
REAL(KIND=JPRB) :: RKBOL
!$acc declare create (RKBOL)
REAL(KIND=JPRB) :: RNAVO
!$acc declare create (RNAVO)

! A1.1 Astronomical constants
! * RDAY         : duration of the solar day
! * RDAYI        : invariant time unit of 86400s
! * RHOUR        : duration of the solar hour 
! * REA          : astronomical unit (mean distance Earth-sun)
! * REPSM        : polar axis tilting angle
! * RSIYEA       : duration of the sideral year
! * RSIDAY       : duration of the sideral day
! * ROMEGA       : angular velocity of the Earth rotation
REAL(KIND=JPRB) :: RDAY
!$acc declare create (RDAY)
REAL(KIND=JPRB) :: RDAYI
!$acc declare create (RDAYI)
REAL(KIND=JPRB) :: RHOUR
!$acc declare create (RHOUR)
REAL(KIND=JPRB) :: REA
!$acc declare create (REA)
REAL(KIND=JPRB) :: REPSM
!$acc declare create (REPSM)
REAL(KIND=JPRB) :: RSIYEA
!$acc declare create (RSIYEA)
REAL(KIND=JPRB) :: RSIDAY
!$acc declare create (RSIDAY)
REAL(KIND=JPRB) :: ROMEGA
!$acc declare create (ROMEGA)

! A1.2 Geoide
! * RA           : Earth radius
! * RG           : gravity constant
! * R1SA         : 1/RA
REAL(KIND=JPRB) :: RA
!$acc declare create (RA)
REAL(KIND=JPRB) :: RG
!$acc declare create (RG)
REAL(KIND=JPRB) :: R1SA
!$acc declare create (R1SA)

! A1.3 Radiation
! * RSIGMA       : Stefan-Bolzman constant
! * RI0          : solar constant
REAL(KIND=JPRB) :: RSIGMA
!$acc declare create (RSIGMA)
REAL(KIND=JPRB) :: RI0
!$acc declare create (RI0)

! A1.4 Thermodynamic gas phase
! * R            : perfect gas constant
! * RMD          : dry air molar mass
! * RMV          : vapour water molar mass
! * RMO3         : ozone molar mass
! * RD           : R_dry (dry air constant)
! * RV           : R_vap (vapour water constant)
! * RCPD         : Cp_dry (dry air calorific capacity at constant pressure)
! * RCPV         : Cp_vap (vapour calorific capacity at constant pressure)
! * RCVD         : Cv_dry (dry air calorific capacity at constant volume)
! * RCVV         : Cv_vap (vapour calorific capacity at constant volume)
! * RKAPPA       : Kappa = R_dry/Cp_dry
! * RETV         : R_vap/R_dry - 1
! * RMCO2        : CO2 (carbon dioxyde) molar mass
! * RMCH4        : CH4 (methane) molar mass
! * RMN2O        : N2O molar mass
! * RMCO         : CO (carbon monoxyde) molar mass
! * RMHCHO       : HCHO molar mass
! * RMNO2        : NO2 (nitrogen dioxyde) molar mass
! * RMSO2        : SO2 (sulfur dioxyde) molar mass
! * RMSO4        : SO4 (sulphate) molar mass
REAL(KIND=JPRB) :: R
!$acc declare create (R)
REAL(KIND=JPRB) :: RMD
!$acc declare create (RMD)
REAL(KIND=JPRB) :: RMV
!$acc declare create (RMV)
REAL(KIND=JPRB) :: RMO3
!$acc declare create (RMO3)
REAL(KIND=JPRB) :: RD
!$acc declare create (RD)
REAL(KIND=JPRB) :: RV
!$acc declare create (RV)
REAL(KIND=JPRB) :: RCPD
!$acc declare create (RCPD)
REAL(KIND=JPRB) :: RCPV
!$acc declare create (RCPV)
REAL(KIND=JPRB) :: RCVD
!$acc declare create (RCVD)
REAL(KIND=JPRB) :: RCVV
!$acc declare create (RCVV)
REAL(KIND=JPRB) :: RKAPPA
!$acc declare create (RKAPPA)
REAL(KIND=JPRB) :: RETV
!$acc declare create (RETV)
REAL(KIND=JPRB) :: RMCO2
!$acc declare create (RMCO2)
REAL(KIND=JPRB) :: RMCH4
!$acc declare create (RMCH4)
REAL(KIND=JPRB) :: RMN2O
!$acc declare create (RMN2O)
REAL(KIND=JPRB) :: RMCO
!$acc declare create (RMCO)
REAL(KIND=JPRB) :: RMHCHO
!$acc declare create (RMHCHO)
REAL(KIND=JPRB) :: RMNO2
!$acc declare create (RMNO2)
REAL(KIND=JPRB) :: RMSO2
!$acc declare create (RMSO2)
REAL(KIND=JPRB) :: RMSO4
!$acc declare create (RMSO4)

! A1.5,6 Thermodynamic liquid,solid phases
! * RCW          : Cw (calorific capacity of liquid water)
! * RCS          : Cs (calorific capacity of solid water)
REAL(KIND=JPRB) :: RCW
!$acc declare create (RCW)
REAL(KIND=JPRB) :: RCS
!$acc declare create (RCS)

! A1.7 Thermodynamic transition of phase
! * RATM         : pre_n = "normal" pressure
! * RTT          : Tt = temperature of water fusion at "pre_n"
! * RLVTT        : RLvTt = vaporisation latent heat at T=Tt
! * RLSTT        : RLsTt = sublimation latent heat at T=Tt
! * RLVZER       : RLv0 = vaporisation latent heat at T=0K
! * RLSZER       : RLs0 = sublimation latent heat at T=0K
! * RLMLT        : RLMlt = melting latent heat at T=Tt
! * RDT          : Tt - Tx(ew-ei)
REAL(KIND=JPRB) :: RATM
!$acc declare create (RATM)
REAL(KIND=JPRB) :: RTT
!$acc declare create(RTT)
REAL(KIND=JPRB) :: RLVTT
!$acc declare create (RLVTT)
REAL(KIND=JPRB) :: RLSTT
!$acc declare create (RLSTT)
REAL(KIND=JPRB) :: RLVZER
!$acc declare create (RLVZER)
REAL(KIND=JPRB) :: RLSZER
!$acc declare create (RLSZER)
REAL(KIND=JPRB) :: RLMLT
!$acc declare create (RLMLT)
REAL(KIND=JPRB) :: RDT
!$acc declare create (RDT)

! A1.8 Curve of saturation
! * RESTT        : es(Tt) = saturation vapour tension at T=Tt
! * RGAMW        : Rgamw = (Cw-Cp_vap)/R_vap
! * RBETW        : Rbetw = RLvTt/R_vap + Rgamw*Tt
! * RALPW        : Ralpw = log(es(Tt)) + Rbetw/Tt + Rgamw*log(Tt)
! * RGAMS        : Rgams = (Cs-Cp_vap)/R_vap
! * RBETS        : Rbets = RLsTt/R_vap + Rgams*Tt
! * RALPS        : Ralps = log(es(Tt)) + Rbets/Tt + Rgams*log(Tt)
! * RALPD        : Ralpd = Ralps - Ralpw
! * RBETD        : Rbetd = Rbets - Rbetw
! * RGAMD        : Rgamd = Rgams - Rgamw
REAL(KIND=JPRB) :: RESTT
!$acc declare create (RESTT)
REAL(KIND=JPRB) :: RGAMW
!$acc declare create (RGAMW)
REAL(KIND=JPRB) :: RBETW
!$acc declare create (RBETW)
REAL(KIND=JPRB) :: RALPW
!$acc declare create (RALPW)
REAL(KIND=JPRB) :: RGAMS
!$acc declare create (RGAMS)
REAL(KIND=JPRB) :: RBETS
!$acc declare create (RBETS)
REAL(KIND=JPRB) :: RALPS
!$acc declare create (RALPS)
REAL(KIND=JPRB) :: RALPD
!$acc declare create (RALPD)
REAL(KIND=JPRB) :: RBETD
!$acc declare create(RBETD)
REAL(KIND=JPRB) :: RGAMD
!$acc declare create (RGAMD)

! NaN value
CHARACTER(LEN=8), PARAMETER :: CSNAN = &
  & CHAR(0)//CHAR(0)//CHAR(0)//CHAR(0)//CHAR(0)//CHAR(0)//CHAR(244)//CHAR(127)
REAL(KIND=JPRB) :: RSNAN

!    ------------------------------------------------------------------
END MODULE YOMCST
