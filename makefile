#FRTFLAGS = -convert big_endian -assume byterecl -traceback -qopenmp -qopenmp-threadprivate compat -fPIC  -align array64byte
#OPT_FRTFLAGS = -fp-model source -g -O2 -ip -xAVX -ftz  -fast-transcendentals

FRTFLAGS = -convert big_endian -assume byterecl -traceback -qopenmp -qopenmp-threadprivate compat -fPIC -r8
#OPT_FRTFLAGS = -fp-model source -g -O2 -ip -xAVX
OPT_FRTFLAGS = -fp-model source -g -O2 -ip -check bounds -debug full

#FC = /home/gmap/mrpm/marguina/install/gmkpack_support/wrapper/I185274/ifort $(FRTFLAGS) $(OPT_FRTFLAGS)
FC = /home/gmap/mrpm/marguina/install/gmkpack_support/wrapper/I185274/ifort $(FRTFLAGS) -g -O0 -DUSE_STACK

#FC = pgf90 -r8 -acc -mp -byteswapio -Mlarge_arrays -fast -Minfo=accel,all,intensity,ccff -ta=tesla:managed -O3
#FC = pgf90 -r8 -mp -byteswapio -Mlarge_arrays -Minfo=mp -mp -O0 -g -DUSE_STACK

all: wrap_achmt.x

%.o: %.F90
	$(FC) -o $@ -c $< 

parkind1.o: parkind1.F90 
	$(FC) -c parkind1.F90

xrd_getoptions.o: xrd_getoptions.F90 xrd_unix_env.o parkind1.o
	$(FC) -c xrd_getoptions.F90

xrd_unix_env.o: xrd_unix_env.F90 parkind1.o
	$(FC) -c xrd_unix_env.F90

yomcst.o: yomcst.F90
	$(FC) -c yomcst.F90

yomcli.o: yomcli.F90
	$(FC) -c yomcli.F90

yomphy.o: yomphy.F90
	$(FC) -c yomphy.F90

yomphy0.o: yomphy0.F90
	$(FC) -c yomphy0.F90

yomphy1.o: yomphy1.F90
	$(FC) -c yomphy1.F90

yomphy2.o: yomphy2.F90
	$(FC) -c yomphy2.F90


load_mod.o: load_mod.F90 parkind1.o
	$(FC) -c load_mod.F90

load_yomphy_mod.o: load_yomphy_mod.F90 yomphy.o load_tphy_mod.o
	$(FC) -c load_yomphy_mod.F90

load_yomphy0_mod.o: load_yomphy0_mod.F90 yomphy0.o load_tphy0_mod.o
	$(FC) -c load_yomphy0_mod.F90

load_yomphy1_mod.o: load_yomphy1_mod.F90 yomphy1.o load_tphy1_mod.o
	$(FC) -c load_yomphy1_mod.F90

load_yomphy2_mod.o: load_yomphy2_mod.F90 yomphy2.o load_tphy2_mod.o
	$(FC) -c load_yomphy2_mod.F90

load_tphy_mod.o: load_tphy_mod.F90 yomphy.o 
	$(FC) -c load_tphy_mod.F90

load_tphy0_mod.o: load_tphy0_mod.F90 yomphy0.o 
	$(FC) -c load_tphy0_mod.F90

load_tphy1_mod.o: load_tphy1_mod.F90 yomphy1.o 
	$(FC) -c load_tphy1_mod.F90

load_tphy2_mod.o: load_tphy2_mod.F90 yomphy2.o 
	$(FC) -c load_tphy2_mod.F90

wrap_achmt.o: wrap_achmt.F90 xrd_getoptions.o load_mod.o
	$(FC) -c wrap_achmt.F90

achmt_load_all.o: achmt_load_all.F90 yomcst.o yomcli.o load_yomphy_mod.o load_yomphy0_mod.o load_yomphy1_mod.o load_yomphy2_mod.o 
	$(FC) -c achmt_load_all.F90

achmt.o: achmt.F90 parkind1.o yomcst.o yomphy.o yomphy0.o yomphy1.o yomphy2.o yomcli.o
	$(FC) -c achmt.F90

acntcls.o: acntcls.F90 yomphy0.o yomphy.o 
	$(FC) -o $@ -c $< 

wrap_achmt.x: wrap_achmt.o achmt_load_all.o achmt.o acntcls.o 
	$(FC) -o wrap_achmt.x wrap_achmt.o xrd_getoptions.o xrd_unix_env.o load_mod.o achmt_load_all.o parkind1.o yomcst.o yomphy.o yomphy1.o yomphy2.o yomcli.o acntcls.o yomphy0.o achmt.o load_yomphy_mod.o load_yomphy0_mod.o load_yomphy1_mod.o load_yomphy2_mod.o load_tphy_mod.o load_tphy0_mod.o load_tphy1_mod.o load_tphy2_mod.o

clean:
	\rm -f *.o *.x *.mod *.xml *.optrpt

