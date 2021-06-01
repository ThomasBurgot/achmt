MODULE YOMCLI

USE PARKIND1  ,ONLY : JPIM     ,JPRB

IMPLICIT NONE

SAVE

!  *YOMCLI* : constants for new configuration 923

! Dataset description

!  - namelist -
!  NPINT  : size of the interpolation box 
!  LIEEE  : if ieee format is used
!  LGLOBE : if global dataset
!  NDATX  : x-size of the dataset (longitude) 
!  NDATY  : y-size of the dataset (longitude) 
!  ELONSW , ELATSW , ELONNE , ELATNE : for local datasets (parts 5, 7 or LAM)
!           latitudes and longitudes of the SW and NE corners (in degrees) 
!  - local, set directly by INCLI0 from namelist -
!  EDLON , EDLAT  : resolution of the dataset (in degrees)
!  NGLOBX, NGLOBY : corresponding numbers of points on the globe
!  - local, set by VAL923 according to LSOLV -
!  SMASK  : thresholds defining the masked areas
!  SMANQ  : value for missing data
!  NTPMER : land-use type for sea (or lake)
!  NTPGLA : land-use type for ice-cap
!  NTPDES : land-use type for low vegetation, including deserts (land default)
!  NTPLAC : land-use type for lakes if a distinction is required
!  NSLICE : number of packet of latitudes which slice the domain

! Fields characteristics
!  - namelist -
!  SVEG   : threshold for significant vegetation cover 
!           (below, vegetation characteristics are not considered)
!  LZ0THER: .FALSE. if no orographic part in the thermic roughness length
!  SFCZ0  : scaling factor for the secondary part of z0 (urban., veget.)
!  RSTR   : thresholds on T-RTT used to control snow cover in Part 6
!           SST-RTT, constant, in Part 10 when no input dataset is available
!  RSWR   : thresholds on T-RTT and Wr used to control snow cover in Part 6
!  - local, set by VAL923 according to LSOLV -
!  STHER  : ration of thermal to kinetic roughness length (over land)
!  SALBN,SALBX,SALBM,SALBG,SALBB,SALBD : albedo
!  SEMIN,SEMIX,SEMIM,SEMIG,SEMIB,SEMID : emissivity
!  (minimum,maximum,sea,ice,sea ice,desert)
!  SDEPN,SDEPX,SDEPD : soil depth
!  SARGN,SARGX,SARGD : clay percentage
!  SSABN,SSABX,SSABD : sand percentage
!  SRSMN,SRSMX,SRSMD : minimum surface resistance
!  (minimum,maximum,desert)
!  SZZ0N,SZZ0M,SZZ0B,SZZ0U,SZZ0D : roughness length
!  (minimum,sea,sea-ice,urban areas,desert)

LOGICAL :: LIEEE
!$acc declare create (LIEEE)
LOGICAL :: LGLOBE
!$acc declare create (LGLOBE)
LOGICAL :: LZ0THER
!$acc declare create (LZ0THER)
INTEGER(KIND=JPIM) :: NPINT
!$acc declare create (NPINT)
INTEGER(KIND=JPIM) :: NDATX
!$acc declare create (NDATX)
INTEGER(KIND=JPIM) :: NDATY
!$acc declare create (NDATY)
INTEGER(KIND=JPIM) :: NGLOBX
!$acc declare create (NGLOBX)
INTEGER(KIND=JPIM) :: NGLOBY
!$acc declare create (NGLOBY)
INTEGER(KIND=JPIM) :: NTPMER
!$acc declare create (NTPMER)
INTEGER(KIND=JPIM) :: NTPGLA
!$acc declare create (NTPGLA)
INTEGER(KIND=JPIM) :: NTPDES
!$acc declare create (NTPDES)
INTEGER(KIND=JPIM) :: NTPLAC
!$acc declare create (NTPLAC)
INTEGER(KIND=JPIM) :: NSLICE
!$acc declare create (NSLICE)
REAL(KIND=JPRB) :: ELONSW
!$acc declare create (ELONSW)
REAL(KIND=JPRB) :: ELATSW
!$acc declare create (ELATSW)
REAL(KIND=JPRB) :: ELONNE
!$acc declare create (ELONNE)
REAL(KIND=JPRB) :: ELATNE
!$acc declare create (ELATNE)
REAL(KIND=JPRB) :: EDLON
!$acc declare create (EDLON)
REAL(KIND=JPRB) :: EDLAT
!$acc declare create (EDLAT)
REAL(KIND=JPRB) :: SMASK
!$acc declare create (SMASK)
REAL(KIND=JPRB) :: SMANQ
!$acc declare create (SMANQ)
REAL(KIND=JPRB) :: SVEG
!$acc declare create (SVEG)
REAL(KIND=JPRB) :: SFCZ0
!$acc declare create (SFCZ0)
REAL(KIND=JPRB) :: RSTR
!$acc declare create (RSTR)
REAL(KIND=JPRB) :: RSWR
!$acc declare create (RSWR)
REAL(KIND=JPRB) :: STHER
!$acc declare create (STHER)
REAL(KIND=JPRB) :: SALBN
!$acc declare create (SALBN)
REAL(KIND=JPRB) :: SALBX
!$acc declare create (SALBX)
REAL(KIND=JPRB) :: SALBM
!$acc declare create (SALBM)
REAL(KIND=JPRB) :: SALBG
!$acc declare create (SALBG)
REAL(KIND=JPRB) :: SALBB
!$acc declare create (SALBB)
REAL(KIND=JPRB) :: SALBD
!$acc declare create (SALBD)
REAL(KIND=JPRB) :: SEMIN
!$acc declare create (SEMIN)
REAL(KIND=JPRB) :: SEMIX
!$acc declare create (SEMIX)
REAL(KIND=JPRB) :: SEMIM
!$acc declare create (SEMIM)
REAL(KIND=JPRB) :: SEMIG
!$acc declare create (SEMIG)
REAL(KIND=JPRB) :: SEMIB
!$acc declare create (SEMIB)
REAL(KIND=JPRB) :: SEMID
!$acc declare create (SEMID)
REAL(KIND=JPRB) :: SDEPN
!$acc declare create (SDEPN)
REAL(KIND=JPRB) :: SDEPX
!$acc declare create (SDEPX)
REAL(KIND=JPRB) :: SDEPD
!$acc declare create (SDEPD)
REAL(KIND=JPRB) :: SARGN
!$acc declare create (SARGN)
REAL(KIND=JPRB) :: SARGX
!$acc declare create (SARGX)
REAL(KIND=JPRB) :: SARGD
!$acc declare create (SARGD)
REAL(KIND=JPRB) :: SSABN
!$acc declare create (SSABN)
REAL(KIND=JPRB) :: SSABX
!$acc declare create (SSABX)
REAL(KIND=JPRB) :: SSABD
!$acc declare create (SSABD)
REAL(KIND=JPRB) :: SRSMN
!$acc declare create (SRSMN)
REAL(KIND=JPRB) :: SRSMX
!$acc declare create (SRSMX)
REAL(KIND=JPRB) :: SRSMD
!$acc declare create (SRSMD)
REAL(KIND=JPRB) :: SZZ0N
!$acc declare create (SZZ0N)
REAL(KIND=JPRB) :: SZZ0M
!$acc declare create (SZZ0M)
REAL(KIND=JPRB) :: SZZ0B
!$acc declare create (SZZ0B)
REAL(KIND=JPRB) :: SZZ0U
!$acc declare create (SZZ0U)
REAL(KIND=JPRB) :: SZZ0D
!$acc declare create (SZZ0D)

END MODULE YOMCLI
