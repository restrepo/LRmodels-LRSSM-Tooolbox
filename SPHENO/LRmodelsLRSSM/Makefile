modname = LRmodelsLRSSM  # as an example  
PreDef = -DGENERATIONMIXING -DONLYDOUBLE
# setting various paths  
InDir = ../include
Mdir = ${InDir}
VPATH = 3-Body-Decays:LoopDecays:TwoLoopMasses:Observables
name = ../lib/libSPhenoLRmodelsLRSSM.a
 
# check if SARAH module and SPheno are compatibel  
minV=330.00 
cVersion =$(shell expr $(version) \>= $(minV))
#  
# options for various compilers  
#  
# Default Compiler  
F90=gfortran
comp= -c -O -module ${Mdir} -I${InDir}  
LFlagsB= -O  
# Intels ifort,debug modus  
ifeq (${F90},ifortg)  
F90=ifort  
comp= -c -g -module ${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# gfortran  
ifeq (${F90},gfortran)  
comp= -c -g -ffree-line-length-none -J${Mdir} -I${InDir}  
LFlagsB= -g  
endif  
# g95  
ifeq (${F90},g95)  
comp= -c -O -fmod=${Mdir} -I${InDir}  
LFlagsB= -O  
endif  
# Lahey F95 compiler  
ifeq (${F90},lf95)  
comp=-c -O -M ${Mdir} -I${InDir}  
LFlagsB=-O  
endif  
# NAG f95/2003  
ifeq (${F90},nagfor)  
comp= -c -O -mdir ${Mdir} -I${InDir}  
LFlagsB= -O -DONLYDOUBLE -mdir ${MDir} -I${InDir}  
endif   
.SUFFIXES : .o .ps .f90 .F90 .a 
bin/SPhenoLRmodelsLRSSM:
ifeq (${cVersion},1)
	 cd ../src ; ${MAKE} F90=${F90} 
	 ${MAKE} F90=${F90} ${name} 
	 ${MAKE} F90=${F90} SPhenoLRmodelsLRSSM.o 
	 ${F90} -o SPhenoLRmodelsLRSSM ${LFlagsB} SPhenoLRmodelsLRSSM.o ../lib/libSPhenoLRmodelsLRSSM.a ../lib/libSPheno.a
	 mv SPhenoLRmodelsLRSSM ../bin
	 rm SPhenoLRmodelsLRSSM.o  
${name}:  ${name}(Model_Data_LRmodelsLRSSM.o)  \
 ${name}(RGEs_LRmodelsLRSSM.o)   \
 ${name}(Couplings_LRmodelsLRSSM.o) ${name}(TreeLevelMasses_LRmodelsLRSSM.o) ${name}(TadpoleEquations_LRmodelsLRSSM.o) \
 ${name}(LoopCouplings_LRmodelsLRSSM.o) ${name}(CouplingsForDecays_LRmodelsLRSSM.o) \
 ${name}(TreeLevel_Decays_LRmodelsLRSSM.o) \
 ${name}(Fu.o)  ${name}(Fe.o)  ${name}(Fd.o)  ${name}(Fv.o)  \
${name}(AddLoopFunctions.o) ${name}(Kinematics.o) \
 ${name}(LoopMasses_LRmodelsLRSSM.o) \
 ${name}(BranchingRatios_LRmodelsLRSSM.o) ${name}(HiggsCS_LRmodelsLRSSM.o) ${name}(RunSM_LRmodelsLRSSM.o) \
 ${name}(LowEnergy_LRmodelsLRSSM.o) \
${name}(FlavorKit_LFV_LRmodelsLRSSM.o) ${name}(FlavorKit_QFV_LRmodelsLRSSM.o) ${name}(FlavorKit_Observables_LRmodelsLRSSM.o)\
${name}(InputOutput_LRmodelsLRSSM.o) 
else 
	 @echo -------------------------------------------------------------------  
	 @echo ERROR:  
	 @echo The installed SPheno is version not compatibel with this module 
	 @echo Please, upgrade at least to SPheno version 3.3.0.  
	 @echo The current SPheno version can be downloaded from 
	 @echo http://www.hepforge.org/downloads/spheno 
	 @echo ------------------------------------------------------------------- 
endif 
clean: 
	 rm -f *.o *~ */*.o */*~
cleanall: 
	 rm -f bin/SPheno3 lib/*.a *~ */*.o */*~ include/*
#
# Suffix rules
#
.f90.a:
	 ${F90} ${comp} $< 
	 ar -ruc $@ $*.o
	 rm -f $*.o
.F90.a:
	 ${F90} ${comp} ${PreDef} $< 
	 ar -ruc $@ $*.o
	 rm -f $*.o
.f90.o:
	 ${F90} ${comp} $<
.f90.ps:
	 a2ps -o $*.ps $<
.h.ps:
	 a2ps -o $*.ps $<
