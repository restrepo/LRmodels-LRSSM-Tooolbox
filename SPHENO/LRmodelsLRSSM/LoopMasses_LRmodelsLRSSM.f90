! -----------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.9.1 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223  
! (c) Florian Staub, 2013  
! ------------------------------------------------------------------------------  
! File created at 15:12 on 3.10.2016   
! ----------------------------------------------------------------------  
 
 
Module LoopMasses_LRmodelsLRSSM 
 
Use Control 
Use Couplings_LRmodelsLRSSM 
Use LoopFunctions 
Use AddLoopFunctions 
Use Mathematics 
Use MathematicsQP 
Use Model_Data_LRmodelsLRSSM 
Use StandardModel 
Use Tadpoles_LRmodelsLRSSM 
 Use TreeLevelMasses_LRmodelsLRSSM 
 
Real(dp), Private :: Mhh_1L(3), Mhh2_1L(3)  
Complex(dp), Private :: ZH_1L(3,3)  
Real(dp), Private :: MAh_1L(3), MAh2_1L(3)  
Complex(dp), Private :: UP_1L(3,3)  
Real(dp), Private :: MHpm_1L(3), MHpm2_1L(3)  
Complex(dp), Private :: UC_1L(3,3)  
Real(dp), Private :: MFv_1L(6), MFv2_1L(6)  
Complex(dp), Private :: UV_1L(6,6)  
Real(dp), Private :: MdeltaRpp_1L, MdeltaRpp2_1L  
Real(dp), Private :: MVZ_1L, MVZ2_1L  
Real(dp), Private :: MVZR_1L, MVZR2_1L  
Real(dp), Private :: MVWLm_1L, MVWLm2_1L  
Real(dp), Private :: MVWRm_1L, MVWRm2_1L  
Contains 
 
Subroutine OneLoopMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,MFe,MFe2,             & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,              & 
& MVZR,MVZR2,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,             & 
& g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,             & 
& mu32,MU22,MU12,kont)

Implicit None 
Real(dp),Intent(inout) :: gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,mu32,MU22,MU12

Complex(dp),Intent(inout) :: YDR(3,3),YL1(3,3),YQ1(3,3),YL2(3,3),YQ2(3,3)

Real(dp),Intent(inout) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),             & 
& MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,             & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC(3,3),UP(3,3),ZH(3,3)

Complex(dp),Intent(inout) :: UV(6,6),ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZW(4,4),ZZ(3,3)

Real(dp),Intent(inout) :: vd,vu,vR

Complex(dp) :: cplAhAhcVWLmVWLm(3,3),cplAhAhcVWRmVWRm(3,3),cplAhAhdeltaRppcdeltaRpp(3,3),            & 
& cplAhAhUhh(3,3,3),cplAhAhUhhUhh(3,3,3,3),cplAhAhUHpmcUHpm(3,3,3,3),cplAhAhVZRVZR(3,3), & 
& cplAhAhVZVZ(3,3),cplAhcUHpmVWLm(3,3),cplAhcUHpmVWRm(3,3),cplAhcVWLmVWRm(3),            & 
& cplAhcVWRmVWLm(3),cplAhhhVZ(3,3),cplAhhhVZR(3,3),cplAhHpmcUHpm(3,3,3),cplAhHpmcVWLm(3,3),& 
& cplAhHpmcVWRm(3,3),cplAhUhhVP(3,3),cplAhUhhVZ(3,3),cplAhUhhVZR(3,3),cplcdeltaRppcHpmcHpm(3,3),& 
& cplcdeltaRppcHpmcVWLm(3),cplcdeltaRppcHpmcVWRm(3),cplcdeltaRppcUHpmcHpm(3,3),          & 
& cplcdeltaRppcUHpmcVWLm(3),cplcdeltaRppcUHpmcVWRm(3),cplcdeltaRppcVWLmcVWLm,            & 
& cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplcFdFdUAhL(3,3,3),cplcFdFdUAhR(3,3,3), & 
& cplcFdFdUhhL(3,3,3),cplcFdFdUhhR(3,3,3),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),             & 
& cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeUAhL(3,3,3),cplcFeFeUAhR(3,3,3),           & 
& cplcFeFeUhhL(3,3,3),cplcFeFeUhhR(3,3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),             & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvcUHpmL(3,6,3),cplcFeFvcUHpmR(3,6,3),       & 
& cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6),       & 
& cplcFuFdcUHpmL(3,3,3),cplcFuFdcUHpmR(3,3,3),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),   & 
& cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFuFuUAhL(3,3,3),cplcFuFuUAhR(3,3,3),       & 
& cplcFuFuUhhL(3,3,3),cplcFuFuUhhR(3,3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),             & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplcgPgWLmcVWLm,cplcgPgWLmcVWRm,cplcgPgWRmcVWLm,   & 
& cplcgPgWRmcVWRm,cplcgWLmgWLmUAh(3),cplcgWLmgWLmUhh(3),cplcgWLmgWLmVZ,cplcgWLmgWLmVZR,  & 
& cplcgWLmgWLpcdeltaRpp,cplcgWLmgWRmUAh(3),cplcgWLmgWRmUhh(3),cplcgWLmgWRpcdeltaRpp,     & 
& cplcgWLmgZpUHpm(3),cplcgWLmgZUHpm(3),cplcgWLpgPcVWLm,cplcgWLpgPcVWRm,cplcgWLpgWLmdeltaRpp,& 
& cplcgWLpgWLpUAh(3),cplcgWLpgWLpUhh(3),cplcgWLpgWLpVZ,cplcgWLpgWLpVZR,cplcgWLpgWRmdeltaRpp,& 
& cplcgWLpgWRpUAh(3),cplcgWLpgWRpUhh(3),cplcgWLpgZcUHpm(3),cplcgWLpgZcVWLm,              & 
& cplcgWLpgZcVWRm,cplcgWLpgZpcUHpm(3),cplcgWLpgZpcVWLm,cplcgWLpgZpcVWRm,cplcgWRmgWLmUAh(3),& 
& cplcgWRmgWLmUhh(3),cplcgWRmgWLmVZ,cplcgWRmgWLmVZR,cplcgWRmgWLpcdeltaRpp,               & 
& cplcgWRmgWRmUAh(3),cplcgWRmgWRmUhh(3),cplcgWRmgWRmVZ,cplcgWRmgWRmVZR,cplcgWRmgWRpcdeltaRpp,& 
& cplcgWRmgZpUHpm(3),cplcgWRmgZUHpm(3),cplcgWRpgPcVWLm,cplcgWRpgPcVWRm,cplcgWRpgWLmdeltaRpp,& 
& cplcgWRpgWLpUAh(3),cplcgWRpgWLpUhh(3),cplcgWRpgWLpVZ,cplcgWRpgWLpVZR,cplcgWRpgWRmdeltaRpp,& 
& cplcgWRpgWRpUAh(3),cplcgWRpgWRpUhh(3),cplcgWRpgWRpVZ,cplcgWRpgWRpVZR,cplcgWRpgZcUHpm(3),& 
& cplcgWRpgZcVWLm,cplcgWRpgZcVWRm,cplcgWRpgZpcUHpm(3),cplcgWRpgZpcVWLm,cplcgWRpgZpcVWRm, & 
& cplcgZgWLmcUHpm(3),cplcgZgWLmcVWLm,cplcgZgWLmcVWRm,cplcgZgWLpUHpm(3),cplcgZgWRmcUHpm(3),& 
& cplcgZgWRmcVWLm,cplcgZgWRmcVWRm,cplcgZgWRpUHpm(3),cplcgZgZpUhh(3),cplcgZgZUhh(3),      & 
& cplcgZpgWLmcUHpm(3),cplcgZpgWLmcVWLm,cplcgZpgWLmcVWRm,cplcgZpgWLpUHpm(3),              & 
& cplcgZpgWRmcUHpm(3),cplcgZpgWRmcVWLm,cplcgZpgWRmcVWRm,cplcgZpgWRpUHpm(3),              & 
& cplcgZpgZpUhh(3),cplcgZpgZUhh(3),cplcUFdFdAhL(3,3,3),cplcUFdFdAhR(3,3,3),              & 
& cplcUFdFdhhL(3,3,3),cplcUFdFdhhR(3,3,3),cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),           & 
& cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),               & 
& cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),cplcUFdFuHpmL(3,3,3),cplcUFdFuHpmR(3,3,3)

Complex(dp) :: cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3),       & 
& cplcUFecFedeltaRppL(3,3),cplcUFecFedeltaRppR(3,3),cplcUFeFeAhL(3,3,3),cplcUFeFeAhR(3,3,3),& 
& cplcUFeFehhL(3,3,3),cplcUFeFehhR(3,3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),             & 
& cplcUFeFvcHpmL(3,6,3),cplcUFeFvcHpmR(3,6,3),cplcUFeFvcVWLmL(3,6),cplcUFeFvcVWLmR(3,6), & 
& cplcUFeFvcVWRmL(3,6),cplcUFeFvcVWRmR(3,6),cplcUFuFdcHpmL(3,3,3),cplcUFuFdcHpmR(3,3,3), & 
& cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),   & 
& cplcUFuFuAhL(3,3,3),cplcUFuFuAhR(3,3,3),cplcUFuFuhhL(3,3,3),cplcUFuFuhhR(3,3,3),       & 
& cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),               & 
& cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3),             & 
& cplcUHpmVPVWLm(3),cplcUHpmVPVWRm(3),cplcUHpmVWLmVZ(3),cplcUHpmVWLmVZR(3),              & 
& cplcUHpmVWRmVZ(3),cplcUHpmVWRmVZR(3),cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,    & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,cplcVWLmVPVWLm,cplcVWLmVPVWRm,   & 
& cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,  & 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmVPVPVWRm1,& 
& cplcVWRmVPVPVWRm2,cplcVWRmVPVPVWRm3,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,      & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,& 
& cplcVWRmVWRmVZRVZR3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,             & 
& cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,cpldeltaRppcdeltaRppVP,    & 
& cpldeltaRppcdeltaRppVPVP,cpldeltaRppcdeltaRppVZ,cpldeltaRppcdeltaRppVZR,               & 
& cpldeltaRppcdeltaRppVZRVZR,cpldeltaRppcdeltaRppVZVZ,cpldeltaRppdeltaRppcdeltaRppcdeltaRpp,& 
& cpldeltaRpphhcdeltaRpp(3),cpldeltaRpphhhhcdeltaRpp(3,3),cpldeltaRppHpmcdeltaRppcHpm(3,3),& 
& cpldeltaRppUhhcdeltaRpp(3),cpldeltaRppUhhUhhcdeltaRpp(3,3),cpldeltaRppUHpmcdeltaRppcUHpm(3,3),& 
& cplFeFecdeltaRppL(3,3),cplFeFecdeltaRppR(3,3),cplFvFvUAhL(6,6,3),cplFvFvUAhR(6,6,3),   & 
& cplFvFvUhhL(6,6,3),cplFvFvUhhR(6,6,3),cplFvFvVZL(6,6),cplFvFvVZR(6,6),cplFvFvVZRL(6,6),& 
& cplFvFvVZRR(6,6),cplhhcUHpmVWLm(3,3),cplhhcUHpmVWRm(3,3),cplhhcVWLmVWLm(3),            & 
& cplhhcVWLmVWRm(3),cplhhcVWRmVWLm(3),cplhhcVWRmVWRm(3),cplhhhhcVWLmVWLm(3,3),           & 
& cplhhhhcVWRmVWRm(3,3),cplhhhhUHpmcUHpm(3,3,3,3),cplhhhhVZRVZR(3,3),cplhhhhVZVZ(3,3),   & 
& cplhhHpmcUHpm(3,3,3),cplhhHpmcVWLm(3,3),cplhhHpmcVWRm(3,3),cplhhVPVZ(3),               & 
& cplhhVPVZR(3),cplhhVZRVZR(3),cplhhVZVZ(3),cplhhVZVZR(3),cplHpmcHpmcVWLmVWLm(3,3),      & 
& cplHpmcHpmcVWRmVWRm(3,3),cplHpmcHpmVZ(3,3),cplHpmcHpmVZR(3,3),cplHpmcHpmVZRVZR(3,3),   & 
& cplHpmcHpmVZVZ(3,3),cplHpmcUHpmVP(3,3),cplHpmcUHpmVZ(3,3),cplHpmcUHpmVZR(3,3),         & 
& cplHpmcVWLmVP(3),cplHpmcVWLmVZ(3),cplHpmcVWLmVZR(3),cplHpmcVWRmVP(3),cplHpmcVWRmVZ(3), & 
& cplHpmcVWRmVZR(3),cplUAhAhhh(3,3,3),cplUAhcVWRmVWLm(3),cplUAhhhVP(3,3),cplUAhhhVZ(3,3),& 
& cplUAhhhVZR(3,3),cplUAhHpmcHpm(3,3,3),cplUAhHpmcVWLm(3,3),cplUAhHpmcVWRm(3,3)

Complex(dp) :: cplUAhUAhAhAh(3,3,3,3),cplUAhUAhcVWLmVWLm(3,3),cplUAhUAhcVWRmVWRm(3,3),cplUAhUAhdeltaRppcdeltaRpp(3,3),& 
& cplUAhUAhhhhh(3,3,3,3),cplUAhUAhHpmcHpm(3,3,3,3),cplUAhUAhVPVP(3,3),cplUAhUAhVZRVZR(3,3),& 
& cplUAhUAhVZVZ(3,3),cplUFvFeHpmL(6,3,3),cplUFvFeHpmR(6,3,3),cplUFvFeVWLmL(6,3),         & 
& cplUFvFeVWLmR(6,3),cplUFvFeVWRmL(6,3),cplUFvFeVWRmR(6,3),cplUFvFvAhL(6,6,3),           & 
& cplUFvFvAhR(6,6,3),cplUFvFvhhL(6,6,3),cplUFvFvhhR(6,6,3),cplUFvFvVPL(6,6),             & 
& cplUFvFvVPR(6,6),cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZRL(6,6),cplUFvFvVZRR(6,6),& 
& cplUhhcVWLmVWLm(3),cplUhhcVWRmVWLm(3),cplUhhcVWRmVWRm(3),cplUhhhhhh(3,3,3),            & 
& cplUhhHpmcHpm(3,3,3),cplUhhHpmcVWLm(3,3),cplUhhHpmcVWRm(3,3),cplUhhUhhcVWLmVWLm(3,3),  & 
& cplUhhUhhcVWRmVWRm(3,3),cplUhhUhhhhhh(3,3,3,3),cplUhhUhhHpmcHpm(3,3,3,3),              & 
& cplUhhUhhVPVP(3,3),cplUhhUhhVZRVZR(3,3),cplUhhUhhVZVZ(3,3),cplUhhVPVZ(3),              & 
& cplUhhVPVZR(3),cplUhhVZRVZR(3),cplUhhVZVZ(3),cplUhhVZVZR(3),cplUHpmcUHpmcVWLmVWLm(3,3),& 
& cplUHpmcUHpmcVWRmVWRm(3,3),cplUHpmcUHpmVPVP(3,3),cplUHpmcUHpmVZRVZR(3,3),              & 
& cplUHpmcUHpmVZVZ(3,3),cplUHpmHpmcUHpmcHpm(3,3,3,3)

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1, j2, j3, j4, il, i_count, ierr 
Complex(dp) :: Tad1Loop(3), dmz2  
Real(dp) :: comp(3), tanbQ, vev2, vSM
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMasses' 
 
kont = 0 
 
! Set Gauge fixing parameters 
RXi= RXiNew 
RXiG = RXi 
RXiP = RXi 
RXiWLm = RXi 
RXiWRm = RXi 
RXiZ = RXi 
RXiZR = RXi 

 ! Running angles 

 
Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,               & 
& RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,mu32,MU22,            & 
& MU12,GenerationMixing,kont)

MU12Tree  = MU12
MU22Tree  = MU22
mu32Tree  = mu32

 
 If (CalculateOneLoopMasses) Then 
 
Call CouplingsForVectorBosons(gBL,gR,ZZ,UC,PhiW,vR,g2,ZH,UP,UV,vd,vu,ZDL,             & 
& ZDR,ZUL,ZUR,ZEL,ZER,cpldeltaRppcdeltaRppVZ,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcVWLmcVWLm,& 
& cplcdeltaRppcVWLmcVWRm,cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppVZVZ,         & 
& cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,     & 
& cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,     & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,             & 
& cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,              & 
& cplAhAhVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,            & 
& cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,               & 
& cplHpmcVWLmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,& 
& cplcVWLmVWLmVZRVZR3,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,        & 
& cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,         & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,       & 
& cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplHpmcVWLmVP,cplcVWLmVPVWLm,cplcVWLmVPVWRm,             & 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,  & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,cplcVWLmcVWLmVWLmVWLm1,          & 
& cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,& 
& cplcVWLmcVWRmVWLmVWRm3,cplAhcVWRmVWLm,cplhhcVWRmVWLm,cplcVWRmVPVWLm)

Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,mu32,MU22,MU12,vd,vu,vR,(/ ZeroC, ZeroC, ZeroC /))

Call TreeMasses(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,             & 
& MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,            & 
& PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,vd,vu,vR,gBL,g2,gR,g3,               & 
& RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,mu32,MU22,            & 
& MU12,GenerationMixing,kont)

Call CouplingsForLoopMasses(RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,vd,               & 
& vu,vR,UP,gBL,g2,gR,ZZ,RHO2,YQ1,YQ2,ZDL,ZDR,YL1,YL2,ZEL,ZER,ZUL,ZUR,YDR,UV,             & 
& PhiW,ZH,UC,g3,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cpldeltaRppUhhcdeltaRpp,    & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,               & 
& cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,       & 
& cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,          & 
& cplUhhHpmcVWLm,cplUhhHpmcVWRm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,  & 
& cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cpldeltaRppUhhUhhcdeltaRpp,& 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,    & 
& cplUhhUhhVZVZ,cplUhhUhhVZRVZR,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,       & 
& cplcFeFeUAhR,cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,        & 
& cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,       & 
& cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,       & 
& cplUAhHpmcVWLm,cplUAhHpmcVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhdeltaRppcdeltaRpp,& 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,    & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,             & 
& cplcFuFdcUHpmL,cplcFuFdcUHpmR,cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLmcUHpm,           & 
& cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,        & 
& cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,       & 
& cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,      & 
& cplhhHpmcUHpm,cplhhcUHpmVWLm,cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,               & 
& cplHpmcUHpmVZR,cplcUHpmVPVWLm,cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,           & 
& cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,cplcdeltaRppcUHpmcHpm,cplcdeltaRppcUHpmcVWLm,           & 
& cplcdeltaRppcUHpmcVWRm,cplAhAhUHpmcUHpm,cpldeltaRppUHpmcdeltaRppcUHpm,cplhhhhUHpmcUHpm,& 
& cplUHpmHpmcUHpmcHpm,cplUHpmcUHpmVPVP,cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,      & 
& cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,            & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL, & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,cplcUFeFeAhL,cplcUFeFeAhR,       & 
& cplcUFecFedeltaRppL,cplcUFecFedeltaRppR,cplcUFeFehhL,cplcUFeFehhR,cplcUFeFeVPL,        & 
& cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,cplcUFeFeVZRR,cplcUFeFvcHpmL,     & 
& cplcUFeFvcHpmR,cplcUFeFvcVWLmL,cplcUFeFvcVWLmR,cplcUFeFvcVWRmL,cplcUFeFvcVWRmR,        & 
& cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFeVWLmL,cplUFvFeVWLmR,         & 
& cplUFvFeVWRmL,cplUFvFeVWRmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,           & 
& cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,cplUFvFvVZRR,cpldeltaRpphhcdeltaRpp,              & 
& cpldeltaRppcdeltaRppVP,cpldeltaRppcdeltaRppVZ,cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL,& 
& cplFeFecdeltaRppR,cplcgWLmgWLpcdeltaRpp,cplcgWLpgWLmdeltaRpp,cplcgWRmgWLpcdeltaRpp,    & 
& cplcgWLpgWRmdeltaRpp,cplcgWLmgWRpcdeltaRpp,cplcgWRpgWLmdeltaRpp,cplcgWRmgWRpcdeltaRpp, & 
& cplcgWRpgWRmdeltaRpp,cplcdeltaRppcHpmcHpm,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcHpmcVWRm, & 
& cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhdeltaRppcdeltaRpp,& 
& cpldeltaRppdeltaRppcdeltaRppcdeltaRpp,cpldeltaRpphhhhcdeltaRpp,cpldeltaRppHpmcdeltaRppcHpm,& 
& cpldeltaRppcdeltaRppVPVP,cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppVZVZ,cpldeltaRppcdeltaRppVZRVZR,cplAhhhVZ,cplcFdFdVZL,             & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,              & 
& cplHpmcVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cplhhhhVZVZ,    & 
& cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,              & 
& cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,           & 
& cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,       & 
& cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,    & 
& cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cplhhhhVZRVZR,           & 
& cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,cplAhHpmcVWLm,             & 
& cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFeFvcVWLmL,cplcFeFvcVWLmR,            & 
& cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,      & 
& cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,      & 
& cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,         & 
& cplHpmcVWLmVP,cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,            & 
& cplAhAhcVWLmVWLm,cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm1,               & 
& cplcVWLmVPVPVWLm2,cplcVWLmVPVPVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWLmVWLmVWLm2,     & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFeFvcVWRmL,             & 
& cplcFeFvcVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,        & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHpmcVWRmVP,cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplAhAhcVWRmVWRm,           & 
& cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,              & 
& cplcVWRmVPVPVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3)

Call OneLoopTadpoleshh(vd,vu,vR,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,              & 
& MVZ,MVZ2,MVZR,MVZR2,cplAhAhUhh,cpldeltaRppUhhcdeltaRpp,cplcFdFdUhhL,cplcFdFdUhhR,      & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWLmgWLmUhh,cplcgWLpgWLpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,           & 
& cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhcVWLmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,     & 
& cplUhhVZRVZR,Tad1Loop(1:3))

MU12Tree  = MU12
MU22Tree  = MU22
mu32Tree  = mu32
Call SolveTadpoleEquations(gBL,g2,gR,g3,RHO2,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,           & 
& LAM2,LAM3,YDR,YL1,YQ1,YL2,YQ2,mu32,MU22,MU12,vd,vu,vR,Tad1Loop)

MU121L = MU12
MU221L = MU22
mu321L = mu32
Call OneLoophh(mu321L,MU221L,MU121L,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,               & 
& LAM3,vd,vu,vR,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,              & 
& cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cpldeltaRppUhhcdeltaRpp,cplcFdFdUhhL,     & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,           & 
& cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,           & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,       & 
& cplUhhHpmcVWRm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm, & 
& cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cpldeltaRppUhhUhhcdeltaRpp,          & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,    & 
& cplUhhUhhVZVZ,cplUhhUhhVZRVZR,0.1_dp*delta_mass,Mhh_1L,Mhh2_1L,ZH_1L,kont)

Call OneLoopAh(gBL,g2,gR,mu321L,MU221L,MU121L,RHO1,ALP1,LAM1,ALP3,ALP2,               & 
& LAM4,LAM2,LAM3,vd,vu,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,               & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MdeltaRpp,           & 
& MdeltaRpp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,             & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,     & 
& cplcgWLmgWRmUAh,cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,       & 
& cplcgWRpgWRpUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,        & 
& cplUAhHpmcVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhdeltaRppcdeltaRpp,               & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,    & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,0.1_dp*delta_mass,MAh_1L,MAh2_1L,UP_1L,kont)

Call OneLoopHpm(g2,gR,mu321L,MU221L,MU121L,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,             & 
& LAM2,LAM3,vd,vu,vR,PhiW,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MFu,             & 
& MFu2,MFd,MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,     & 
& cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,             & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,         & 
& cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,       & 
& cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,        & 
& cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,         & 
& cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplcUHpmVPVWLm,              & 
& cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,          & 
& cplcdeltaRppcUHpmcHpm,cplcdeltaRppcUHpmcVWLm,cplcdeltaRppcUHpmcVWRm,cplAhAhUHpmcUHpm,  & 
& cpldeltaRppUHpmcdeltaRppcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmcUHpmVPVP,   & 
& cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,       & 
& 0.1_dp*delta_mass,MHpm_1L,MHpm2_1L,UC_1L,kont)

Call OneLoopFv(YDR,YL1,YL2,vd,vu,vR,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,MFe,MFe2,            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,        & 
& cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFeVWLmL,cplUFvFeVWLmR,cplUFvFeVWRmL,cplUFvFeVWRmR,     & 
& cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,               & 
& cplUFvFvVZRL,cplUFvFvVZRR,0.1_dp*delta_mass,MFv_1L,MFv2_1L,UV_1L,kont)

Call OneLoopdeltaRpp(mu32,RHO2,RHO1,ALP1,ALP3,ALP2,vd,vu,vR,Mhh,Mhh2,MdeltaRpp,       & 
& MdeltaRpp2,MVZ,MVZ2,MVZR,MVZR2,MFe,MFe2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,          & 
& MAh,MAh2,cpldeltaRpphhcdeltaRpp,cpldeltaRppcdeltaRppVP,cpldeltaRppcdeltaRppVZ,         & 
& cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL,cplFeFecdeltaRppR,cplcgWLmgWLpcdeltaRpp,     & 
& cplcgWLpgWLmdeltaRpp,cplcgWRmgWLpcdeltaRpp,cplcgWLpgWRmdeltaRpp,cplcgWLmgWRpcdeltaRpp, & 
& cplcgWRpgWLmdeltaRpp,cplcgWRmgWRpcdeltaRpp,cplcgWRpgWRmdeltaRpp,cplcdeltaRppcHpmcHpm,  & 
& cplcdeltaRppcHpmcVWLm,cplcdeltaRppcHpmcVWRm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,& 
& cplcdeltaRppcVWRmcVWRm,cplAhAhdeltaRppcdeltaRpp,cpldeltaRppdeltaRppcdeltaRppcdeltaRpp, & 
& cpldeltaRpphhhhcdeltaRpp,cpldeltaRppHpmcdeltaRppcHpm,cpldeltaRppcdeltaRppVPVP,         & 
& cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,cpldeltaRppcdeltaRppVZVZ,  & 
& cpldeltaRppcdeltaRppVZRVZR,0.1_dp*delta_mass,MdeltaRpp_1L,MdeltaRpp2_1L,kont)

Mhh = Mhh_1L 
Mhh2 = Mhh2_1L 
ZH = ZH_1L 
MAh = MAh_1L 
MAh2 = MAh2_1L 
UP = UP_1L 
MHpm = MHpm_1L 
MHpm2 = MHpm2_1L 
UC = UC_1L 
MFv = MFv_1L 
MFv2 = MFv2_1L 
UV = UV_1L 
MdeltaRpp = MdeltaRpp_1L 
MdeltaRpp2 = MdeltaRpp2_1L 
End If 
 
Call SortGoldstones(MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,MFe,MFe2,MFu,              & 
& MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,             & 
& MVZR2,PhiW,UV,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZW,ZZ,kont)

! Set pole masses 
MVWLm = mW 
MVWLm2 = mW2 
MVZ = mZ 
MVZ2 = mZ2 
MFe(1:3) = mf_l 
MFe2(1:3) = mf_l**2 
MFu(1:3) = mf_u 
MFu2(1:3) = mf_u**2 
MFd(1:3) = mf_d 
MFd2(1:3) = mf_d**2 
! Shift Everything to t'Hooft Gauge
RXi=  1._dp 
RXiG = 1._dp 
RXiP = 1._dp 
RXiWLm = 1._dp 
RXiWRm = 1._dp 
RXiZ = 1._dp 
RXiZR = 1._dp 
MAh(1)=MVZ
MAh2(1)=MVZ2
MAh(2)=MVZR
MAh2(2)=MVZR2
MHpm(1)=MVWLm
MHpm2(1)=MVWLm2
MHpm(2)=MVWRm
MHpm2(2)=MVWRm2
mf_u2 = mf_u**2 
mf_d2 = mf_d**2 
mf_l2 = mf_l**2 
 

 If (WriteTreeLevelTadpoleSolutions) Then 
! Saving tree-level parameters for output
MU12  = MU12Tree 
MU22  = MU22Tree 
mu32  = mu32Tree 
End if 


Iname = Iname -1 
End Subroutine OneLoopMasses 
 
Subroutine OneLoopTadpoleshh(vd,vu,vR,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,              & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MVZ,MVZ2,MVZR,MVZR2,cplAhAhUhh,cpldeltaRppUhhcdeltaRpp,cplcFdFdUhhL,cplcFdFdUhhR,      & 
& cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,cplFvFvUhhR,           & 
& cplcgWLmgWLmUhh,cplcgWLpgWLpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,           & 
& cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhcVWLmVWLm,cplUhhcVWRmVWRm,cplUhhVZVZ,     & 
& cplUhhVZRVZR,tadpoles)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),             & 
& MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,             & 
& MVWRm2,MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplAhAhUhh(3,3,3),cpldeltaRppUhhcdeltaRpp(3),cplcFdFdUhhL(3,3,3),cplcFdFdUhhR(3,3,3), & 
& cplcFeFeUhhL(3,3,3),cplcFeFeUhhR(3,3,3),cplcFuFuUhhL(3,3,3),cplcFuFuUhhR(3,3,3),       & 
& cplFvFvUhhL(6,6,3),cplFvFvUhhR(6,6,3),cplcgWLmgWLmUhh(3),cplcgWLpgWLpUhh(3),           & 
& cplcgWRmgWRmUhh(3),cplcgWRpgWRpUhh(3),cplcgZgZUhh(3),cplcgZpgZpUhh(3),cplUhhhhhh(3,3,3),& 
& cplUhhHpmcHpm(3,3,3),cplUhhcVWLmVWLm(3),cplUhhcVWRmVWRm(3),cplUhhVZVZ(3),              & 
& cplUhhVZRVZR(3)

Real(dp), Intent(in) :: vd,vu,vR

Integer :: i1,i2, gO1, gO2 
Complex(dp) :: coupL, coupR, coup, temp, res, A0m, sumI(3)  
Real(dp) :: m1 
Complex(dp), Intent(out) :: tadpoles(3) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopTadpoleshh'
 
tadpoles = 0._dp 
 
!------------------------ 
! Ah 
!------------------------ 
Do i1 = 1, 3
 A0m = A0(MAh2(i1)) 
  Do gO1 = 1, 3
   coup = cplAhAhUhh(i1,i1,gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[deltaRpp] 
!------------------------ 
A0m = A0(MdeltaRpp2) 
  Do gO1 = 1, 3
   coup = cpldeltaRppUhhcdeltaRpp(gO1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[Fd] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFd(i1)*A0(MFd2(i1)) 
  Do gO1 = 1, 3
   coupL = cplcFdFdUhhL(i1,i1,gO1)
   coupR = cplcFdFdUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! bar[Fe] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFe(i1)*A0(MFe2(i1)) 
  Do gO1 = 1, 3
   coupL = cplcFeFeUhhL(i1,i1,gO1)
   coupR = cplcFeFeUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! bar[Fu] 
!------------------------ 
Do i1 = 1, 3
 A0m = 2._dp*MFu(i1)*A0(MFu2(i1)) 
  Do gO1 = 1, 3
   coupL = cplcFuFuUhhL(i1,i1,gO1)
   coupR = cplcFuFuUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 3._dp*sumI 
End Do 
 !------------------------ 
! Fv 
!------------------------ 
Do i1 = 1, 6
 A0m = 2._dp*MFv(i1)*A0(MFv2(i1)) 
  Do gO1 = 1, 3
   coupL = cplFvFvUhhL(i1,i1,gO1)
   coupR = cplFvFvUhhR(i1,i1,gO1)
   sumI(gO1) = (coupL+coupR)*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! bar[gWLm] 
!------------------------ 
A0m = 1._dp*A0(MVWLm2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgWLmgWLmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWLmC] 
!------------------------ 
A0m = 1._dp*A0(MVWLm2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgWLpgWLpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWRm] 
!------------------------ 
A0m = 1._dp*A0(MVWRm2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgWRmgWRmUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gWRmC] 
!------------------------ 
A0m = 1._dp*A0(MVWRm2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgWRpgWRpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZ] 
!------------------------ 
A0m = 1._dp*A0(MVZ2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgZgZUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! bar[gZR] 
!------------------------ 
A0m = 1._dp*A0(MVZR2*RXi) 
  Do gO1 = 1, 3
    coup = cplcgZpgZpUhh(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! hh 
!------------------------ 
Do i1 = 1, 3
 A0m = A0(Mhh2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhhhhh(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
Do i1 = 1, 3
 A0m = A0(MHpm2(i1)) 
  Do gO1 = 1, 3
   coup = cplUhhHpmcHpm(gO1,i1,i1)
   sumI(gO1) = -coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
A0m = 3._dp*A0(MVWLm2)+RXi*A0(MVWLm2*RXi) - 2._dp*MVWLm2*rMS 
  Do gO1 = 1, 3
    coup = cplUhhcVWLmVWLm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! conj[VWRm] 
!------------------------ 
A0m = 3._dp*A0(MVWRm2)+RXi*A0(MVWRm2*RXi) - 2._dp*MVWRm2*rMS 
  Do gO1 = 1, 3
    coup = cplUhhcVWRmVWRm(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp*sumI 
!------------------------ 
! VZ 
!------------------------ 
A0m = 3._dp*A0(MVZ2)+RXi*A0(MVZ2*RXi) - 2._dp*MVZ2*rMS 
  Do gO1 = 1, 3
    coup = cplUhhVZVZ(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 
!------------------------ 
! VZR 
!------------------------ 
A0m = 3._dp*A0(MVZR2)+RXi*A0(MVZR2*RXi) - 2._dp*MVZR2*rMS 
  Do gO1 = 1, 3
    coup = cplUhhVZRVZR(gO1)
    sumI(gO1) = coup*A0m 
  End Do 
 
tadpoles =  tadpoles + 1._dp/2._dp*sumI 



tadpoles = oo16pi2*tadpoles 
Iname = Iname - 1 
End Subroutine OneLoopTadpoleshh 
 
Subroutine OneLoophh(mu32,MU22,MU12,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,               & 
& LAM3,vd,vu,vR,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,              & 
& cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cpldeltaRppUhhcdeltaRpp,cplcFdFdUhhL,     & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,           & 
& cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,           & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,       & 
& cplUhhHpmcVWRm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm, & 
& cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cpldeltaRppUhhUhhcdeltaRpp,          & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,    & 
& cplUhhUhhVZVZ,cplUhhUhhVZRVZR,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,MFd(3),MFd2(3),               & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),MHpm2(3),          & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: mu32,MU22,MU12,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,vd,vu,vR

Complex(dp), Intent(in) :: cplAhAhUhh(3,3,3),cplAhUhhVP(3,3),cplAhUhhVZ(3,3),cplAhUhhVZR(3,3),cpldeltaRppUhhcdeltaRpp(3),& 
& cplcFdFdUhhL(3,3,3),cplcFdFdUhhR(3,3,3),cplcFeFeUhhL(3,3,3),cplcFeFeUhhR(3,3,3),       & 
& cplcFuFuUhhL(3,3,3),cplcFuFuUhhR(3,3,3),cplFvFvUhhL(6,6,3),cplFvFvUhhR(6,6,3),         & 
& cplcgWLmgWLmUhh(3),cplcgWRmgWLmUhh(3),cplcgWLmgWRmUhh(3),cplcgWLpgWLpUhh(3),           & 
& cplcgWRpgWLpUhh(3),cplcgWLpgWRpUhh(3),cplcgWRmgWRmUhh(3),cplcgWRpgWRpUhh(3),           & 
& cplcgZgZUhh(3),cplcgZpgZUhh(3),cplcgZgZpUhh(3),cplcgZpgZpUhh(3),cplUhhhhhh(3,3,3),     & 
& cplUhhHpmcHpm(3,3,3),cplUhhHpmcVWLm(3,3),cplUhhHpmcVWRm(3,3),cplUhhVPVZ(3),            & 
& cplUhhVPVZR(3),cplUhhcVWLmVWLm(3),cplUhhcVWRmVWLm(3),cplUhhcVWRmVWRm(3),               & 
& cplUhhVZVZ(3),cplUhhVZVZR(3),cplUhhVZRVZR(3),cplAhAhUhhUhh(3,3,3,3),cpldeltaRppUhhUhhcdeltaRpp(3,3),& 
& cplUhhUhhhhhh(3,3,3,3),cplUhhUhhHpmcHpm(3,3,3,3),cplUhhUhhVPVP(3,3),cplUhhUhhcVWLmVWLm(3,3),& 
& cplUhhUhhcVWRmVWRm(3,3),cplUhhUhhVZVZ(3,3),cplUhhUhhVZRVZR(3,3)

Complex(dp) :: mat2a(3,3), mat2(3,3),  PiSf(3,3,3)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2, test(3) 
Real(dp), Intent(out) :: mass(3), mass2(3) 
Complex(dp), Intent(out) ::  RS(3,3) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoophh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-1._dp*(MU12)
mat2a(1,1) = mat2a(1,1)+3*LAM1*vd**2
mat2a(1,1) = mat2a(1,1)-6*LAM4*vd*vu
mat2a(1,1) = mat2a(1,1)+LAM1*vu**2
mat2a(1,1) = mat2a(1,1)+4*LAM2*vu**2
mat2a(1,1) = mat2a(1,1)+2*LAM3*vu**2
mat2a(1,1) = mat2a(1,1)+(ALP1*vR**2)/2._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)+2._dp*(MU22)
mat2a(1,2) = mat2a(1,2)-3*LAM4*vd**2
mat2a(1,2) = mat2a(1,2)+2*LAM1*vd*vu
mat2a(1,2) = mat2a(1,2)+8*LAM2*vd*vu
mat2a(1,2) = mat2a(1,2)+4*LAM3*vd*vu
mat2a(1,2) = mat2a(1,2)-3*LAM4*vu**2
mat2a(1,2) = mat2a(1,2)-(ALP2*vR**2)
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+ALP1*vd*vR
mat2a(1,3) = mat2a(1,3)-2*ALP2*vu*vR
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp*(MU12)
mat2a(2,2) = mat2a(2,2)+LAM1*vd**2
mat2a(2,2) = mat2a(2,2)+4*LAM2*vd**2
mat2a(2,2) = mat2a(2,2)+2*LAM3*vd**2
mat2a(2,2) = mat2a(2,2)-6*LAM4*vd*vu
mat2a(2,2) = mat2a(2,2)+3*LAM1*vu**2
mat2a(2,2) = mat2a(2,2)+(ALP1*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vR**2)/2._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)-2*ALP2*vd*vR
mat2a(2,3) = mat2a(2,3)+ALP1*vu*vR
mat2a(2,3) = mat2a(2,3)+ALP3*vu*vR
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-1._dp*(mu32)
mat2a(3,3) = mat2a(3,3)+(ALP1*vd**2)/2._dp
mat2a(3,3) = mat2a(3,3)-2*ALP2*vd*vu
mat2a(3,3) = mat2a(3,3)+(ALP1*vu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(ALP3*vu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+3*RHO1*vR**2

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 = Mhh2(i1)
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,MFd,              & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cpldeltaRppUhhcdeltaRpp,cplcFdFdUhhL,     & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,           & 
& cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,           & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,       & 
& cplUhhHpmcVWRm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm, & 
& cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cpldeltaRppUhhUhhcdeltaRpp,          & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,    & 
& cplUhhUhhVZVZ,cplUhhUhhVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,3
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
Call Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,MFd,              & 
& MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cpldeltaRppUhhcdeltaRpp,cplcFdFdUhhL,     & 
& cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,cplFvFvUhhL,          & 
& cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,cplcgWLpgWLpUhh,           & 
& cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,cplcgZgZUhh,           & 
& cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,cplUhhHpmcVWLm,       & 
& cplUhhHpmcVWRm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,cplUhhcVWRmVWRm, & 
& cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cpldeltaRppUhhUhhcdeltaRpp,          & 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,    & 
& cplUhhUhhVZVZ,cplUhhUhhVZRVZR,kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,3
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoophh
 
 
Subroutine Pi1Loophh(p2,MAh,MAh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,            & 
& MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,            & 
& MVWRm2,cplAhAhUhh,cplAhUhhVP,cplAhUhhVZ,cplAhUhhVZR,cpldeltaRppUhhcdeltaRpp,           & 
& cplcFdFdUhhL,cplcFdFdUhhR,cplcFeFeUhhL,cplcFeFeUhhR,cplcFuFuUhhL,cplcFuFuUhhR,         & 
& cplFvFvUhhL,cplFvFvUhhR,cplcgWLmgWLmUhh,cplcgWRmgWLmUhh,cplcgWLmgWRmUhh,               & 
& cplcgWLpgWLpUhh,cplcgWRpgWLpUhh,cplcgWLpgWRpUhh,cplcgWRmgWRmUhh,cplcgWRpgWRpUhh,       & 
& cplcgZgZUhh,cplcgZpgZUhh,cplcgZgZpUhh,cplcgZpgZpUhh,cplUhhhhhh,cplUhhHpmcHpm,          & 
& cplUhhHpmcVWLm,cplUhhHpmcVWRm,cplUhhVPVZ,cplUhhVPVZR,cplUhhcVWLmVWLm,cplUhhcVWRmVWLm,  & 
& cplUhhcVWRmVWRm,cplUhhVZVZ,cplUhhVZVZR,cplUhhVZRVZR,cplAhAhUhhUhh,cpldeltaRppUhhUhhcdeltaRpp,& 
& cplUhhUhhhhhh,cplUhhUhhHpmcHpm,cplUhhUhhVPVP,cplUhhUhhcVWLmVWLm,cplUhhUhhcVWRmVWRm,    & 
& cplUhhUhhVZVZ,cplUhhUhhVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MAh(3),MAh2(3),MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,MFd(3),MFd2(3),               & 
& MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MHpm(3),MHpm2(3),          & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhAhUhh(3,3,3),cplAhUhhVP(3,3),cplAhUhhVZ(3,3),cplAhUhhVZR(3,3),cpldeltaRppUhhcdeltaRpp(3),& 
& cplcFdFdUhhL(3,3,3),cplcFdFdUhhR(3,3,3),cplcFeFeUhhL(3,3,3),cplcFeFeUhhR(3,3,3),       & 
& cplcFuFuUhhL(3,3,3),cplcFuFuUhhR(3,3,3),cplFvFvUhhL(6,6,3),cplFvFvUhhR(6,6,3),         & 
& cplcgWLmgWLmUhh(3),cplcgWRmgWLmUhh(3),cplcgWLmgWRmUhh(3),cplcgWLpgWLpUhh(3),           & 
& cplcgWRpgWLpUhh(3),cplcgWLpgWRpUhh(3),cplcgWRmgWRmUhh(3),cplcgWRpgWRpUhh(3),           & 
& cplcgZgZUhh(3),cplcgZpgZUhh(3),cplcgZgZpUhh(3),cplcgZpgZpUhh(3),cplUhhhhhh(3,3,3),     & 
& cplUhhHpmcHpm(3,3,3),cplUhhHpmcVWLm(3,3),cplUhhHpmcVWRm(3,3),cplUhhVPVZ(3),            & 
& cplUhhVPVZR(3),cplUhhcVWLmVWLm(3),cplUhhcVWRmVWLm(3),cplUhhcVWRmVWRm(3),               & 
& cplUhhVZVZ(3),cplUhhVZVZR(3),cplUhhVZRVZR(3),cplAhAhUhhUhh(3,3,3,3),cpldeltaRppUhhUhhcdeltaRpp(3,3),& 
& cplUhhUhhhhhh(3,3,3,3),cplUhhUhhHpmcHpm(3,3,3,3),cplUhhUhhVPVP(3,3),cplUhhUhhcVWLmVWLm(3,3),& 
& cplUhhUhhcVWRmVWRm(3,3),cplUhhUhhVZVZ(3,3),cplUhhUhhVZRVZR(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = B0(p2,MAh2(i1),MAh2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUhh(i1,i2,gO1)
coup2 = Conjg(cplAhAhUhh(i1,i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VP, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MAh2(i2),0._dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhUhhVP(i2,gO1)
coup2 =  Conjg(cplAhUhhVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MAh2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhUhhVZ(i2,gO1)
coup2 =  Conjg(cplAhUhhVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MAh2(i2),MVZR2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhUhhVZR(i2,gO1)
coup2 =  Conjg(cplAhUhhVZR(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[deltaRpp], deltaRpp 
!------------------------ 
sumI = 0._dp 
 
B0m2 = B0(p2,MdeltaRpp2,MdeltaRpp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpldeltaRppUhhcdeltaRpp(gO1)
coup2 = Conjg(cpldeltaRppUhhcdeltaRpp(gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFdFdUhhL(i1,i2,gO1)
coupR1 = cplcFdFdUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFeUhhL(i1,i2,gO1)
coupR1 = cplcFeFeUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFuFuUhhL(i1,i2,gO1)
coupR1 = cplcFuFuUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Gloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplFvFvUhhL(i1,i2,gO1)
coupR1 = cplFvFvUhhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUhhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUhhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWLmgWLmUhh(gO1)
coup2 =  cplcgWLmgWLmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRmgWLmUhh(gO1)
coup2 =  cplcgWLmgWRmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWLpgWLpUhh(gO1)
coup2 =  cplcgWLpgWLpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRpgWLpUhh(gO1)
coup2 =  cplcgWLpgWRpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRmgWRmUhh(gO1)
coup2 =  cplcgWRmgWRmUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRpgWRpUhh(gO1)
coup2 =  cplcgWRpgWRpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZgZUhh(gO1)
coup2 =  cplcgZgZUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZpgZUhh(gO1)
coup2 =  cplcgZgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gZR], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZR2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZpgZpUhh(gO1)
coup2 =  cplcgZpgZpUhh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = B0(p2,Mhh2(i1),Mhh2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhhhhh(gO1,i1,i2)
coup2 = Conjg(cplUhhhhhh(gO2,i1,i2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = B0(p2,MHpm2(i1),MHpm2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUhhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWLm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhHpmcVWLm(gO1,i2)
coup2 =  Conjg(cplUhhHpmcVWLm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWRm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhHpmcVWRm(gO1,i2)
coup2 =  Conjg(cplUhhHpmcVWRm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! VZ, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVZ2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhVPVZ(gO1)
coup2 =  Conjg(cplUhhVPVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVZR2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhVPVZR(gO1)
coup2 =  Conjg(cplUhhVPVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWLm2,MVWLm2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhcVWLmVWLm(gO1)
coup2 =  Conjg(cplUhhcVWLmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWLm2,MVWRm2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhcVWRmVWLm(gO1)
coup2 =  Conjg(cplUhhcVWRmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWRm2,MVWRm2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhcVWRmVWRm(gO1)
coup2 =  Conjg(cplUhhcVWRmVWRm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZ2,MVZ2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhVZVZ(gO1)
coup2 =  Conjg(cplUhhVZVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR, VZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZ2,MVZR2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhVZVZR(gO1)
coup2 =  Conjg(cplUhhVZVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVZR2,MVZR2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhVZRVZR(gO1)
coup2 =  Conjg(cplUhhVZRVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(MAh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUhhUhh(i1,i1,gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[deltaRpp], deltaRpp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MdeltaRpp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpldeltaRppUhhUhhcdeltaRpp(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(MHpm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWLm2) + 0.25_dp*RXi*A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhcVWLmVWLm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWRm2) + 0.25_dp*RXi*A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhcVWRmVWRm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZR2) + 0.25_dp*RXi*A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUhhUhhVZRVZR(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1Loophh 
 
Subroutine OneLoopAh(gBL,g2,gR,mu32,MU22,MU12,RHO1,ALP1,LAM1,ALP3,ALP2,               & 
& LAM4,LAM2,LAM3,vd,vu,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,               & 
& MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MdeltaRpp,           & 
& MdeltaRpp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,             & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,     & 
& cplcgWLmgWRmUAh,cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,       & 
& cplcgWRpgWRpUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,        & 
& cplUAhHpmcVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhdeltaRppcdeltaRpp,               & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,    & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MdeltaRpp,MdeltaRpp2

Real(dp), Intent(in) :: gBL,g2,gR,mu32,MU22,MU12,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,vd,vu,vR

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplUAhAhhh(3,3,3),cplcFdFdUAhL(3,3,3),cplcFdFdUAhR(3,3,3),cplcFeFeUAhL(3,3,3),        & 
& cplcFeFeUAhR(3,3,3),cplcFuFuUAhL(3,3,3),cplcFuFuUAhR(3,3,3),cplFvFvUAhL(6,6,3),        & 
& cplFvFvUAhR(6,6,3),cplcgWLmgWLmUAh(3),cplcgWRmgWLmUAh(3),cplcgWLmgWRmUAh(3),           & 
& cplcgWLpgWLpUAh(3),cplcgWRpgWLpUAh(3),cplcgWLpgWRpUAh(3),cplcgWRmgWRmUAh(3),           & 
& cplcgWRpgWRpUAh(3),cplUAhhhVP(3,3),cplUAhhhVZ(3,3),cplUAhhhVZR(3,3),cplUAhHpmcHpm(3,3,3),& 
& cplUAhHpmcVWLm(3,3),cplUAhHpmcVWRm(3,3),cplUAhcVWRmVWLm(3),cplUAhUAhAhAh(3,3,3,3),     & 
& cplUAhUAhdeltaRppcdeltaRpp(3,3),cplUAhUAhhhhh(3,3,3,3),cplUAhUAhHpmcHpm(3,3,3,3),      & 
& cplUAhUAhVPVP(3,3),cplUAhUAhcVWLmVWLm(3,3),cplUAhUAhcVWRmVWRm(3,3),cplUAhUAhVZVZ(3,3), & 
& cplUAhUAhVZRVZR(3,3)

Complex(dp) :: mat2a(3,3), mat2(3,3),  PiSf(3,3,3)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2, test(3) 
Real(dp), Intent(out) :: mass(3), mass2(3) 
Complex(dp), Intent(out) ::  RS(3,3) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopAh'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-1._dp*(MU12)
mat2a(1,1) = mat2a(1,1)+LAM1*vd**2
mat2a(1,1) = mat2a(1,1)-2*LAM4*vd*vu
mat2a(1,1) = mat2a(1,1)+LAM1*vu**2
mat2a(1,1) = mat2a(1,1)-4*LAM2*vu**2
mat2a(1,1) = mat2a(1,1)+2*LAM3*vu**2
mat2a(1,1) = mat2a(1,1)+(ALP1*vR**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vd**2*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vd**2*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vd**2*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,1) = mat2a(1,1)+(gR**2*vd**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vd**2*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,1) = mat2a(1,1)+(gR**2*vd**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-2._dp*(MU22)
mat2a(1,2) = mat2a(1,2)+LAM4*vd**2
mat2a(1,2) = mat2a(1,2)-8*LAM2*vd*vu
mat2a(1,2) = mat2a(1,2)+LAM4*vu**2
mat2a(1,2) = mat2a(1,2)+ALP2*vR**2
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vd*vu*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vd*vu*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vd*vu*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,2) = mat2a(1,2)-(gR**2*vd*vu*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vd*vu*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,2) = mat2a(1,2)-(gR**2*vd*vu*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vd*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(1,3) = mat2a(1,3)-(gBL*gR*vd*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vd*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(1,3) = mat2a(1,3)-(gBL*gR*vd*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vd*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,3) = mat2a(1,3)-(g2*gR*vd*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(1,3) = mat2a(1,3)+(g2*gBL*vd*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,3) = mat2a(1,3)-(g2*gR*vd*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(1,3) = mat2a(1,3)-(gBL*gR*vd*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,3) = mat2a(1,3)-(g2*gR*vd*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(1,3) = mat2a(1,3)+(gR**2*vd*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/2._dp
mat2a(1,3) = mat2a(1,3)-(gBL*gR*vd*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,3) = mat2a(1,3)-(g2*gR*vd*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(1,3) = mat2a(1,3)+(gR**2*vd*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/2._dp
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp*(MU12)
mat2a(2,2) = mat2a(2,2)+LAM1*vd**2
mat2a(2,2) = mat2a(2,2)-4*LAM2*vd**2
mat2a(2,2) = mat2a(2,2)+2*LAM3*vd**2
mat2a(2,2) = mat2a(2,2)-2*LAM4*vd*vu
mat2a(2,2) = mat2a(2,2)+LAM1*vu**2
mat2a(2,2) = mat2a(2,2)+(ALP1*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*Conjg(ZZ(2,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vu**2*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*Conjg(ZZ(2,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vu**2*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vu**2*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,2) = mat2a(2,2)+(gR**2*vu**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vu**2*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,2) = mat2a(2,2)+(gR**2*vu**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vu*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(2,3) = mat2a(2,3)+(gBL*gR*vu*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))/4._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vu*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(2,3) = mat2a(2,3)+(gBL*gR*vu*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))/4._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vu*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,3) = mat2a(2,3)+(g2*gR*vu*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(2,2))/4._dp
mat2a(2,3) = mat2a(2,3)-(g2*gBL*vu*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,3) = mat2a(2,3)+(g2*gR*vu*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(2,3))/4._dp
mat2a(2,3) = mat2a(2,3)+(gBL*gR*vu*vR*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,3) = mat2a(2,3)+(g2*gR*vu*vR*Conjg(ZZ(2,2))*RXiZ*ZZ(3,2))/4._dp
mat2a(2,3) = mat2a(2,3)-(gR**2*vu*vR*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2))/2._dp
mat2a(2,3) = mat2a(2,3)+(gBL*gR*vu*vR*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,3) = mat2a(2,3)+(g2*gR*vu*vR*Conjg(ZZ(2,3))*RXiZR*ZZ(3,3))/4._dp
mat2a(2,3) = mat2a(2,3)-(gR**2*vu*vR*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3))/2._dp
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-1._dp*(mu32)
mat2a(3,3) = mat2a(3,3)+(ALP1*vd**2)/2._dp
mat2a(3,3) = mat2a(3,3)-2*ALP2*vd*vu
mat2a(3,3) = mat2a(3,3)+(ALP1*vu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(ALP3*vu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+RHO1*vR**2
mat2a(3,3) = mat2a(3,3)+gBL**2*vR**2*Conjg(ZZ(1,2))*RXiZ*ZZ(1,2)
mat2a(3,3) = mat2a(3,3)-(gBL*gR*vR**2*Conjg(ZZ(3,2))*RXiZ*ZZ(1,2))
mat2a(3,3) = mat2a(3,3)+gBL**2*vR**2*Conjg(ZZ(1,3))*RXiZR*ZZ(1,3)
mat2a(3,3) = mat2a(3,3)-(gBL*gR*vR**2*Conjg(ZZ(3,3))*RXiZR*ZZ(1,3))
mat2a(3,3) = mat2a(3,3)-(gBL*gR*vR**2*Conjg(ZZ(1,2))*RXiZ*ZZ(3,2))
mat2a(3,3) = mat2a(3,3)+gR**2*vR**2*Conjg(ZZ(3,2))*RXiZ*ZZ(3,2)
mat2a(3,3) = mat2a(3,3)-(gBL*gR*vR**2*Conjg(ZZ(1,3))*RXiZR*ZZ(3,3))
mat2a(3,3) = mat2a(3,3)+gR**2*vR**2*Conjg(ZZ(3,3))*RXiZR*ZZ(3,3)

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = (mat2a(i2,i1)) 
  End do 
End do 

 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 = MAh2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MdeltaRpp,MdeltaRpp2,         & 
& cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,           & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,  & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,         & 
& cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhdeltaRppcdeltaRpp,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,& 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,     & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,3
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,              & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MdeltaRpp,MdeltaRpp2,         & 
& cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,cplcFuFuUAhL,           & 
& cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,cplcgWLmgWRmUAh,  & 
& cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,cplcgWRpgWRpUAh,       & 
& cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,cplUAhHpmcVWRm,         & 
& cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhdeltaRppcdeltaRpp,cplUAhUAhhhhh,cplUAhUAhHpmcHpm,& 
& cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,cplUAhUAhVZVZ,cplUAhUAhVZRVZR,     & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,3
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopAh
 
 
Subroutine Pi1LoopAh(p2,Mhh,Mhh2,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MdeltaRpp,               & 
& MdeltaRpp2,cplUAhAhhh,cplcFdFdUAhL,cplcFdFdUAhR,cplcFeFeUAhL,cplcFeFeUAhR,             & 
& cplcFuFuUAhL,cplcFuFuUAhR,cplFvFvUAhL,cplFvFvUAhR,cplcgWLmgWLmUAh,cplcgWRmgWLmUAh,     & 
& cplcgWLmgWRmUAh,cplcgWLpgWLpUAh,cplcgWRpgWLpUAh,cplcgWLpgWRpUAh,cplcgWRmgWRmUAh,       & 
& cplcgWRpgWRpUAh,cplUAhhhVP,cplUAhhhVZ,cplUAhhhVZR,cplUAhHpmcHpm,cplUAhHpmcVWLm,        & 
& cplUAhHpmcVWRm,cplUAhcVWRmVWLm,cplUAhUAhAhAh,cplUAhUAhdeltaRppcdeltaRpp,               & 
& cplUAhUAhhhhh,cplUAhUAhHpmcHpm,cplUAhUAhVPVP,cplUAhUAhcVWLmVWLm,cplUAhUAhcVWRmVWRm,    & 
& cplUAhUAhVZVZ,cplUAhUAhVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),           & 
& MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,         & 
& MdeltaRpp,MdeltaRpp2

Complex(dp), Intent(in) :: cplUAhAhhh(3,3,3),cplcFdFdUAhL(3,3,3),cplcFdFdUAhR(3,3,3),cplcFeFeUAhL(3,3,3),        & 
& cplcFeFeUAhR(3,3,3),cplcFuFuUAhL(3,3,3),cplcFuFuUAhR(3,3,3),cplFvFvUAhL(6,6,3),        & 
& cplFvFvUAhR(6,6,3),cplcgWLmgWLmUAh(3),cplcgWRmgWLmUAh(3),cplcgWLmgWRmUAh(3),           & 
& cplcgWLpgWLpUAh(3),cplcgWRpgWLpUAh(3),cplcgWLpgWRpUAh(3),cplcgWRmgWRmUAh(3),           & 
& cplcgWRpgWRpUAh(3),cplUAhhhVP(3,3),cplUAhhhVZ(3,3),cplUAhhhVZR(3,3),cplUAhHpmcHpm(3,3,3),& 
& cplUAhHpmcVWLm(3,3),cplUAhHpmcVWRm(3,3),cplUAhcVWRmVWLm(3),cplUAhUAhAhAh(3,3,3,3),     & 
& cplUAhUAhdeltaRppcdeltaRpp(3,3),cplUAhUAhhhhh(3,3,3,3),cplUAhUAhHpmcHpm(3,3,3,3),      & 
& cplUAhUAhVPVP(3,3),cplUAhUAhcVWLmVWLm(3,3),cplUAhUAhcVWRmVWRm(3,3),cplUAhUAhVZVZ(3,3), & 
& cplUAhUAhVZRVZR(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = B0(p2,Mhh2(i1),MAh2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhAhhh(gO1,i2,i1)
coup2 = Conjg(cplUAhAhhh(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFdFdUAhL(i1,i2,gO1)
coupR1 = cplcFdFdUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFdFdUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFdFdUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFeUAhL(i1,i2,gO1)
coupR1 = cplcFeFeUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFeUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFeUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFuFuUAhL(i1,i2,gO1)
coupR1 = cplcFuFuUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFuUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFuUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 G0m2 = Gloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplFvFvUAhL(i1,i2,gO1)
coupR1 = cplFvFvUAhR(i1,i2,gO1)
coupL2 =  Conjg(cplFvFvUAhL(i1,i2,gO2))
coupR2 =  Conjg(cplFvFvUAhR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWLmgWLmUAh(gO1)
coup2 =  cplcgWLmgWLmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRmgWLmUAh(gO1)
coup2 =  cplcgWLmgWRmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWLpgWLpUAh(gO1)
coup2 =  cplcgWLpgWLpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRpgWLpUAh(gO1)
coup2 =  cplcgWLpgWRpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRmgWRmUAh(gO1)
coup2 =  cplcgWRmgWRmUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRpgWRpUAh(gO1)
coup2 =  cplcgWRpgWRpUAh(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,Mhh2(i2),0._dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhhhVP(gO1,i2)
coup2 =  Conjg(cplUAhhhVP(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhhhVZ(gO1,i2)
coup2 =  Conjg(cplUAhhhVZ(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,Mhh2(i2),MVZR2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhhhVZR(gO1,i2)
coup2 =  Conjg(cplUAhhhVZR(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = B0(p2,MHpm2(i1),MHpm2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhHpmcHpm(gO1,i2,i1)
coup2 = Conjg(cplUAhHpmcHpm(gO2,i2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWLm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhHpmcVWLm(gO1,i2)
coup2 =  Conjg(cplUAhHpmcVWLm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWRm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhHpmcVWRm(gO1,i2)
coup2 =  Conjg(cplUAhHpmcVWRm(gO2,i2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWLm2,MVWRm2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhcVWRmVWLm(gO1)
coup2 =  Conjg(cplUAhcVWRmVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(MAh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhAhAh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[deltaRpp], deltaRpp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MdeltaRpp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhdeltaRppcdeltaRpp(gO1,gO2)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhhhhh(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(MHpm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhHpmcHpm(gO1,gO2,i1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWLm2) + 0.25_dp*RXi*A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhcVWLmVWLm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWRm2) + 0.25_dp*RXi*A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhcVWRmVWRm(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhVZVZ(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZR2) + 0.25_dp*RXi*A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUAhUAhVZRVZR(gO1,gO2)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = (res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopAh 
 
Subroutine OneLoopHpm(g2,gR,mu32,MU22,MU12,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,             & 
& LAM2,LAM3,vd,vu,vR,PhiW,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MFu,             & 
& MFu2,MFd,MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,     & 
& cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,             & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,         & 
& cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,       & 
& cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,        & 
& cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,         & 
& cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplcUHpmVPVWLm,              & 
& cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,          & 
& cplcdeltaRppcUHpmcHpm,cplcdeltaRppcUHpmcVWLm,cplcdeltaRppcUHpmcVWRm,cplAhAhUHpmcUHpm,  & 
& cpldeltaRppUHpmcdeltaRppcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmcUHpmVPVP,   & 
& cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,       & 
& delta,mass,mass2,RS,kont)

Implicit None 
Real(dp), Intent(in) :: MHpm(3),MHpm2(3),MAh(3),MAh2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MFu(3),MFu2(3),             & 
& MFd(3),MFd2(3),MFe(3),MFe2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MVZ,MVZ2,MVZR,             & 
& MVZR2,MdeltaRpp,MdeltaRpp2

Real(dp), Intent(in) :: g2,gR,mu32,MU22,MU12,RHO1,ALP1,LAM1,ALP3,ALP2,LAM4,LAM2,LAM3,vd,vu,vR,PhiW

Complex(dp), Intent(in) :: cplAhHpmcUHpm(3,3,3),cplAhcUHpmVWLm(3,3),cplAhcUHpmVWRm(3,3),cplcFuFdcUHpmL(3,3,3),   & 
& cplcFuFdcUHpmR(3,3,3),cplcFeFvcUHpmL(3,6,3),cplcFeFvcUHpmR(3,6,3),cplcgZgWLmcUHpm(3),  & 
& cplcgWLmgZUHpm(3),cplcgZpgWLmcUHpm(3),cplcgWLmgZpUHpm(3),cplcgZgWRmcUHpm(3),           & 
& cplcgWRmgZUHpm(3),cplcgZpgWRmcUHpm(3),cplcgWRmgZpUHpm(3),cplcgWLpgZcUHpm(3),           & 
& cplcgZgWLpUHpm(3),cplcgWRpgZcUHpm(3),cplcgZgWRpUHpm(3),cplcgWLpgZpcUHpm(3),            & 
& cplcgZpgWLpUHpm(3),cplcgWRpgZpcUHpm(3),cplcgZpgWRpUHpm(3),cplhhHpmcUHpm(3,3,3),        & 
& cplhhcUHpmVWLm(3,3),cplhhcUHpmVWRm(3,3),cplHpmcUHpmVP(3,3),cplHpmcUHpmVZ(3,3),         & 
& cplHpmcUHpmVZR(3,3),cplcUHpmVPVWLm(3),cplcUHpmVPVWRm(3),cplcUHpmVWLmVZ(3),             & 
& cplcUHpmVWLmVZR(3),cplcUHpmVWRmVZ(3),cplcUHpmVWRmVZR(3),cplcdeltaRppcUHpmcHpm(3,3),    & 
& cplcdeltaRppcUHpmcVWLm(3),cplcdeltaRppcUHpmcVWRm(3),cplAhAhUHpmcUHpm(3,3,3,3),         & 
& cpldeltaRppUHpmcdeltaRppcUHpm(3,3),cplhhhhUHpmcUHpm(3,3,3,3),cplUHpmHpmcUHpmcHpm(3,3,3,3),& 
& cplUHpmcUHpmVPVP(3,3),cplUHpmcUHpmcVWLmVWLm(3,3),cplUHpmcUHpmcVWRmVWRm(3,3),           & 
& cplUHpmcUHpmVZVZ(3,3),cplUHpmcUHpmVZRVZR(3,3)

Complex(dp) :: mat2a(3,3), mat2(3,3),  PiSf(3,3,3)
Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3),p2, test(3) 
Real(dp), Intent(out) :: mass(3), mass2(3) 
Complex(dp), Intent(out) ::  RS(3,3) 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopHpm'
 
mat2a(1,1) = 0._dp 
mat2a(1,1) = mat2a(1,1)-1._dp*(MU12)
mat2a(1,1) = mat2a(1,1)+LAM1*vd**2
mat2a(1,1) = mat2a(1,1)-2*LAM4*vd*vu
mat2a(1,1) = mat2a(1,1)+LAM1*vu**2
mat2a(1,1) = mat2a(1,1)+(ALP1*vR**2)/2._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*Cos(PhiW)**2*RXiWLm)/4._dp
mat2a(1,1) = mat2a(1,1)+(gR**2*vu**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat2a(1,1) = mat2a(1,1)-(g2*gR*vd*vu*Cos(PhiW)*RXiWLm*Sin(PhiW))/2._dp
mat2a(1,1) = mat2a(1,1)+(g2*gR*vd*vu*Cos(PhiW)*RXiWRm*Sin(PhiW))/2._dp
mat2a(1,1) = mat2a(1,1)+(gR**2*vu**2*RXiWLm*Sin(PhiW)**2)/4._dp
mat2a(1,1) = mat2a(1,1)+(g2**2*vd**2*RXiWRm*Sin(PhiW)**2)/4._dp
mat2a(1,2) = 0._dp 
mat2a(1,2) = mat2a(1,2)-2._dp*(MU22)
mat2a(1,2) = mat2a(1,2)+LAM4*vd**2
mat2a(1,2) = mat2a(1,2)-4*LAM2*vd*vu
mat2a(1,2) = mat2a(1,2)-2*LAM3*vd*vu
mat2a(1,2) = mat2a(1,2)+LAM4*vu**2
mat2a(1,2) = mat2a(1,2)+ALP2*vR**2
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*Cos(PhiW)**2*RXiWLm)/4._dp
mat2a(1,2) = mat2a(1,2)-(gR**2*vd*vu*Cos(PhiW)**2*RXiWRm)/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vd**2*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat2a(1,2) = mat2a(1,2)+(g2*gR*vu**2*Cos(PhiW)*RXiWLm*Sin(PhiW))/4._dp
mat2a(1,2) = mat2a(1,2)-(g2*gR*vd**2*Cos(PhiW)*RXiWRm*Sin(PhiW))/4._dp
mat2a(1,2) = mat2a(1,2)-(g2*gR*vu**2*Cos(PhiW)*RXiWRm*Sin(PhiW))/4._dp
mat2a(1,2) = mat2a(1,2)-(gR**2*vd*vu*RXiWLm*Sin(PhiW)**2)/4._dp
mat2a(1,2) = mat2a(1,2)-(g2**2*vd*vu*RXiWRm*Sin(PhiW)**2)/4._dp
mat2a(1,3) = 0._dp 
mat2a(1,3) = mat2a(1,3)+(ALP3*vu*vR)/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)+(gR**2*vu*vR*Cos(PhiW)**2*RXiWRm)/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)-(g2*gR*vd*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)+(g2*gR*vd*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(1,3) = mat2a(1,3)+(gR**2*vu*vR*RXiWLm*Sin(PhiW)**2)/(2._dp*sqrt(2._dp))
mat2a(2,2) = 0._dp 
mat2a(2,2) = mat2a(2,2)-1._dp*(MU12)
mat2a(2,2) = mat2a(2,2)+LAM1*vd**2
mat2a(2,2) = mat2a(2,2)-2*LAM4*vd*vu
mat2a(2,2) = mat2a(2,2)+LAM1*vu**2
mat2a(2,2) = mat2a(2,2)+(ALP1*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(ALP3*vR**2)/2._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*Cos(PhiW)**2*RXiWLm)/4._dp
mat2a(2,2) = mat2a(2,2)+(gR**2*vd**2*Cos(PhiW)**2*RXiWRm)/4._dp
mat2a(2,2) = mat2a(2,2)-(g2*gR*vd*vu*Cos(PhiW)*RXiWLm*Sin(PhiW))/2._dp
mat2a(2,2) = mat2a(2,2)+(g2*gR*vd*vu*Cos(PhiW)*RXiWRm*Sin(PhiW))/2._dp
mat2a(2,2) = mat2a(2,2)+(gR**2*vd**2*RXiWLm*Sin(PhiW)**2)/4._dp
mat2a(2,2) = mat2a(2,2)+(g2**2*vu**2*RXiWRm*Sin(PhiW)**2)/4._dp
mat2a(2,3) = 0._dp 
mat2a(2,3) = mat2a(2,3)+(ALP3*vd*vR)/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)-(gR**2*vd*vR*Cos(PhiW)**2*RXiWRm)/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)+(g2*gR*vu*vR*Cos(PhiW)*RXiWLm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)-(g2*gR*vu*vR*Cos(PhiW)*RXiWRm*Sin(PhiW))/(2._dp*sqrt(2._dp))
mat2a(2,3) = mat2a(2,3)-(gR**2*vd*vR*RXiWLm*Sin(PhiW)**2)/(2._dp*sqrt(2._dp))
mat2a(3,3) = 0._dp 
mat2a(3,3) = mat2a(3,3)-1._dp*(mu32)
mat2a(3,3) = mat2a(3,3)+(ALP1*vd**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(ALP3*vd**2)/4._dp
mat2a(3,3) = mat2a(3,3)-2*ALP2*vd*vu
mat2a(3,3) = mat2a(3,3)+(ALP1*vu**2)/2._dp
mat2a(3,3) = mat2a(3,3)+(ALP3*vu**2)/4._dp
mat2a(3,3) = mat2a(3,3)+RHO1*vR**2
mat2a(3,3) = mat2a(3,3)+(gR**2*vR**2*Cos(PhiW)**2*RXiWRm)/2._dp
mat2a(3,3) = mat2a(3,3)+(gR**2*vR**2*RXiWLm*Sin(PhiW)**2)/2._dp

 
 Do i1=2,3
  Do i2 = 1, i1-1 
  mat2a(i1,i2) = Conjg(mat2a(i2,i1)) 
  End do 
End do 

 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 = MHpm2(i1)
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MFu,MFu2,            & 
& MFd,MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,          & 
& cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,             & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,         & 
& cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,       & 
& cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,        & 
& cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,         & 
& cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplcUHpmVPVWLm,              & 
& cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,          & 
& cplcdeltaRppcUHpmcHpm,cplcdeltaRppcUHpmcVWLm,cplcdeltaRppcUHpmcVWRm,cplAhAhUHpmcUHpm,  & 
& cpldeltaRppUHpmcdeltaRppcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmcUHpmVPVP,   & 
& cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,       & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
 
Do i1=1,3
  If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
  If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = Sqrt(mass2(i1)) 
  Else 
   If (ErrorLevel.Ge.0) Then 
   If ((i1.Gt.1).or.(Abs(mass2(i1)).gt.MaxVal(Abs(mass2)))) Then 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses' 
     Write(*,*) 'occurred a negative mass squared!' 
   Call TerminateProgram 
   End If 
   End If 
   kont = -301 
   mass(i1) = 0._dp 
  End If 
End Do 
 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
Do i1=1,3
PiSf(i1,:,:) = ZeroC 
p2 =  mass2(i1) 
If (i1.eq.1) p2 = 0._dp 
If (i1.eq.2) p2 = 0._dp 
Call Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,MFu,MFu2,            & 
& MFd,MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,          & 
& cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,             & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,         & 
& cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,       & 
& cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,        & 
& cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,         & 
& cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplcUHpmVPVWLm,              & 
& cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,          & 
& cplcdeltaRppcUHpmcHpm,cplcdeltaRppcUHpmcVWLm,cplcdeltaRppcUHpmcVWRm,cplAhAhUHpmcUHpm,  & 
& cpldeltaRppUHpmcdeltaRppcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmcUHpmVPVP,   & 
& cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,       & 
& kont,PiSf(i1,:,:))

End Do 
Do i1=3,1,-1 
mat2 = mat2a - Real(PiSf(i1,:,:),dp) 
Call Chop(mat2) 
Call Eigensystem(mat2,mi2,RS,kont,test) 
If ((kont.Eq.-8).Or.(kont.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  kont = 0 
End If 
If ((kont.Ne.0).And.(ErrorLevel.Ge.0)) Then 
  Write(ErrCan,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  Write(*,*) "Diagonalization did not work in routine "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
End If 
mass2(i1) = mi2(i1) 
End do 
Do i1=1,3
 If (Abs(mass2(i1)).Le.MaxMassNumericalZero**2) mass2(i1) = 0._dp 
 If (test_m2(i1).Ne.0._dp) Then 
    test_m2(i1) = Abs(test_m2(i1) - mass2(i1)) / test_m2(i1) 
 Else 
    test_m2(i1) = Abs(mass2(i1)) 
 End If 
 If (Abs(mass2(i1)).lt.1.0E-30_dp) test_m2(i1) = 0._dp 
 If (mass2(i1).Ge.0._dp) Then 
    mass(i1) = sqrt(mass2(i1)) 
  Else 
     Write(*,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(*,*) 'in the calculation of the masses occurred a negative mass squared!' 
     Write(*,*) 'generation: ',i1 
     Write(*,*) 'mass: ',mass2(i1) 
   SignOfMassChanged = .True. 
   mass(i1) = 0._dp 
  End If 
End Do 
 
If (Maxval(test_m2).LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopHpm
 
 
Subroutine Pi1LoopHpm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MVWRm,MVWRm2,               & 
& MFu,MFu2,MFd,MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,            & 
& MdeltaRpp2,cplAhHpmcUHpm,cplAhcUHpmVWLm,cplAhcUHpmVWRm,cplcFuFdcUHpmL,cplcFuFdcUHpmR,  & 
& cplcFeFvcUHpmL,cplcFeFvcUHpmR,cplcgZgWLmcUHpm,cplcgWLmgZUHpm,cplcgZpgWLmcUHpm,         & 
& cplcgWLmgZpUHpm,cplcgZgWRmcUHpm,cplcgWRmgZUHpm,cplcgZpgWRmcUHpm,cplcgWRmgZpUHpm,       & 
& cplcgWLpgZcUHpm,cplcgZgWLpUHpm,cplcgWRpgZcUHpm,cplcgZgWRpUHpm,cplcgWLpgZpcUHpm,        & 
& cplcgZpgWLpUHpm,cplcgWRpgZpcUHpm,cplcgZpgWRpUHpm,cplhhHpmcUHpm,cplhhcUHpmVWLm,         & 
& cplhhcUHpmVWRm,cplHpmcUHpmVP,cplHpmcUHpmVZ,cplHpmcUHpmVZR,cplcUHpmVPVWLm,              & 
& cplcUHpmVPVWRm,cplcUHpmVWLmVZ,cplcUHpmVWLmVZR,cplcUHpmVWRmVZ,cplcUHpmVWRmVZR,          & 
& cplcdeltaRppcUHpmcHpm,cplcdeltaRppcUHpmcVWLm,cplcdeltaRppcUHpmcVWRm,cplAhAhUHpmcUHpm,  & 
& cpldeltaRppUHpmcdeltaRppcUHpm,cplhhhhUHpmcUHpm,cplUHpmHpmcUHpmcHpm,cplUHpmcUHpmVPVP,   & 
& cplUHpmcUHpmcVWLmVWLm,cplUHpmcUHpmcVWRmVWRm,cplUHpmcUHpmVZVZ,cplUHpmcUHpmVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(3),MHpm2(3),MAh(3),MAh2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MFu(3),MFu2(3),             & 
& MFd(3),MFd2(3),MFe(3),MFe2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MVZ,MVZ2,MVZR,             & 
& MVZR2,MdeltaRpp,MdeltaRpp2

Complex(dp), Intent(in) :: cplAhHpmcUHpm(3,3,3),cplAhcUHpmVWLm(3,3),cplAhcUHpmVWRm(3,3),cplcFuFdcUHpmL(3,3,3),   & 
& cplcFuFdcUHpmR(3,3,3),cplcFeFvcUHpmL(3,6,3),cplcFeFvcUHpmR(3,6,3),cplcgZgWLmcUHpm(3),  & 
& cplcgWLmgZUHpm(3),cplcgZpgWLmcUHpm(3),cplcgWLmgZpUHpm(3),cplcgZgWRmcUHpm(3),           & 
& cplcgWRmgZUHpm(3),cplcgZpgWRmcUHpm(3),cplcgWRmgZpUHpm(3),cplcgWLpgZcUHpm(3),           & 
& cplcgZgWLpUHpm(3),cplcgWRpgZcUHpm(3),cplcgZgWRpUHpm(3),cplcgWLpgZpcUHpm(3),            & 
& cplcgZpgWLpUHpm(3),cplcgWRpgZpcUHpm(3),cplcgZpgWRpUHpm(3),cplhhHpmcUHpm(3,3,3),        & 
& cplhhcUHpmVWLm(3,3),cplhhcUHpmVWRm(3,3),cplHpmcUHpmVP(3,3),cplHpmcUHpmVZ(3,3),         & 
& cplHpmcUHpmVZR(3,3),cplcUHpmVPVWLm(3),cplcUHpmVPVWRm(3),cplcUHpmVWLmVZ(3),             & 
& cplcUHpmVWLmVZR(3),cplcUHpmVWRmVZ(3),cplcUHpmVWRmVZR(3),cplcdeltaRppcUHpmcHpm(3,3),    & 
& cplcdeltaRppcUHpmcVWLm(3),cplcdeltaRppcUHpmcVWRm(3),cplAhAhUHpmcUHpm(3,3,3,3),         & 
& cpldeltaRppUHpmcdeltaRppcUHpm(3,3),cplhhhhUHpmcUHpm(3,3,3,3),cplUHpmHpmcUHpmcHpm(3,3,3,3),& 
& cplUHpmcUHpmVPVP(3,3),cplUHpmcUHpmcVWLmVWLm(3,3),cplUHpmcUHpmcVWRmVWRm(3,3),           & 
& cplUHpmcUHpmVZVZ(3,3),cplUHpmcUHpmVZRVZR(3,3)

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI(3,3) 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = B0(p2,MHpm2(i1),MAh2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplAhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MAh2(i2),MVWLm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhcUHpmVWLm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmVWLm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MAh2(i2),MVWRm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhcUHpmVWRm(i2,gO1)
coup2 =  Conjg(cplAhcUHpmVWRm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFu2(i1),MFd2(i2)) 
B0m2 = -2._dp*MFu(i1)*MFd(i2)*B0(p2,MFu2(i1),MFd2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFuFdcUHpmL(i1,i2,gO1)
coupR1 = cplcFuFdcUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFuFdcUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFuFdcUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 G0m2 = Gloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFv(i2)*B0(p2,MFe2(i1),MFv2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coupL1 = cplcFeFvcUHpmL(i1,i2,gO1)
coupR1 = cplcFeFvcUHpmR(i1,i2,gO1)
coupL2 =  Conjg(cplcFeFvcUHpmL(i1,i2,gO2))
coupR2 =  Conjg(cplcFeFvcUHpmR(i1,i2,gO2))
    SumI(gO1,gO2) = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZgWLmcUHpm(gO1)
coup2 =  cplcgWLmgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWLm2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZpgWLmcUHpm(gO1)
coup2 =  cplcgWLmgZpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWRm2*RXi,MVZ2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZgWRmcUHpm(gO1)
coup2 =  cplcgWRmgZUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVWRm2*RXi,MVZR2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgZpgWRmcUHpm(gO1)
coup2 =  cplcgWRmgZpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWLpgZcUHpm(gO1)
coup2 =  cplcgZgWLpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZ2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRpgZcUHpm(gO1)
coup2 =  cplcgZgWRpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZR2*RXi,MVWLm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWLpgZpcUHpm(gO1)
coup2 =  cplcgZpgWLpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
F0m2 = -Real(B0(p2,MVZR2*RXi,MVWRm2*RXi),dp) 
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcgWRpgZpcUHpm(gO1)
coup2 =  cplcgZpgWRpUHpm(gO2) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = B0(p2,MHpm2(i1),Mhh2(i2)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhHpmcUHpm(i2,i1,gO1)
coup2 = Conjg(cplhhHpmcUHpm(i2,i1,gO2))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWLm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhcUHpmVWLm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmVWLm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,Mhh2(i2),MVWRm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhcUHpmVWRm(i2,gO1)
coup2 =  Conjg(cplhhcUHpmVWRm(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),0._dp) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplHpmcUHpmVP(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVP(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZ2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplHpmcUHpmVZ(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZ(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),MVZR2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplHpmcUHpmVZR(i2,gO1)
coup2 =  Conjg(cplHpmcUHpmVZR(i2,gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVWLm2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHpmVPVWLm(gO1)
coup2 =  Conjg(cplcUHpmVPVWLm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,0._dp,MVWRm2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHpmVPVWRm(gO1)
coup2 =  Conjg(cplcUHpmVPVWRm(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWLm2,MVZ2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHpmVWLmVZ(gO1)
coup2 =  Conjg(cplcUHpmVWLmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWLm2,MVZR2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHpmVWLmVZR(gO1)
coup2 =  Conjg(cplcUHpmVWLmVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWRm2,MVZ2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHpmVWRmVZ(gO1)
coup2 =  Conjg(cplcUHpmVWRmVZ(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWRm2,MVZR2)   
 Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcUHpmVWRmVZR(gO1)
coup2 =  Conjg(cplcUHpmVWRmVZR(gO2)) 
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = B0(p2,MHpm2(i1),MdeltaRpp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcdeltaRppcUHpmcHpm(gO1,i1)
coup2 = Conjg(cplcdeltaRppcUHpmcHpm(gO2,i1))
    SumI(gO1,gO2) = coup1*coup2*B0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MdeltaRpp2,MVWLm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcdeltaRppcUHpmcVWLm(gO1)
coup2 =  Conjg(cplcdeltaRppcUHpmcVWLm(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MdeltaRpp2,MVWRm2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplcdeltaRppcUHpmcVWRm(gO1)
coup2 =  Conjg(cplcdeltaRppcUHpmcVWRm(gO2))
    SumI(gO1,gO2) = coup1*coup2*F0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(MAh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplAhAhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[deltaRpp], deltaRpp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MdeltaRpp2) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cpldeltaRppUHpmcdeltaRppcUHpm(gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(Mhh2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplhhhhUHpmcUHpm(i1,i1,gO2,gO1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(MHpm2(i1)) 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHpmHpmcUHpmcHpm(gO2,i1,gO1,i1)
    SumI(gO1,gO2) = -coup1*A0m2 
   End Do 
End Do 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWLm2) + 0.25_dp*RXi*A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHpmcUHpmcVWLmVWLm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVWRm2) + 0.25_dp*RXi*A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHpmcUHpmcVWRmVWRm(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHpmcUHpmVZVZ(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 = 0.75_dp*A0(MVZR2) + 0.25_dp*RXi*A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
Do gO1 = 1, 3
  Do gO2 = gO1, 3
coup1 = cplUHpmcUHpmVZRVZR(gO2,gO1)
    SumI(gO1,gO2) = coup1*A0m2 
   End Do 
End Do 
res = res +2._dp* SumI  


Do gO2 = 1, 3
  Do gO1 = gO2+1, 3
     res(gO1,gO2) = Conjg(res(gO2,gO1))  
   End Do 
End Do 
 
res = oo16pi2*res 
 
End Subroutine Pi1LoopHpm 
 
Subroutine OneLoopFd(YQ1,YQ2,vd,vu,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,               & 
& MVZR,MVZR2,MHpm,MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,    & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWLmL,cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,delta,MFd_1L,              & 
& MFd2_1L,ZDL_1L,ZDR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2,MVZR,MVZR2,MHpm(3),             & 
& MHpm2(3),MFu(3),MFu2(3),MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: vd,vu

Complex(dp), Intent(in) :: YQ1(3,3),YQ2(3,3)

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,3),cplcUFdFdAhR(3,3,3),cplcUFdFdhhL(3,3,3),cplcUFdFdhhR(3,3,3),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFuHpmL(3,3,3),cplcUFdFuHpmR(3,3,3),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),     & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFd_1L(3),MFd2_1L(3) 
 Complex(dp), Intent(out) :: ZDL_1L(3,3), ZDR_1L(3,3) 
 
 Real(dp) :: MFd_t(3),MFd2_t(3) 
 Complex(dp) :: ZDL_t(3,3), ZDR_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZDL2(3,3), ZDR2(3,3) 
 
 Real(dp) :: ZDL1(3,3), ZDR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFd'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vu*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat1a(1,1) = mat1a(1,1)+(vd*Conjg(YQ2(1,1)))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vu*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(vd*Conjg(YQ2(1,2)))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vu*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(vd*Conjg(YQ2(1,3)))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vu*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(vd*Conjg(YQ2(2,1)))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vu*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat1a(2,2) = mat1a(2,2)+(vd*Conjg(YQ2(2,2)))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vu*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(vd*Conjg(YQ2(2,3)))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vu*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(vd*Conjg(YQ2(3,1)))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vu*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(vd*Conjg(YQ2(3,2)))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vu*Conjg(YQ1(3,3)))/sqrt(2._dp)
mat1a(3,3) = mat1a(3,3)+(vd*Conjg(YQ2(3,3)))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2(il) 
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFd2_t(iL)
Call Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,             & 
& MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,cplcUFdFdhhL,       & 
& cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,cplcUFdFdVZL,         & 
& cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,cplcUFdFuVWLmL,   & 
& cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDR1,ierr,test) 
ZDR2 = ZDR1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFd2_1L(il) = MFd2_t(il) 
MFd_1L(il) = Sqrt(MFd2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFd2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFd2_1L(il))
End If 
If (Abs(MFd2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFd2_t,ZDL1,ierr,test) 
 
 
ZDL2 = ZDL1 
Else 
Call EigenSystem(mat2,MFd2_t,ZDL2,ierr,test) 
 
 
End If 
ZDL2 = Conjg(ZDL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZDL2),mat1),Transpose( Conjg(ZDR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZDR2(i1,:) = phaseM *ZDR2(i1,:) 
 End if 
End Do 
 
ZDL_1L = ZDL2 
 ZDR_1L = ZDR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFd
 
 
Subroutine Sigma1LoopFd(p2,MFd,MFd2,MAh,MAh2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MHpm,MHpm2,MFu,MFu2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFdFdAhL,cplcUFdFdAhR,               & 
& cplcUFdFdhhL,cplcUFdFdhhR,cplcUFdFdVGL,cplcUFdFdVGR,cplcUFdFdVPL,cplcUFdFdVPR,         & 
& cplcUFdFdVZL,cplcUFdFdVZR,cplcUFdFdVZRL,cplcUFdFdVZRR,cplcUFdFuHpmL,cplcUFdFuHpmR,     & 
& cplcUFdFuVWLmL,cplcUFdFuVWLmR,cplcUFdFuVWRmL,cplcUFdFuVWRmR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFd(3),MFd2(3),MAh(3),MAh2(3),Mhh(3),Mhh2(3),MVZ,MVZ2,MVZR,MVZR2,MHpm(3),             & 
& MHpm2(3),MFu(3),MFu2(3),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcUFdFdAhL(3,3,3),cplcUFdFdAhR(3,3,3),cplcUFdFdhhL(3,3,3),cplcUFdFdhhR(3,3,3),      & 
& cplcUFdFdVGL(3,3),cplcUFdFdVGR(3,3),cplcUFdFdVPL(3,3),cplcUFdFdVPR(3,3),               & 
& cplcUFdFdVZL(3,3),cplcUFdFdVZR(3,3),cplcUFdFdVZRL(3,3),cplcUFdFdVZRR(3,3),             & 
& cplcUFdFuHpmL(3,3,3),cplcUFdFuHpmR(3,3,3),cplcUFdFuVWLmL(3,3),cplcUFdFuVWLmR(3,3),     & 
& cplcUFdFuVWRmL(3,3),cplcUFdFuVWRmR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fd, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i1),MAh2(i2)),dp) 
B0m2 = MFd(i1)*Real(B0(p2,MFd2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFdFdAhL(gO1,i1,i2)
coupR1 = cplcUFdFdAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFdFdAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFdFdAhR(gO2,i1,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! hh, Fd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),Mhh2(i1)),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFdFdhhL(gO1,i2,i1)
coupR1 = cplcUFdFdhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFdhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFdhhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VG, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVGL(gO1,i2)
coupR1 = cplcUFdFdVGR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVGL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVGR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigS = SigS +4._dp/3._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVPL(gO1,i2)
coupR1 = cplcUFdFdVPR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVPL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZL(gO1,i2)
coupR1 = cplcUFdFdVZR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZR, Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFdVZRL(gO1,i2)
coupR1 = cplcUFdFdVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFdFdVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFdFdVZRR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! Hpm, Fu 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),MHpm2(i1)),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFdFuHpmL(gO1,i2,i1)
coupR1 = cplcUFdFuHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFdFuHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFdFuHpmR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWLmL(gO1,i2)
coupR1 = cplcUFdFuVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWLmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VWRm, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFdFuVWRmL(gO1,i2)
coupR1 = cplcUFdFuVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFdFuVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFdFuVWRmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFd 
 
Subroutine OneLoopFu(YQ1,YQ2,vd,vu,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,             & 
& MVWLm,MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,      & 
& cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,         & 
& cplcUFuFdcVWRmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,      & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,delta,              & 
& MFu_1L,MFu2_1L,ZUL_1L,ZUR_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(3),MAh2(3),MHpm(3),MHpm2(3),MFd(3),MFd2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: vd,vu

Complex(dp), Intent(in) :: YQ1(3,3),YQ2(3,3)

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,3),cplcUFuFuAhR(3,3,3),cplcUFuFdcHpmL(3,3,3),cplcUFuFdcHpmR(3,3,3),  & 
& cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),   & 
& cplcUFuFuhhL(3,3,3),cplcUFuFuhhR(3,3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFu_1L(3),MFu2_1L(3) 
 Complex(dp), Intent(out) :: ZUL_1L(3,3), ZUR_1L(3,3) 
 
 Real(dp) :: MFu_t(3),MFu2_t(3) 
 Complex(dp) :: ZUL_t(3,3), ZUR_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZUL2(3,3), ZUR2(3,3) 
 
 Real(dp) :: ZUL1(3,3), ZUR1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFu'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vd*Conjg(YQ1(1,1)))/sqrt(2._dp)
mat1a(1,1) = mat1a(1,1)+(vu*Conjg(YQ2(1,1)))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vd*Conjg(YQ1(1,2)))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(vu*Conjg(YQ2(1,2)))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vd*Conjg(YQ1(1,3)))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(vu*Conjg(YQ2(1,3)))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vd*Conjg(YQ1(2,1)))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(vu*Conjg(YQ2(2,1)))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vd*Conjg(YQ1(2,2)))/sqrt(2._dp)
mat1a(2,2) = mat1a(2,2)+(vu*Conjg(YQ2(2,2)))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vd*Conjg(YQ1(2,3)))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(vu*Conjg(YQ2(2,3)))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vd*Conjg(YQ1(3,1)))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(vu*Conjg(YQ2(3,1)))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vd*Conjg(YQ1(3,2)))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(vu*Conjg(YQ2(3,2)))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vd*Conjg(YQ1(3,3)))/sqrt(2._dp)
mat1a(3,3) = mat1a(3,3)+(vu*Conjg(YQ2(3,3)))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2(il) 
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL,    & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFu2_t(iL)
Call Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,cplcUFuFdcHpmL,    & 
& cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,cplcUFuFdcVWRmR,        & 
& cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,cplcUFuFuVPR,         & 
& cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUR1,ierr,test) 
ZUR2 = ZUR1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUR2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFu2_1L(il) = MFu2_t(il) 
MFu_1L(il) = Sqrt(MFu2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFu2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFu2_1L(il))
End If 
If (Abs(MFu2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFu2_t,ZUL1,ierr,test) 
 
 
ZUL2 = ZUL1 
Else 
Call EigenSystem(mat2,MFu2_t,ZUL2,ierr,test) 
 
 
End If 
ZUL2 = Conjg(ZUL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZUL2),mat1),Transpose( Conjg(ZUR2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZUR2(i1,:) = phaseM *ZUR2(i1,:) 
 End if 
End Do 
 
ZUL_1L = ZUL2 
 ZUR_1L = ZUR2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFu
 
 
Subroutine Sigma1LoopFu(p2,MFu,MFu2,MAh,MAh2,MHpm,MHpm2,MFd,MFd2,MVWLm,               & 
& MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplcUFuFuAhL,cplcUFuFuAhR,            & 
& cplcUFuFdcHpmL,cplcUFuFdcHpmR,cplcUFuFdcVWLmL,cplcUFuFdcVWLmR,cplcUFuFdcVWRmL,         & 
& cplcUFuFdcVWRmR,cplcUFuFuhhL,cplcUFuFuhhR,cplcUFuFuVGL,cplcUFuFuVGR,cplcUFuFuVPL,      & 
& cplcUFuFuVPR,cplcUFuFuVZL,cplcUFuFuVZR,cplcUFuFuVZRL,cplcUFuFuVZRR,sigL,               & 
& sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFu(3),MFu2(3),MAh(3),MAh2(3),MHpm(3),MHpm2(3),MFd(3),MFd2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplcUFuFuAhL(3,3,3),cplcUFuFuAhR(3,3,3),cplcUFuFdcHpmL(3,3,3),cplcUFuFdcHpmR(3,3,3),  & 
& cplcUFuFdcVWLmL(3,3),cplcUFuFdcVWLmR(3,3),cplcUFuFdcVWRmL(3,3),cplcUFuFdcVWRmR(3,3),   & 
& cplcUFuFuhhL(3,3,3),cplcUFuFuhhR(3,3,3),cplcUFuFuVGL(3,3),cplcUFuFuVGR(3,3),           & 
& cplcUFuFuVPL(3,3),cplcUFuFuVPR(3,3),cplcUFuFuVZL(3,3),cplcUFuFuVZR(3,3),               & 
& cplcUFuFuVZRL(3,3),cplcUFuFuVZRR(3,3)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fu, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i1),MAh2(i2)),dp) 
B0m2 = MFu(i1)*Real(B0(p2,MFu2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFuFuAhL(gO1,i1,i2)
coupR1 = cplcUFuFuAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFuFuAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFuFuAhR(gO2,i1,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! conj[Hpm], Fd 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFd2(i2),MHpm2(i1)),dp) 
B0m2 = MFd(i2)*Real(B0(p2,MFd2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFuFdcHpmL(gO1,i2,i1)
coupR1 = cplcUFuFdcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFdcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFdcHpmR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWLmL(gO1,i2)
coupR1 = cplcUFuFdcVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWLmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[VWRm], Fd 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFd2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFd(i2)*Real(B0(p2,MFd2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFdcVWRmL(gO1,i2)
coupR1 = cplcUFuFdcVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFuFdcVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFuFdcVWRmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! hh, Fu 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFu2(i2),Mhh2(i1)),dp) 
B0m2 = MFu(i2)*Real(B0(p2,MFu2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFuFuhhL(gO1,i2,i1)
coupR1 = cplcUFuFuhhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFuFuhhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFuFuhhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VG, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVGL(gO1,i2)
coupR1 = cplcUFuFuVGR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVGL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVGR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +4._dp/3._dp* sumL
SigR = SigR +4._dp/3._dp* sumR 
SigS = SigS +4._dp/3._dp* sumS 
    End Do 
 !------------------------ 
! VP, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVPL(gO1,i2)
coupR1 = cplcUFuFuVPR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVPL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZL(gO1,i2)
coupR1 = cplcUFuFuVZR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZR, Fu 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFu2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFu(i2)*Real(B0(p2,MFu2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFuFuVZRL(gO1,i2)
coupR1 = cplcUFuFuVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFuFuVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFuFuVZRR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFu 
 
Subroutine OneLoopFe(YL1,YL2,vd,vu,MFe,MFe2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,            & 
& Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& cplcUFeFeAhL,cplcUFeFeAhR,cplcUFecFedeltaRppL,cplcUFecFedeltaRppR,cplcUFeFehhL,        & 
& cplcUFeFehhR,cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,        & 
& cplcUFeFeVZRR,cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvcVWLmL,cplcUFeFvcVWLmR,           & 
& cplcUFeFvcVWRmL,cplcUFeFvcVWRmR,delta,MFe_1L,MFe2_1L,ZEL_1L,ZER_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,Mhh(3),Mhh2(3),MVZ,MVZ2,           & 
& MVZR,MVZR2,MHpm(3),MHpm2(3),MFv(6),MFv2(6),MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: vd,vu

Complex(dp), Intent(in) :: YL1(3,3),YL2(3,3)

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,3),cplcUFeFeAhR(3,3,3),cplcUFecFedeltaRppL(3,3),cplcUFecFedeltaRppR(3,3),& 
& cplcUFeFehhL(3,3,3),cplcUFeFehhR(3,3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),             & 
& cplcUFeFvcHpmL(3,6,3),cplcUFeFvcHpmR(3,6,3),cplcUFeFvcVWLmL(3,6),cplcUFeFvcVWLmR(3,6), & 
& cplcUFeFvcVWRmL(3,6),cplcUFeFvcVWRmR(3,6)

Complex(dp) :: mat1a(3,3), mat1(3,3) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(3), test_m2(3), p2 
Real(dp), Intent(out) :: MFe_1L(3),MFe2_1L(3) 
 Complex(dp), Intent(out) :: ZEL_1L(3,3), ZER_1L(3,3) 
 
 Real(dp) :: MFe_t(3),MFe2_t(3) 
 Complex(dp) :: ZEL_t(3,3), ZER_t(3,3), sigL(3,3), sigR(3,3), sigS(3,3) 
 
 Complex(dp) :: mat(3,3)=0._dp, mat2(3,3)=0._dp, phaseM 

Complex(dp) :: ZEL2(3,3), ZER2(3,3) 
 
 Real(dp) :: ZEL1(3,3), ZER1(3,3), test(2) 
 
 Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFe'
 
mat1a(1,1) = 0._dp 
mat1a(1,1) = mat1a(1,1)+(vu*YL1(1,1))/sqrt(2._dp)
mat1a(1,1) = mat1a(1,1)+(vd*YL2(1,1))/sqrt(2._dp)
mat1a(1,2) = 0._dp 
mat1a(1,2) = mat1a(1,2)+(vu*YL1(1,2))/sqrt(2._dp)
mat1a(1,2) = mat1a(1,2)+(vd*YL2(1,2))/sqrt(2._dp)
mat1a(1,3) = 0._dp 
mat1a(1,3) = mat1a(1,3)+(vu*YL1(1,3))/sqrt(2._dp)
mat1a(1,3) = mat1a(1,3)+(vd*YL2(1,3))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,1) = mat1a(2,1)+(vu*YL1(2,1))/sqrt(2._dp)
mat1a(2,1) = mat1a(2,1)+(vd*YL2(2,1))/sqrt(2._dp)
mat1a(2,2) = 0._dp 
mat1a(2,2) = mat1a(2,2)+(vu*YL1(2,2))/sqrt(2._dp)
mat1a(2,2) = mat1a(2,2)+(vd*YL2(2,2))/sqrt(2._dp)
mat1a(2,3) = 0._dp 
mat1a(2,3) = mat1a(2,3)+(vu*YL1(2,3))/sqrt(2._dp)
mat1a(2,3) = mat1a(2,3)+(vd*YL2(2,3))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,1) = mat1a(3,1)+(vu*YL1(3,1))/sqrt(2._dp)
mat1a(3,1) = mat1a(3,1)+(vd*YL2(3,1))/sqrt(2._dp)
mat1a(3,2) = 0._dp 
mat1a(3,2) = mat1a(3,2)+(vu*YL1(3,2))/sqrt(2._dp)
mat1a(3,2) = mat1a(3,2)+(vd*YL2(3,2))/sqrt(2._dp)
mat1a(3,3) = 0._dp 
mat1a(3,3) = mat1a(3,3)+(vu*YL1(3,3))/sqrt(2._dp)
mat1a(3,3) = mat1a(3,3)+(vd*YL2(3,3))/sqrt(2._dp)

 
 Do il=3,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2(il) 
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,Mhh,Mhh2,MVZ,             & 
& MVZ2,MVZR,MVZR2,MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,            & 
& cplcUFeFeAhR,cplcUFecFedeltaRppL,cplcUFecFedeltaRppR,cplcUFeFehhL,cplcUFeFehhR,        & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,cplcUFeFeVZRR,       & 
& cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvcVWLmL,cplcUFeFvcVWLmR,cplcUFeFvcVWRmL,         & 
& cplcUFeFvcVWRmR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFe2_t(iL)
Call Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,Mhh,Mhh2,MVZ,             & 
& MVZ2,MVZR,MVZR2,MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,            & 
& cplcUFeFeAhR,cplcUFecFedeltaRppL,cplcUFecFedeltaRppR,cplcUFeFehhL,cplcUFeFehhR,        & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,cplcUFeFeVZRR,       & 
& cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvcVWLmL,cplcUFeFvcVWLmR,cplcUFeFvcVWRmL,         & 
& cplcUFeFvcVWRmR,sigL,sigR,sigS)

mat1 = mat1a - SigS - MatMul(SigR,mat1a) - MatMul(mat1a,SigL) 
 
mat2 = Matmul(Transpose(Conjg(mat1)),mat1) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZER1,ierr,test) 
ZER2 = ZER1 
Else 
Call EigenSystem(mat2,MFe2_t,ZER2,ierr,test) 
 End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
MFe2_1L(il) = MFe2_t(il) 
MFe_1L(il) = Sqrt(MFe2_1L(il)) 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFe2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFe2_1L(il))
End If 
If (Abs(MFe2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
mat2 = Matmul(mat1,Transpose(Conjg(mat1))) 
If (ForceRealMatrices) mat2 = Real(mat2,dp) 
If (Maxval(Abs(Aimag(mat2))).Eq.0._dp) Then 
Call EigenSystem(Real(mat2,dp),MFe2_t,ZEL1,ierr,test) 
 
 
ZEL2 = ZEL1 
Else 
Call EigenSystem(mat2,MFe2_t,ZEL2,ierr,test) 
 
 
End If 
ZEL2 = Conjg(ZEL2) 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
mat2 = Matmul(Matmul( Conjg(ZEL2),mat1),Transpose( Conjg(ZER2))) 
Do i1=1,3
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
phaseM = mat2(i1,i1) / Abs(mat2(i1,i1)) 
ZER2(i1,:) = phaseM *ZER2(i1,:) 
 End if 
End Do 
 
ZEL_1L = ZEL2 
 ZER_1L = ZER2 
 End Do  
 
Iname = Iname -1 
End Subroutine OneLoopFe
 
 
Subroutine Sigma1LoopFe(p2,MFe,MFe2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,Mhh,Mhh2,           & 
& MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MFv,MFv2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplcUFeFeAhL,        & 
& cplcUFeFeAhR,cplcUFecFedeltaRppL,cplcUFecFedeltaRppR,cplcUFeFehhL,cplcUFeFehhR,        & 
& cplcUFeFeVPL,cplcUFeFeVPR,cplcUFeFeVZL,cplcUFeFeVZR,cplcUFeFeVZRL,cplcUFeFeVZRR,       & 
& cplcUFeFvcHpmL,cplcUFeFvcHpmR,cplcUFeFvcVWLmL,cplcUFeFvcVWLmR,cplcUFeFvcVWRmL,         & 
& cplcUFeFvcVWRmR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFe(3),MFe2(3),MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,Mhh(3),Mhh2(3),MVZ,MVZ2,           & 
& MVZR,MVZR2,MHpm(3),MHpm2(3),MFv(6),MFv2(6),MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplcUFeFeAhL(3,3,3),cplcUFeFeAhR(3,3,3),cplcUFecFedeltaRppL(3,3),cplcUFecFedeltaRppR(3,3),& 
& cplcUFeFehhL(3,3,3),cplcUFeFehhR(3,3,3),cplcUFeFeVPL(3,3),cplcUFeFeVPR(3,3),           & 
& cplcUFeFeVZL(3,3),cplcUFeFeVZR(3,3),cplcUFeFeVZRL(3,3),cplcUFeFeVZRR(3,3),             & 
& cplcUFeFvcHpmL(3,6,3),cplcUFeFvcHpmR(3,6,3),cplcUFeFvcVWLmL(3,6),cplcUFeFvcVWLmR(3,6), & 
& cplcUFeFvcVWRmL(3,6),cplcUFeFvcVWRmR(3,6)

Complex(dp), Intent(out) :: SigL(3,3),SigR(3,3), SigS(3,3) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(3,3), sumR(3,3), sumS(3,3) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fe, Ah 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i1),MAh2(i2)),dp) 
B0m2 = MFe(i1)*Real(B0(p2,MFe2(i1),MAh2(i2)),dp) 
coupL1 = cplcUFeFeAhL(gO1,i1,i2)
coupR1 = cplcUFeFeAhR(gO1,i1,i2)
coupL2 =  Conjg(cplcUFeFeAhL(gO2,i1,i2))
coupR2 =  Conjg(cplcUFeFeAhR(gO2,i1,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], deltaRpp 
!------------------------ 
    Do i1 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i1),MdeltaRpp2),dp) 
B0m2 = MFe(i1)*Real(B0(p2,MFe2(i1),MdeltaRpp2),dp) 
coupL1 = cplcUFecFedeltaRppL(gO1,i1)
coupR1 = cplcUFecFedeltaRppR(gO1,i1)
coupL2 =  Conjg(cplcUFecFedeltaRppL(gO2,i1))
coupR2 =  Conjg(cplcUFecFedeltaRppR(gO2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
 !------------------------ 
! hh, Fe 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFe2(i2),Mhh2(i1)),dp) 
B0m2 = MFe(i2)*Real(B0(p2,MFe2(i2),Mhh2(i1)),dp) 
coupL1 = cplcUFeFehhL(gO1,i2,i1)
coupR1 = cplcUFeFehhR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFehhL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFehhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VP, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),0._dp)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),0._dp)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVPL(gO1,i2)
coupR1 = cplcUFeFeVPR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVPL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),MVZ2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),MVZ2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZL(gO1,i2)
coupR1 = cplcUFeFeVZR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VZR, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFe2(i2),MVZR2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFe(i2)*Real(B0(p2,MFe2(i2),MVZR2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFeVZRL(gO1,i2)
coupR1 = cplcUFeFeVZRR(gO1,i2)
coupL2 =  Conjg(cplcUFeFeVZRL(gO2,i2))
coupR2 =  Conjg(cplcUFeFeVZRR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[Hpm], Fv 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = -0.5_dp*Real(B1(p2,MFv2(i2),MHpm2(i1)),dp) 
B0m2 = MFv(i2)*Real(B0(p2,MFv2(i2),MHpm2(i1)),dp) 
coupL1 = cplcUFeFvcHpmL(gO1,i2,i1)
coupR1 = cplcUFeFvcHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplcUFeFvcHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplcUFeFvcHpmR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFv2(i2),MVWLm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(B0(p2,MFv2(i2),MVWLm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvcVWLmL(gO1,i2)
coupR1 = cplcUFeFvcVWLmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcVWLmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcVWLmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! conj[VWRm], Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 3
  Do gO2 = 1, 3
B1m2 = - Real(B1(p2,MFv2(i2),MVWRm2)+ 0.5_dp*rMS,dp) 
B0m2 = -4._dp*MFv(i2)*Real(B0(p2,MFv2(i2),MVWRm2)-0.5_dp*rMS,dp) 
coupL1 = cplcUFeFvcVWRmL(gO1,i2)
coupR1 = cplcUFeFvcVWRmR(gO1,i2)
coupL2 =  Conjg(cplcUFeFvcVWRmL(gO2,i2))
coupR2 =  Conjg(cplcUFeFvcVWRmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFe 
 
Subroutine OneLoopFv(YDR,YL1,YL2,vd,vu,vR,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,               & 
& MFe,MFe2,MVWLm,MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,           & 
& cplUFvFvAhR,cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFeVWLmL,cplUFvFeVWLmR,cplUFvFeVWRmL,       & 
& cplUFvFeVWRmR,cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,             & 
& cplUFvFvVZR,cplUFvFvVZRL,cplUFvFvVZRR,delta,MFv_1L,MFv2_1L,PMNS_1L,ierr)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(3),MAh2(3),MHpm(3),MHpm2(3),MFe(3),MFe2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MVZR,MVZR2

Real(dp), Intent(in) :: vd,vu,vR

Complex(dp), Intent(in) :: YDR(3,3),YL1(3,3),YL2(3,3)

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,3),cplUFvFvAhR(6,6,3),cplUFvFeHpmL(6,3,3),cplUFvFeHpmR(6,3,3),        & 
& cplUFvFeVWLmL(6,3),cplUFvFeVWLmR(6,3),cplUFvFeVWRmL(6,3),cplUFvFeVWRmR(6,3),           & 
& cplUFvFvhhL(6,6,3),cplUFvFvhhR(6,6,3),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZRL(6,6),cplUFvFvVZRR(6,6)

Complex(dp) :: mat1a(6,6), mat1(6,6), mat2(6,6) 
Integer , Intent(inout):: ierr 
Integer :: i1,i2,i3,i4,j1, j2,j3,j4,il,i_count 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi2(6), test_m2(6),p2 
Real(dp), Intent(out) :: MFv_1L(6),MFv2_1L(6) 
Complex(dp), Intent(out) ::  PMNS_1L(6,6) 
Real(dp) :: MFv_t(6),MFv2_t(6) 
Complex(dp) ::  PMNS_t(6,6) 
Complex(dp) ::  phaseM, E6(6), sigL(6,6), sigR(6,6), sigS(6,6) 
Real(dp) :: PMNSa(6,6), test(2), eig(6) 

Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopMFv'
 
mat1a(1,1) = 0._dp 
mat1a(1,2) = 0._dp 
mat1a(1,3) = 0._dp 
mat1a(1,4) = 0._dp 
mat1a(1,4) = mat1a(1,4)+(vd*YL1(1,1))/sqrt(2._dp)
mat1a(1,4) = mat1a(1,4)+(vu*YL2(1,1))/sqrt(2._dp)
mat1a(1,5) = 0._dp 
mat1a(1,5) = mat1a(1,5)+(vd*YL1(1,2))/sqrt(2._dp)
mat1a(1,5) = mat1a(1,5)+(vu*YL2(1,2))/sqrt(2._dp)
mat1a(1,6) = 0._dp 
mat1a(1,6) = mat1a(1,6)+(vd*YL1(1,3))/sqrt(2._dp)
mat1a(1,6) = mat1a(1,6)+(vu*YL2(1,3))/sqrt(2._dp)
mat1a(2,1) = 0._dp 
mat1a(2,2) = 0._dp 
mat1a(2,3) = 0._dp 
mat1a(2,4) = 0._dp 
mat1a(2,4) = mat1a(2,4)+(vd*YL1(2,1))/sqrt(2._dp)
mat1a(2,4) = mat1a(2,4)+(vu*YL2(2,1))/sqrt(2._dp)
mat1a(2,5) = 0._dp 
mat1a(2,5) = mat1a(2,5)+(vd*YL1(2,2))/sqrt(2._dp)
mat1a(2,5) = mat1a(2,5)+(vu*YL2(2,2))/sqrt(2._dp)
mat1a(2,6) = 0._dp 
mat1a(2,6) = mat1a(2,6)+(vd*YL1(2,3))/sqrt(2._dp)
mat1a(2,6) = mat1a(2,6)+(vu*YL2(2,3))/sqrt(2._dp)
mat1a(3,1) = 0._dp 
mat1a(3,2) = 0._dp 
mat1a(3,3) = 0._dp 
mat1a(3,4) = 0._dp 
mat1a(3,4) = mat1a(3,4)+(vd*YL1(3,1))/sqrt(2._dp)
mat1a(3,4) = mat1a(3,4)+(vu*YL2(3,1))/sqrt(2._dp)
mat1a(3,5) = 0._dp 
mat1a(3,5) = mat1a(3,5)+(vd*YL1(3,2))/sqrt(2._dp)
mat1a(3,5) = mat1a(3,5)+(vu*YL2(3,2))/sqrt(2._dp)
mat1a(3,6) = 0._dp 
mat1a(3,6) = mat1a(3,6)+(vd*YL1(3,3))/sqrt(2._dp)
mat1a(3,6) = mat1a(3,6)+(vu*YL2(3,3))/sqrt(2._dp)
mat1a(4,1) = 0._dp 
mat1a(4,1) = mat1a(4,1)+(vd*YL1(1,1))/sqrt(2._dp)
mat1a(4,1) = mat1a(4,1)+(vu*YL2(1,1))/sqrt(2._dp)
mat1a(4,2) = 0._dp 
mat1a(4,2) = mat1a(4,2)+(vd*YL1(2,1))/sqrt(2._dp)
mat1a(4,2) = mat1a(4,2)+(vu*YL2(2,1))/sqrt(2._dp)
mat1a(4,3) = 0._dp 
mat1a(4,3) = mat1a(4,3)+(vd*YL1(3,1))/sqrt(2._dp)
mat1a(4,3) = mat1a(4,3)+(vu*YL2(3,1))/sqrt(2._dp)
mat1a(4,4) = 0._dp 
mat1a(4,4) = mat1a(4,4)+sqrt(2._dp)*vR*YDR(1,1)
mat1a(4,5) = 0._dp 
mat1a(4,5) = mat1a(4,5)+(vR*YDR(1,2))/sqrt(2._dp)
mat1a(4,5) = mat1a(4,5)+(vR*YDR(2,1))/sqrt(2._dp)
mat1a(4,6) = 0._dp 
mat1a(4,6) = mat1a(4,6)+(vR*YDR(1,3))/sqrt(2._dp)
mat1a(4,6) = mat1a(4,6)+(vR*YDR(3,1))/sqrt(2._dp)
mat1a(5,1) = 0._dp 
mat1a(5,1) = mat1a(5,1)+(vd*YL1(1,2))/sqrt(2._dp)
mat1a(5,1) = mat1a(5,1)+(vu*YL2(1,2))/sqrt(2._dp)
mat1a(5,2) = 0._dp 
mat1a(5,2) = mat1a(5,2)+(vd*YL1(2,2))/sqrt(2._dp)
mat1a(5,2) = mat1a(5,2)+(vu*YL2(2,2))/sqrt(2._dp)
mat1a(5,3) = 0._dp 
mat1a(5,3) = mat1a(5,3)+(vd*YL1(3,2))/sqrt(2._dp)
mat1a(5,3) = mat1a(5,3)+(vu*YL2(3,2))/sqrt(2._dp)
mat1a(5,4) = 0._dp 
mat1a(5,4) = mat1a(5,4)+(vR*YDR(1,2))/sqrt(2._dp)
mat1a(5,4) = mat1a(5,4)+(vR*YDR(2,1))/sqrt(2._dp)
mat1a(5,5) = 0._dp 
mat1a(5,5) = mat1a(5,5)+sqrt(2._dp)*vR*YDR(2,2)
mat1a(5,6) = 0._dp 
mat1a(5,6) = mat1a(5,6)+(vR*YDR(2,3))/sqrt(2._dp)
mat1a(5,6) = mat1a(5,6)+(vR*YDR(3,2))/sqrt(2._dp)
mat1a(6,1) = 0._dp 
mat1a(6,1) = mat1a(6,1)+(vd*YL1(1,3))/sqrt(2._dp)
mat1a(6,1) = mat1a(6,1)+(vu*YL2(1,3))/sqrt(2._dp)
mat1a(6,2) = 0._dp 
mat1a(6,2) = mat1a(6,2)+(vd*YL1(2,3))/sqrt(2._dp)
mat1a(6,2) = mat1a(6,2)+(vu*YL2(2,3))/sqrt(2._dp)
mat1a(6,3) = 0._dp 
mat1a(6,3) = mat1a(6,3)+(vd*YL1(3,3))/sqrt(2._dp)
mat1a(6,3) = mat1a(6,3)+(vu*YL2(3,3))/sqrt(2._dp)
mat1a(6,4) = 0._dp 
mat1a(6,4) = mat1a(6,4)+(vR*YDR(1,3))/sqrt(2._dp)
mat1a(6,4) = mat1a(6,4)+(vR*YDR(3,1))/sqrt(2._dp)
mat1a(6,5) = 0._dp 
mat1a(6,5) = mat1a(6,5)+(vR*YDR(2,3))/sqrt(2._dp)
mat1a(6,5) = mat1a(6,5)+(vR*YDR(3,2))/sqrt(2._dp)
mat1a(6,6) = 0._dp 
mat1a(6,6) = mat1a(6,6)+sqrt(2._dp)*vR*YDR(3,3)

 
 Do il=6,1,-1
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFv2(il)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,MFe,MFe2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpmL,        & 
& cplUFvFeHpmR,cplUFvFeVWLmL,cplUFvFeVWLmR,cplUFvFeVWRmL,cplUFvFeVWRmR,cplUFvFvhhL,      & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,              & 
& cplUFvFvVZRR,sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,PMNSa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    PMNS_1L(i1,:) = (0._dp,1._dp)*PMNSa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    PMNS_1L(i1,:) = PMNSa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = PMNS_1L(i1,:) 
      PMNS_1L(i1,:) = PMNS_1L(i2,:) 
      PMNS_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, PMNS_1L, ierr, test) 
mat2 = Matmul( Conjg(PMNS_1L), Matmul( mat1, Transpose( Conjg(PMNS_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  PMNS_1L(i1,:)= phaseM * PMNS_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
!---------------------------------------- 
! Redoing Calculation using redefined p2 
!----------------------------------------- 
 
i_count = 0 
p2_loop: Do  
i_count = i_count + 1 
sigL=0._dp 
sigR=0._dp 
sigS=0._dp 
p2 = MFv2_1L(iL)
Call Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,MFe,MFe2,MVWLm,MVWLm2,              & 
& MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,cplUFvFeHpmL,        & 
& cplUFvFeHpmR,cplUFvFeVWLmL,cplUFvFeVWLmR,cplUFvFeVWRmL,cplUFvFeVWRmR,cplUFvFvhhL,      & 
& cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,cplUFvFvVZRL,              & 
& cplUFvFvVZRR,sigL,sigR,sigS)

mat1 = mat1a - 0.5_dp*(SigS + Transpose(SigS) + & 
      & MatMul(Transpose(SigL),mat1a) + MatMul(SigR,mat1a) + & 
      & MatMul(mat1a,Transpose(SigR)) + MatMul(mat1a,SigL)) 
 
If (ForceRealMatrices) mat1 = Real(mat1,dp) 
If (Maxval(Abs(Aimag(mat1))).Eq.0._dp) Then 
Call EigenSystem(Real(mat1,dp),Eig,PMNSa,ierr,test) 
 
   Do i1=1,6
   If (Eig(i1).Lt.0._dp) Then 
    MFv_t(i1) = - Eig(i1) 
    PMNS_1L(i1,:) = (0._dp,1._dp)*PMNSa(i1,:) 
   Else 
    MFv_t(i1) = Eig(i1) 
    PMNS_1L(i1,:) = PMNSa(i1,:)
    End If 
   End Do 
 
Do i1=1,5
  Do i2=i1+1,6
    If (Abs(MFv_t(i1)).Gt.Abs(MFv_t(i2))) Then 
      Eig(1) = MFv_t(i1) 
      MFv_t(i1) = MFv_t(i2) 
      MFv_t(i2) = Eig(1) 
      E6 = PMNS_1L(i1,:) 
      PMNS_1L(i1,:) = PMNS_1L(i2,:) 
      PMNS_1L(i2,:) = E6
    End If 
   End Do 
End Do 
 
MFv_1L(iL) = MFv_t(iL) 
MFv2_1L(iL) = MFv_t(iL)**2 
Else 
 
mat2 = Matmul( Transpose(Conjg( mat1) ), mat1 ) 
Call Eigensystem(mat2, Eig, PMNS_1L, ierr, test) 
mat2 = Matmul( Conjg(PMNS_1L), Matmul( mat1, Transpose( Conjg(PMNS_1L)))) 
Do i1=1,6
If (Abs(mat2(i1,i1)).gt.0._dp) Then 
  phaseM = Sqrt( mat2(i1,i1) / Abs(mat2(i1,i1))) 
  PMNS_1L(i1,:)= phaseM * PMNS_1L(i1,:) 
End if 
  If (Eig(i1).Le.0._dp) Then 
    If (ErrorLevel.Ge.0) Then 
      Write(10,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(10,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Write(*,*) 'Warning from Subroutine '//NameOfUnit(Iname) 
      Write(*,*) 'a mass squarred is negative: ',i1,Eig(i1) 
      Call TerminateProgram 
    End If 
     Write(ErrCan,*) 'Warning from routine '//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
     Write(ErrCan,*) i1,Eig(i1) 
  Eig(i1) = 1._dp 
   SignOfMassChanged = .True. 
 End if 
End Do 
MFv_1L = Sqrt( Eig ) 
 
MFv2_1L = Eig 
 
End If 
 
If ((ierr.Eq.-8).Or.(ierr.Eq.-9)) Then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Write(*,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  If (ErrorLevel.Eq.2) Call TerminateProgram 
  ierr = 0 
End If 
 
If (p2.Ne.0._dp) Then 
  test(1) = Abs(MFv2_1L(il)-p2)/p2
Else 
  test(2) = Abs(MFv2_1L(il))
End If 
If (Abs(MFv2_1L(il)).lt.1.0E-30_dp) Exit p2_loop 
If (test(1).lt.0.1_dp*delta) Exit p2_loop 
If(i_count.gt.30) then 
  Write(ErrCan,*) "Possible numerical problem in "//NameOfUnit(Iname) 
  Exit p2_loop 
End if
End Do p2_loop 
End Do 
 
Iname = Iname -1 
End Subroutine OneLoopFv
 
 
Subroutine Sigma1LoopFv(p2,MFv,MFv2,MAh,MAh2,MHpm,MHpm2,MFe,MFe2,MVWLm,               & 
& MVWLm2,MVWRm,MVWRm2,Mhh,Mhh2,MVZ,MVZ2,MVZR,MVZR2,cplUFvFvAhL,cplUFvFvAhR,              & 
& cplUFvFeHpmL,cplUFvFeHpmR,cplUFvFeVWLmL,cplUFvFeVWLmR,cplUFvFeVWRmL,cplUFvFeVWRmR,     & 
& cplUFvFvhhL,cplUFvFvhhR,cplUFvFvVPL,cplUFvFvVPR,cplUFvFvVZL,cplUFvFvVZR,               & 
& cplUFvFvVZRL,cplUFvFvVZRR,sigL,sigR,sigS)

Implicit None 
Real(dp), Intent(in) :: MFv(6),MFv2(6),MAh(3),MAh2(3),MHpm(3),MHpm2(3),MFe(3),MFe2(3),MVWLm,MVWLm2,           & 
& MVWRm,MVWRm2,Mhh(3),Mhh2(3),MVZ,MVZ2,MVZR,MVZR2

Complex(dp), Intent(in) :: cplUFvFvAhL(6,6,3),cplUFvFvAhR(6,6,3),cplUFvFeHpmL(6,3,3),cplUFvFeHpmR(6,3,3),        & 
& cplUFvFeVWLmL(6,3),cplUFvFeVWLmR(6,3),cplUFvFeVWRmL(6,3),cplUFvFeVWRmR(6,3),           & 
& cplUFvFvhhL(6,6,3),cplUFvFvhhR(6,6,3),cplUFvFvVPL(6,6),cplUFvFvVPR(6,6),               & 
& cplUFvFvVZL(6,6),cplUFvFvVZR(6,6),cplUFvFvVZRL(6,6),cplUFvFvVZRR(6,6)

Complex(dp), Intent(out) :: SigL(6,6),SigR(6,6), SigS(6,6) 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumL(6,6), sumR(6,6), sumS(6,6) 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
SigL = Cmplx(0._dp,0._dp,dp) 
SigR = Cmplx(0._dp,0._dp,dp) 
SigS = Cmplx(0._dp,0._dp,dp) 
 
!------------------------ 
! Fv, Ah 
!------------------------ 
    Do i1 = 1, 6
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -1._dp*B1(p2,MFv2(i1),MAh2(i2)) 
B0m2 = 2._dp*MFv(i1)*B0(p2,MFv2(i1),MAh2(i2)) 
coupL1 = cplUFvFvAhL(gO1,i1,i2)
coupR1 = cplUFvFvAhR(gO1,i1,i2)
coupL2 =  Conjg(cplUFvFvAhL(gO2,i1,i2))
coupR2 =  Conjg(cplUFvFvAhR(gO2,i1,i2))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! Hpm, Fe 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -1._dp*B1(p2,MFe2(i2),MHpm2(i1)) 
B0m2 = 2._dp*MFe(i2)*B0(p2,MFe2(i2),MHpm2(i1)) 
coupL1 = cplUFvFeHpmL(gO1,i2,i1)
coupR1 = cplUFvFeHpmR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFeHpmL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFeHpmR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VWLm, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFe2(i2),MVWLm2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(B0(p2,MFe2(i2),MVWLm2) - 0.5_dp*rMS) 
coupL1 = cplUFvFeVWLmL(gO1,i2)
coupR1 = cplUFvFeVWLmR(gO1,i2)
coupL2 =  Conjg(cplUFvFeVWLmL(gO2,i2))
coupR2 =  Conjg(cplUFvFeVWLmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! VWRm, Fe 
!------------------------ 
      Do i2 = 1, 3
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFe2(i2),MVWRm2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFe(i2)*(B0(p2,MFe2(i2),MVWRm2) - 0.5_dp*rMS) 
coupL1 = cplUFvFeVWRmL(gO1,i2)
coupR1 = cplUFvFeVWRmR(gO1,i2)
coupL2 =  Conjg(cplUFvFeVWRmL(gO2,i2))
coupR2 =  Conjg(cplUFvFeVWRmR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp* sumL
SigR = SigR +1._dp* sumR 
SigS = SigS +1._dp* sumS 
    End Do 
 !------------------------ 
! hh, Fv 
!------------------------ 
    Do i1 = 1, 3
       Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -1._dp*B1(p2,MFv2(i2),Mhh2(i1)) 
B0m2 = 2._dp*MFv(i2)*B0(p2,MFv2(i2),Mhh2(i1)) 
coupL1 = cplUFvFvhhL(gO1,i2,i1)
coupR1 = cplUFvFvhhR(gO1,i2,i1)
coupL2 =  Conjg(cplUFvFvhhL(gO2,i2,i1))
coupR2 =  Conjg(cplUFvFvhhR(gO2,i2,i1))
SumS(gO1,gO2) = coupR1*coupL2*B0m2 
sumR(gO1,gO2) = coupR1*coupR2*B1m2 
sumL(gO1,gO2) = coupL1*coupL2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
      End Do 
     End Do 
 !------------------------ 
! VP, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFv2(i2),0._dp) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(B0(p2,MFv2(i2),0._dp) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVPL(gO1,i2)
coupR1 = cplUFvFvVPR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVPL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVPR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 !------------------------ 
! VZ, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFv2(i2),MVZ2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(B0(p2,MFv2(i2),MVZ2) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZL(gO1,i2)
coupR1 = cplUFvFvVZR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 !------------------------ 
! VZR, Fv 
!------------------------ 
      Do i2 = 1, 6
 SumS = 0._dp 
sumR = 0._dp 
sumL = 0._dp 
Do gO1 = 1, 6
  Do gO2 = 1, 6
B1m2 = -2._dp*(B1(p2,MFv2(i2),MVZR2) + 0.5_dp*rMS) 
B0m2 = -8._dp*MFv(i2)*(B0(p2,MFv2(i2),MVZR2) - 0.5_dp*rMS) 
coupL1 = cplUFvFvVZRL(gO1,i2)
coupR1 = cplUFvFvVZRR(gO1,i2)
coupL2 =  Conjg(cplUFvFvVZRL(gO2,i2))
coupR2 =  Conjg(cplUFvFvVZRR(gO2,i2))
SumS(gO1,gO2) = coupL1*coupR2*B0m2 
sumR(gO1,gO2) = coupL1*coupL2*B1m2 
sumL(gO1,gO2) = coupR1*coupR2*B1m2 
   End Do 
End Do 
SigL = SigL +1._dp/2._dp* sumL
SigR = SigR +1._dp/2._dp* sumR 
SigS = SigS +1._dp/2._dp* sumS 
    End Do 
 

SigL = oo16pi2*SigL 
 
SigR = oo16pi2*SigR 
 
SigS = oo16pi2*SigS 
 
End Subroutine Sigma1LoopFv 
 
Subroutine OneLoopdeltaRpp(mu32,RHO2,RHO1,ALP1,ALP3,ALP2,vd,vu,vR,Mhh,Mhh2,           & 
& MdeltaRpp,MdeltaRpp2,MVZ,MVZ2,MVZR,MVZR2,MFe,MFe2,MHpm,MHpm2,MVWLm,MVWLm2,             & 
& MVWRm,MVWRm2,MAh,MAh2,cpldeltaRpphhcdeltaRpp,cpldeltaRppcdeltaRppVP,cpldeltaRppcdeltaRppVZ,& 
& cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL,cplFeFecdeltaRppR,cplcgWLmgWLpcdeltaRpp,     & 
& cplcgWLpgWLmdeltaRpp,cplcgWRmgWLpcdeltaRpp,cplcgWLpgWRmdeltaRpp,cplcgWLmgWRpcdeltaRpp, & 
& cplcgWRpgWLmdeltaRpp,cplcgWRmgWRpcdeltaRpp,cplcgWRpgWRmdeltaRpp,cplcdeltaRppcHpmcHpm,  & 
& cplcdeltaRppcHpmcVWLm,cplcdeltaRppcHpmcVWRm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,& 
& cplcdeltaRppcVWRmcVWRm,cplAhAhdeltaRppcdeltaRpp,cpldeltaRppdeltaRppcdeltaRppcdeltaRpp, & 
& cpldeltaRpphhhhcdeltaRpp,cpldeltaRppHpmcdeltaRppcHpm,cpldeltaRppcdeltaRppVPVP,         & 
& cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,cpldeltaRppcdeltaRppVZVZ,  & 
& cpldeltaRppcdeltaRppVZRVZR,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MdeltaRpp,MdeltaRpp2,MVZ,MVZ2,MVZR,MVZR2,MFe(3),MFe2(3),               & 
& MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MAh(3),MAh2(3)

Real(dp), Intent(in) :: mu32,RHO2,RHO1,ALP1,ALP3,ALP2,vd,vu,vR

Complex(dp), Intent(in) :: cpldeltaRpphhcdeltaRpp(3),cpldeltaRppcdeltaRppVP,cpldeltaRppcdeltaRppVZ,              & 
& cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL(3,3),cplFeFecdeltaRppR(3,3),cplcgWLmgWLpcdeltaRpp,& 
& cplcgWLpgWLmdeltaRpp,cplcgWRmgWLpcdeltaRpp,cplcgWLpgWRmdeltaRpp,cplcgWLmgWRpcdeltaRpp, & 
& cplcgWRpgWLmdeltaRpp,cplcgWRmgWRpcdeltaRpp,cplcgWRpgWRmdeltaRpp,cplcdeltaRppcHpmcHpm(3,3),& 
& cplcdeltaRppcHpmcVWLm(3),cplcdeltaRppcHpmcVWRm(3),cplcdeltaRppcVWLmcVWLm,              & 
& cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhdeltaRppcdeltaRpp(3,3),           & 
& cpldeltaRppdeltaRppcdeltaRppcdeltaRpp,cpldeltaRpphhhhcdeltaRpp(3,3),cpldeltaRppHpmcdeltaRppcHpm(3,3),& 
& cpldeltaRppcdeltaRppVPVP,cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppVZVZ,cpldeltaRppcdeltaRppVZRVZR

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopdeltaRpp'
 
mi2 = (-2._dp*(mu32) + ALP3*vd**2 - 4*ALP2*vd*vu + ALP1*(vd**2 + vu**2) + 2*RHO1*vR**2 + 4*RHO2*vR**2)/2._dp 

 
p2 = MdeltaRpp2
PiSf = ZeroC 
Call Pi1LoopdeltaRpp(p2,Mhh,Mhh2,MdeltaRpp,MdeltaRpp2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MFe,MFe2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MAh,MAh2,cpldeltaRpphhcdeltaRpp,         & 
& cpldeltaRppcdeltaRppVP,cpldeltaRppcdeltaRppVZ,cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL,& 
& cplFeFecdeltaRppR,cplcgWLmgWLpcdeltaRpp,cplcgWLpgWLmdeltaRpp,cplcgWRmgWLpcdeltaRpp,    & 
& cplcgWLpgWRmdeltaRpp,cplcgWLmgWRpcdeltaRpp,cplcgWRpgWLmdeltaRpp,cplcgWRmgWRpcdeltaRpp, & 
& cplcgWRpgWRmdeltaRpp,cplcdeltaRppcHpmcHpm,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcHpmcVWRm, & 
& cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhdeltaRppcdeltaRpp,& 
& cpldeltaRppdeltaRppcdeltaRppcdeltaRpp,cpldeltaRpphhhhcdeltaRpp,cpldeltaRppHpmcdeltaRppcHpm,& 
& cpldeltaRppcdeltaRppVPVP,cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppVZVZ,cpldeltaRppcdeltaRppVZRVZR,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopdeltaRpp(p2,Mhh,Mhh2,MdeltaRpp,MdeltaRpp2,MVZ,MVZ2,MVZR,MVZR2,            & 
& MFe,MFe2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MAh,MAh2,cpldeltaRpphhcdeltaRpp,         & 
& cpldeltaRppcdeltaRppVP,cpldeltaRppcdeltaRppVZ,cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL,& 
& cplFeFecdeltaRppR,cplcgWLmgWLpcdeltaRpp,cplcgWLpgWLmdeltaRpp,cplcgWRmgWLpcdeltaRpp,    & 
& cplcgWLpgWRmdeltaRpp,cplcgWLmgWRpcdeltaRpp,cplcgWRpgWLmdeltaRpp,cplcgWRmgWRpcdeltaRpp, & 
& cplcgWRpgWRmdeltaRpp,cplcdeltaRppcHpmcHpm,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcHpmcVWRm, & 
& cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhdeltaRppcdeltaRpp,& 
& cpldeltaRppdeltaRppcdeltaRppcdeltaRpp,cpldeltaRpphhhhcdeltaRpp,cpldeltaRppHpmcdeltaRppcHpm,& 
& cpldeltaRppcdeltaRppVPVP,cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppVZVZ,cpldeltaRppcdeltaRppVZRVZR,kont,PiSf)

mass2 = mi2 - Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopdeltaRpp
 
 
Subroutine Pi1LoopdeltaRpp(p2,Mhh,Mhh2,MdeltaRpp,MdeltaRpp2,MVZ,MVZ2,MVZR,            & 
& MVZR2,MFe,MFe2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MAh,MAh2,cpldeltaRpphhcdeltaRpp,   & 
& cpldeltaRppcdeltaRppVP,cpldeltaRppcdeltaRppVZ,cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL,& 
& cplFeFecdeltaRppR,cplcgWLmgWLpcdeltaRpp,cplcgWLpgWLmdeltaRpp,cplcgWRmgWLpcdeltaRpp,    & 
& cplcgWLpgWRmdeltaRpp,cplcgWLmgWRpcdeltaRpp,cplcgWRpgWLmdeltaRpp,cplcgWRmgWRpcdeltaRpp, & 
& cplcgWRpgWRmdeltaRpp,cplcdeltaRppcHpmcHpm,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcHpmcVWRm, & 
& cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhdeltaRppcdeltaRpp,& 
& cpldeltaRppdeltaRppcdeltaRppcdeltaRpp,cpldeltaRpphhhhcdeltaRpp,cpldeltaRppHpmcdeltaRppcHpm,& 
& cpldeltaRppcdeltaRppVPVP,cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppVZVZ,cpldeltaRppcdeltaRppVZRVZR,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MdeltaRpp,MdeltaRpp2,MVZ,MVZ2,MVZR,MVZR2,MFe(3),MFe2(3),               & 
& MHpm(3),MHpm2(3),MVWLm,MVWLm2,MVWRm,MVWRm2,MAh(3),MAh2(3)

Complex(dp), Intent(in) :: cpldeltaRpphhcdeltaRpp(3),cpldeltaRppcdeltaRppVP,cpldeltaRppcdeltaRppVZ,              & 
& cpldeltaRppcdeltaRppVZR,cplFeFecdeltaRppL(3,3),cplFeFecdeltaRppR(3,3),cplcgWLmgWLpcdeltaRpp,& 
& cplcgWLpgWLmdeltaRpp,cplcgWRmgWLpcdeltaRpp,cplcgWLpgWRmdeltaRpp,cplcgWLmgWRpcdeltaRpp, & 
& cplcgWRpgWLmdeltaRpp,cplcgWRmgWRpcdeltaRpp,cplcgWRpgWRmdeltaRpp,cplcdeltaRppcHpmcHpm(3,3),& 
& cplcdeltaRppcHpmcVWLm(3),cplcdeltaRppcHpmcVWRm(3),cplcdeltaRppcVWLmcVWLm,              & 
& cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhdeltaRppcdeltaRpp(3,3),           & 
& cpldeltaRppdeltaRppcdeltaRppcdeltaRpp,cpldeltaRpphhhhcdeltaRpp(3,3),cpldeltaRppHpmcdeltaRppcHpm(3,3),& 
& cpldeltaRppcdeltaRppVPVP,cpldeltaRppcdeltaRppcVWLmVWLm,cpldeltaRppcdeltaRppcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppVZVZ,cpldeltaRppcdeltaRppVZRVZR

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2,B1m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2 
Complex(dp), Intent(inout) :: res
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2,temp, sumI 
Integer :: i1,i2,i3,i4,ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, deltaRpp 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B0m2 = B0(p2,Mhh2(i1),MdeltaRpp2) 
coup1 = cpldeltaRpphhcdeltaRpp(i1)
coup2 = Conjg(cpldeltaRpphhcdeltaRpp(i1))
    SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, deltaRpp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MdeltaRpp2,0._dp) 
coup1 = cpldeltaRppcdeltaRppVP
coup2 =  Conjg(cpldeltaRppcdeltaRppVP)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, deltaRpp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MdeltaRpp2,MVZ2) 
coup1 = cpldeltaRppcdeltaRppVZ
coup2 =  Conjg(cpldeltaRppcdeltaRppVZ)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, deltaRpp 
!------------------------ 
sumI = 0._dp 
 
F0m2 = FloopRXi(p2,MdeltaRpp2,MVZR2) 
coup1 = cpldeltaRppcdeltaRppVZR
coup2 =  Conjg(cpldeltaRppcdeltaRppVZR)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! Fe, Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 G0m2 = Gloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = -2._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplFeFecdeltaRppL(i1,i2)
coupR1 = cplFeFecdeltaRppR(i1,i2)
coupL2 =  Conjg(cplFeFecdeltaRppL(i1,i2))
coupR2 =  Conjg(cplFeFecdeltaRppR(i1,i2))
    SumI = (coupL1*coupL2+coupR1*coupR2)*G0m2 & 
                & + (coupL1*coupR2+coupR1*coupL2)*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWLm2*RXi,MVWLm2*RXi),dp) 
 coup1 = cplcgWLmgWLpcdeltaRpp
coup2 =  cplcgWLpgWLmdeltaRpp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWLm2*RXi,MVWRm2*RXi),dp) 
 coup1 = cplcgWRmgWLpcdeltaRpp
coup2 =  cplcgWLpgWRmdeltaRpp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLm], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWRm2*RXi,MVWLm2*RXi),dp) 
 coup1 = cplcgWLmgWRpcdeltaRpp
coup2 =  cplcgWRpgWLmdeltaRpp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWRmC 
!------------------------ 
sumI = 0._dp 
 
F0m2 =  -Real(B0(p2,MVWRm2*RXi,MVWRm2*RXi),dp) 
 coup1 = cplcgWRmgWRpcdeltaRpp
coup2 =  cplcgWRpgWRmdeltaRpp 
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B0m2 = B0(p2,MHpm2(i1),MHpm2(i2)) 
coup1 = cplcdeltaRppcHpmcHpm(i1,i2)
coup2 = Conjg(cplcdeltaRppcHpmcHpm(i1,i2))
    SumI = coup1*coup2*B0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWLm2) 
coup1 = cplcdeltaRppcHpmcVWLm(i2)
coup2 =  Conjg(cplcdeltaRppcHpmcVWLm(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], conj[Hpm] 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 F0m2 = FloopRXi(p2,MHpm2(i2),MVWRm2) 
coup1 = cplcdeltaRppcHpmcVWRm(i2)
coup2 =  Conjg(cplcdeltaRppcHpmcVWRm(i2))
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], conj[VWLm] 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWLm2,MVWLm2) 
coup1 = cplcdeltaRppcVWLmcVWLm
coup2 =  Conjg(cplcdeltaRppcVWLmcVWLm)
    SumI = coup1*coup2*F0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWRm], conj[VWLm] 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWLm2,MVWRm2) 
coup1 = cplcdeltaRppcVWLmcVWRm
coup2 =  Conjg(cplcdeltaRppcVWLmcVWRm)
    SumI = coup1*coup2*F0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], conj[VWRm] 
!------------------------ 
sumI = 0._dp 
 
F0m2 = SVVloop(p2,MVWRm2,MVWRm2) 
coup1 = cplcdeltaRppcVWRmcVWRm
coup2 =  Conjg(cplcdeltaRppcVWRmcVWRm)
    SumI = coup1*coup2*F0m2 
res = res +1._dp/2._dp* SumI  
!------------------------ 
! Ah, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(MAh2(i1)) 
coup1 = cplAhAhdeltaRppcdeltaRpp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[deltaRpp], deltaRpp 
!------------------------ 
sumI = 0._dp 
 
A0m2 = A0(MdeltaRpp2) 
coup1 = cpldeltaRppdeltaRppcdeltaRppcdeltaRpp
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
!------------------------ 
! hh, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(Mhh2(i1)) 
coup1 = cpldeltaRpphhhhcdeltaRpp(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 A0m2 = A0(MHpm2(i1)) 
coup1 = cpldeltaRppHpmcdeltaRppcHpm(i1,i1)
    SumI = -coup1*A0m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! VP, VP 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(0._dp) + 0.25_dp*RXi*A0(0._dp*RXi) - 0.5_dp*0._dp*rMS 
coup1 = cpldeltaRppcdeltaRppVPVP
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVWLm2) + 0.25_dp*RXi*A0(MVWLm2*RXi) - 0.5_dp*MVWLm2*rMS 
coup1 = cpldeltaRppcdeltaRppcVWLmVWLm
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVWRm2) + 0.25_dp*RXi*A0(MVWRm2*RXi) - 0.5_dp*MVWRm2*rMS 
coup1 = cpldeltaRppcdeltaRppcVWRmVWRm
    SumI = coup1*A0m2 
res = res +4._dp* SumI  
!------------------------ 
! VZ, VZ 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZ2) + 0.25_dp*RXi*A0(MVZ2*RXi) - 0.5_dp*MVZ2*rMS 
coup1 = cpldeltaRppcdeltaRppVZVZ
    SumI = coup1*A0m2 
res = res +2._dp* SumI  
!------------------------ 
! VZR, VZR 
!------------------------ 
sumI = 0._dp 
 
A0m2 =  0.75_dp*A0(MVZR2) + 0.25_dp*RXi*A0(MVZR2*RXi) - 0.5_dp*MVZR2*rMS 
coup1 = cpldeltaRppcdeltaRppVZRVZR
    SumI = coup1*A0m2 
res = res +2._dp* SumI  


res = oo16pi2*res 
 
End Subroutine Pi1LoopdeltaRpp 
 
Subroutine OneLoopVZ(gBL,g2,gR,vd,vu,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,               & 
& MdeltaRpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,               & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZ,cpldeltaRppcdeltaRppVZ,cplcFdFdVZL,          & 
& cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,     & 
& cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,            & 
& cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,              & 
& cplHpmcVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cpldeltaRppcdeltaRppVZVZ,& 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,      & 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(3),MHpm2(3),            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: gBL,g2,gR,vd,vu,vR

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cpldeltaRppcdeltaRppVZ,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),              & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,           & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ(3),cplhhVZVZ(3),cplhhVZVZR(3),cplHpmcHpmVZ(3,3),& 
& cplHpmcVWLmVZ(3),cplHpmcVWRmVZ(3),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,        & 
& cplAhAhVZVZ(3,3),cpldeltaRppcdeltaRppVZVZ,cplhhhhVZVZ(3,3),cplHpmcHpmVZVZ(3,3),        & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZ'
 
mi2 = MVZ2 

 
p2 = MVZ2
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& cplAhhhVZ,cpldeltaRppcdeltaRppVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,      & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,           & 
& cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,     & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cpldeltaRppcdeltaRppVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,        & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,            & 
& cplAhhhVZ,cpldeltaRppcdeltaRppVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,      & 
& cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,           & 
& cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ,cplhhVZVZ,       & 
& cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,     & 
& cplcVWRmVWRmVZ,cplAhAhVZVZ,cpldeltaRppcdeltaRppVZVZ,cplhhhhVZVZ,cplHpmcHpmVZVZ,        & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZ
 
 
Subroutine Pi1LoopVZ(p2,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,          & 
& MVWRm2,cplAhhhVZ,cpldeltaRppcdeltaRppVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,           & 
& cplcFeFeVZR,cplcFuFuVZL,cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplcgWLmgWLmVZ,              & 
& cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,            & 
& cplhhVPVZ,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,cplHpmcVWRmVZ,               & 
& cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,cplAhAhVZVZ,cpldeltaRppcdeltaRppVZVZ,     & 
& cplhhhhVZVZ,cplHpmcHpmVZVZ,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,      & 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(3),MHpm2(3),            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhhhVZ(3,3),cpldeltaRppcdeltaRppVZ,cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),              & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(6,6),   & 
& cplFvFvVZR(6,6),cplcgWLmgWLmVZ,cplcgWRmgWLmVZ,cplcgWLpgWLpVZ,cplcgWRpgWLpVZ,           & 
& cplcgWRmgWRmVZ,cplcgWRpgWRpVZ,cplhhVPVZ(3),cplhhVZVZ(3),cplhhVZVZR(3),cplHpmcHpmVZ(3,3),& 
& cplHpmcVWLmVZ(3),cplHpmcVWRmVZ(3),cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,        & 
& cplAhAhVZVZ(3,3),cpldeltaRppcdeltaRppVZVZ,cplhhhhVZVZ(3,3),cplHpmcHpmVZVZ(3,3),        & 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWRmVWRmVZVZ1,               & 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = VSSloop(p2,MAh2(i2),Mhh2(i1))  
coup1 = cplAhhhVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[deltaRpp], deltaRpp 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MdeltaRpp2,MdeltaRpp2)  
coup1 = cpldeltaRppcdeltaRppVZ
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdVZL(i1,i2)
coupR1 = cplcFdFdVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeVZL(i1,i2)
coupR1 = cplcFeFeVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuVZL(i1,i2)
coupR1 = cplcFuFuVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Hloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
coupL1 = cplFvFvVZL(i1,i2)
coupR1 = cplFvFvVZR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVWLm2)
coup1 = cplcgWLmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVWRm2)
coup1 = cplcgWRmgWLmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVWLm2)
coup1 = cplcgWLpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVWRm2)
coup1 = cplcgWRpgWLpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,MVWRm2)
coup1 = cplcgWRmgWRmVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,MVWRm2)
coup1 = cplcgWRpgWRpVZ
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,0._dp,Mhh2(i2)) 
coup1 = cplhhVPVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVZ2,Mhh2(i2)) 
coup1 = cplhhVZVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVZR2,Mhh2(i2)) 
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = VSSloop(p2,MHpm2(i2),MHpm2(i1))  
coup1 = cplHpmcHpmVZ(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWLm2,MHpm2(i2)) 
coup1 = cplHpmcVWLmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWRm2,MHpm2(i2)) 
coup1 = cplHpmcVWRmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(MAh2(i1))
 coup1 = cplAhAhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[deltaRpp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MdeltaRpp2)
 coup1 = cpldeltaRppcdeltaRppVZVZ
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZVZ(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWLm2) +RXi/4._dp*A0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWRm2) +RXi/4._dp*A0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZ 
 
Subroutine OneLoopVZR(gBL,g2,gR,vd,vu,vR,ZZ,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,              & 
& MdeltaRpp2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,               & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,cplAhhhVZR,cpldeltaRppcdeltaRppVZR,cplcFdFdVZRL,       & 
& cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,          & 
& cplFvFvVZRR,cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,           & 
& cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,       & 
& cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,         & 
& cplAhAhVZRVZR,cpldeltaRppcdeltaRppVZRVZR,cplhhhhVZRVZR,cplHpmcHpmVZRVZR,               & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,       & 
& cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(3),MHpm2(3),            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Real(dp), Intent(in) :: gBL,g2,gR,vd,vu,vR

Complex(dp), Intent(in) :: ZZ(3,3)

Complex(dp), Intent(in) :: cplAhhhVZR(3,3),cpldeltaRppcdeltaRppVZR,cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),          & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),               & 
& cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,     & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR(3),cplhhVZVZR(3),           & 
& cplhhVZRVZR(3),cplHpmcHpmVZR(3,3),cplHpmcVWLmVZR(3),cplHpmcVWRmVZR(3),cplcVWLmVWLmVZR, & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR(3,3),cpldeltaRppcdeltaRppVZRVZR,         & 
& cplhhhhVZRVZR(3,3),cplHpmcHpmVZRVZR(3,3),cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,      & 
& cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVZR'
 
mi2 = MVZR2 

 
p2 = MVZR2
PiSf = ZeroC 
Call Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,              & 
& MVWRm2,cplAhhhVZR,cpldeltaRppcdeltaRppVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,      & 
& cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,        & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,         & 
& cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cpldeltaRppcdeltaRppVZRVZR,& 
& cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,& 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,              & 
& MVWRm2,cplAhhhVZR,cpldeltaRppcdeltaRppVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,      & 
& cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,        & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,         & 
& cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cpldeltaRppcdeltaRppVZRVZR,& 
& cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,& 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVZR
 
 
Subroutine Pi1LoopVZR(p2,Mhh,Mhh2,MAh,MAh2,MdeltaRpp,MdeltaRpp2,MFd,MFd2,             & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MVZ,MVZ2,MVZR,MVZR2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,          & 
& MVWRm2,cplAhhhVZR,cpldeltaRppcdeltaRppVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,      & 
& cplcFeFeVZRR,cplcFuFuVZRL,cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplcgWLmgWLmVZR,        & 
& cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,       & 
& cplhhVPVZR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,cplHpmcVWLmVZR,cplHpmcVWRmVZR,         & 
& cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR,cpldeltaRppcdeltaRppVZRVZR,& 
& cplhhhhVZRVZR,cplHpmcHpmVZRVZR,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,& 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: Mhh(3),Mhh2(3),MAh(3),MAh2(3),MdeltaRpp,MdeltaRpp2,MFd(3),MFd2(3),MFe(3),             & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MVZ,MVZ2,MVZR,MVZR2,MHpm(3),MHpm2(3),            & 
& MVWLm,MVWLm2,MVWRm,MVWRm2

Complex(dp), Intent(in) :: cplAhhhVZR(3,3),cpldeltaRppcdeltaRppVZR,cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),          & 
& cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),               & 
& cplFvFvVZRL(6,6),cplFvFvVZRR(6,6),cplcgWLmgWLmVZR,cplcgWRmgWLmVZR,cplcgWLpgWLpVZR,     & 
& cplcgWRpgWLpVZR,cplcgWRmgWRmVZR,cplcgWRpgWRpVZR,cplhhVPVZR(3),cplhhVZVZR(3),           & 
& cplhhVZRVZR(3),cplHpmcHpmVZR(3,3),cplHpmcVWLmVZR(3),cplHpmcVWRmVZR(3),cplcVWLmVWLmVZR, & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,cplAhAhVZRVZR(3,3),cpldeltaRppcdeltaRppVZRVZR,         & 
& cplhhhhVZRVZR(3,3),cplHpmcHpmVZRVZR(3,3),cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,      & 
& cplcVWLmVWLmVZRVZR3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! hh, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = VSSloop(p2,MAh2(i2),Mhh2(i1))  
coup1 = cplAhhhVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[deltaRpp], deltaRpp 
!------------------------ 
sumI = 0._dp 
 
B22m2 = VSSloop(p2,MdeltaRpp2,MdeltaRpp2)  
coup1 = cpldeltaRppcdeltaRppVZR
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[Fd], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFd2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFd(i1)*MFd(i2)*B0(p2,MFd2(i1),MFd2(i2)) 
coupL1 = cplcFdFdVZRL(i1,i2)
coupR1 = cplcFdFdVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fe 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFe2(i1),MFe2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFe(i2)*B0(p2,MFe2(i1),MFe2(i2)) 
coupL1 = cplcFeFeVZRL(i1,i2)
coupR1 = cplcFeFeVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fu], Fu 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFu2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFu(i2)*B0(p2,MFu2(i1),MFu2(i2)) 
coupL1 = cplcFuFuVZRL(i1,i2)
coupR1 = cplcFuFuVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! Fv, Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 6
       Do i2 = 1, 6
 H0m2 = Hloop(p2,MFv2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFv(i1)*MFv(i2)*B0(p2,MFv2(i1),MFv2(i2)) 
coupL1 = cplFvFvVZRL(i1,i2)
coupR1 = cplFvFvVZRR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +0.5_dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVWLm2)
coup1 = cplcgWLmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRm], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVWRm2)
coup1 = cplcgWRmgWLmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWLmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVWLm2)
coup1 = cplcgWLpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWLmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVWRm2)
coup1 = cplcgWRpgWLpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +2._dp* SumI  
!------------------------ 
! bar[gWRm], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,MVWRm2)
coup1 = cplcgWRmgWRmVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gWRmC 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,MVWRm2)
coup1 = cplcgWRpgWRpVZR
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! VP, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,0._dp,Mhh2(i2)) 
coup1 = cplhhVPVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVZ2,Mhh2(i2)) 
coup1 = cplhhVZVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVZR2,Mhh2(i2)) 
coup1 = cplhhVZRVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! conj[Hpm], Hpm 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = VSSloop(p2,MHpm2(i2),MHpm2(i1))  
coup1 = cplHpmcHpmVZR(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! conj[VWLm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWLm2,MHpm2(i2)) 
coup1 = cplHpmcVWLmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWRm], Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWRm2,MHpm2(i2)) 
coup1 = cplHpmcVWRmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +2._dp* SumI  
    End Do 
 !------------------------ 
! conj[VWLm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWLm2)*coup1*coup2 
res = res +2._dp* SumI  
!------------------------ 
! conj[VWRm], VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(MAh2(i1))
 coup1 = cplAhAhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[deltaRpp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MdeltaRpp2)
 coup1 = cpldeltaRppcdeltaRppVZRVZR
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(MHpm2(i1))
 coup1 = cplHpmcHpmVZRVZR(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWLm2) +RXi/4._dp*A0(MVWLm2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWRm2) +RXi/4._dp*A0(MVWRm2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVZR 
 
Subroutine OneLoopVWLm(g2,gR,vd,vu,vR,PhiW,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,          & 
& MFu,MFu2,MFd,MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MdeltaRpp,MdeltaRpp2,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR, & 
& cplcFeFvcVWLmL,cplcFeFvcVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,         & 
& cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,     & 
& cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,       & 
& cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,              & 
& cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,           & 
& cplcVWLmVWRmVZR,cplcdeltaRppcHpmcVWLm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,   & 
& cplAhAhcVWLmVWLm,cpldeltaRppcdeltaRppcVWLmVWLm,cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,   & 
& cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,          & 
& cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,& 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,          & 
& cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHpm(3),MHpm2(3),MAh(3),MAh2(3),MVWRm,MVWRm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFe(3),MFe2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MVWLm,MVWLm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MdeltaRpp,MdeltaRpp2

Real(dp), Intent(in) :: g2,gR,vd,vu,vR,PhiW

Complex(dp), Intent(in) :: cplAhHpmcVWLm(3,3),cplAhcVWLmVWRm(3),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),         & 
& cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,               & 
& cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,      & 
& cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,    & 
& cplhhHpmcVWLm(3,3),cplhhcVWLmVWLm(3),cplhhcVWLmVWRm(3),cplHpmcVWLmVP(3),               & 
& cplHpmcVWLmVZ(3),cplHpmcVWLmVZR(3),cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,       & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcdeltaRppcHpmcVWLm(3),               & 
& cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplAhAhcVWLmVWLm(3,3),cpldeltaRppcdeltaRppcVWLmVWLm,& 
& cplhhhhcVWLmVWLm(3,3),cplHpmcHpmcVWLmVWLm(3,3),cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,    & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWLm'
 
mi2 = MVWLm2 

 
p2 = MVWLm2
PiSf = ZeroC 
Call Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,               & 
& MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,      & 
& cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFeFvcVWLmL,             & 
& cplcFeFvcVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,        & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,cplhhcVWLmVWLm,        & 
& cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplcVWLmVPVWLm,              & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,          & 
& cplcdeltaRppcHpmcVWLm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplAhAhcVWLmVWLm,  & 
& cpldeltaRppcdeltaRppcVWLmVWLm,cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm3,  & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,     & 
& cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,             & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,MFd2,               & 
& MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,      & 
& cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFeFvcVWLmL,             & 
& cplcFeFvcVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,        & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,cplhhcVWLmVWLm,        & 
& cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplcVWLmVPVWLm,              & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,          & 
& cplcdeltaRppcHpmcVWLm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplAhAhcVWLmVWLm,  & 
& cpldeltaRppcdeltaRppcVWLmVWLm,cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm3,  & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,     & 
& cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,             & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWLm
 
 
Subroutine Pi1LoopVWLm(p2,MHpm,MHpm2,MAh,MAh2,MVWRm,MVWRm2,MFu,MFu2,MFd,              & 
& MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWLm,MVWLm2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,            & 
& MdeltaRpp2,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFeFvcVWLmL,  & 
& cplcFeFvcVWLmR,cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,        & 
& cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,     & 
& cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,cplhhHpmcVWLm,cplhhcVWLmVWLm,        & 
& cplhhcVWLmVWRm,cplHpmcVWLmVP,cplHpmcVWLmVZ,cplHpmcVWLmVZR,cplcVWLmVPVWLm,              & 
& cplcVWLmVPVWRm,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,          & 
& cplcdeltaRppcHpmcVWLm,cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplAhAhcVWLmVWLm,  & 
& cpldeltaRppcdeltaRppcVWLmVWLm,cplhhhhcVWLmVWLm,cplHpmcHpmcVWLmVWLm,cplcVWLmVPVPVWLm3,  & 
& cplcVWLmVPVPVWLm1,cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,     & 
& cplcVWLmcVWLmVWLmVWLm1,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWLmVWLmVZVZ1,cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,             & 
& cplcVWLmVWLmVZRVZR2,cplcVWLmVWLmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(3),MHpm2(3),MAh(3),MAh2(3),MVWRm,MVWRm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFe(3),MFe2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MVWLm,MVWLm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MdeltaRpp,MdeltaRpp2

Complex(dp), Intent(in) :: cplAhHpmcVWLm(3,3),cplAhcVWLmVWRm(3),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),         & 
& cplcFeFvcVWLmL(3,6),cplcFeFvcVWLmR(3,6),cplcgWLpgPcVWLm,cplcgWRpgPcVWLm,               & 
& cplcgPgWLmcVWLm,cplcgZgWLmcVWLm,cplcgZpgWLmcVWLm,cplcgPgWRmcVWLm,cplcgZgWRmcVWLm,      & 
& cplcgZpgWRmcVWLm,cplcgWLpgZcVWLm,cplcgWRpgZcVWLm,cplcgWLpgZpcVWLm,cplcgWRpgZpcVWLm,    & 
& cplhhHpmcVWLm(3,3),cplhhcVWLmVWLm(3),cplhhcVWLmVWRm(3),cplHpmcVWLmVP(3),               & 
& cplHpmcVWLmVZ(3),cplHpmcVWLmVZR(3),cplcVWLmVPVWLm,cplcVWLmVPVWRm,cplcVWLmVWLmVZ,       & 
& cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,cplcdeltaRppcHpmcVWLm(3),               & 
& cplcdeltaRppcVWLmcVWLm,cplcdeltaRppcVWLmcVWRm,cplAhAhcVWLmVWLm(3,3),cpldeltaRppcdeltaRppcVWLmVWLm,& 
& cplhhhhcVWLmVWLm(3,3),cplHpmcHpmcVWLmVWLm(3,3),cplcVWLmVPVPVWLm3,cplcVWLmVPVPVWLm1,    & 
& cplcVWLmVPVPVWLm2,cplcVWLmcVWLmVWLmVWLm2,cplcVWLmcVWLmVWLmVWLm3,cplcVWLmcVWLmVWLmVWLm1,& 
& cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWLmVWLmVZVZ1,& 
& cplcVWLmVWLmVZVZ2,cplcVWLmVWLmVZVZ3,cplcVWLmVWLmVZRVZR1,cplcVWLmVWLmVZRVZR2,           & 
& cplcVWLmVWLmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = VSSloop(p2,MAh2(i2),MHpm2(i1))  
coup1 = cplAhHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWRm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWRm2,MAh2(i2)) 
coup1 = cplAhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*B0(p2,MFu2(i1),MFd2(i2)) 
coupL1 = cplcFuFdcVWLmL(i1,i2)
coupR1 = cplcFuFdcVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 H0m2 = Hloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFv(i2)*B0(p2,MFe2(i1),MFv2(i2)) 
coupL1 = cplcFeFvcVWLmL(i1,i2)
coupR1 = cplcFeFvcVWLmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,0._dp,MVWLm2)
coup1 = cplcgWLpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,0._dp,MVWRm2)
coup1 = cplcgWRpgPcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,0._dp)
coup1 = cplcgPgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVZ2)
coup1 = cplcgZgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVZR2)
coup1 = cplcgZpgWLmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,0._dp)
coup1 = cplcgPgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,MVZ2)
coup1 = cplcgZgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,MVZR2)
coup1 = cplcgZpgWRmcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZ2,MVWLm2)
coup1 = cplcgWLpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZ2,MVWRm2)
coup1 = cplcgWRpgZcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZR2,MVWLm2)
coup1 = cplcgWLpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZR2,MVWRm2)
coup1 = cplcgWRpgZpcVWLm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = VSSloop(p2,Mhh2(i2),MHpm2(i1))  
coup1 = cplhhHpmcVWLm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWLm2,Mhh2(i2)) 
coup1 = cplhhcVWLmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWRm2,Mhh2(i2)) 
coup1 = cplhhcVWLmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,0._dp,MHpm2(i2)) 
coup1 = cplHpmcVWLmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVZ2,MHpm2(i2)) 
coup1 = cplHpmcVWLmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVZR2,MHpm2(i2)) 
coup1 = cplHpmcVWLmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWLmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B22m2 = VSSloop(p2,MdeltaRpp2,MHpm2(i1))  
coup1 = cplcdeltaRppcHpmcVWLm(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWLm2,MdeltaRpp2) 
coup1 = cplcdeltaRppcVWLmcVWLm
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWRm2,MdeltaRpp2) 
coup1 = cplcdeltaRppcVWLmcVWRm
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(MAh2(i1))
 coup1 = cplAhAhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[deltaRpp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MdeltaRpp2)
 coup1 = cpldeltaRppcdeltaRppcVWLmVWLm
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWLmVWLm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(0._dp) +RXi/4._dp*A0(0._dp*RXi) 
coup1 = cplcVWLmVPVPVWLm3
coup2 = cplcVWLmVPVPVWLm1
coup3 = cplcVWLmVPVPVWLm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWLm2) +RXi/4._dp*A0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWLmVWLmVWLm2
coup2 = cplcVWLmcVWLmVWLmVWLm3
coup3 = cplcVWLmcVWLmVWLmVWLm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWRm2) +RXi/4._dp*A0(MVWRm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVZ2) +RXi/4._dp*A0(MVZ2*RXi) 
coup1 = cplcVWLmVWLmVZVZ1
coup2 = cplcVWLmVWLmVZVZ2
coup3 = cplcVWLmVWLmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVZR2) +RXi/4._dp*A0(MVZR2*RXi) 
coup1 = cplcVWLmVWLmVZRVZR1
coup2 = cplcVWLmVWLmVZRVZR2
coup3 = cplcVWLmVWLmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWLm 
 
Subroutine OneLoopVWRm(g2,gR,vd,vu,vR,PhiW,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,          & 
& MFu,MFu2,MFd,MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MdeltaRpp,MdeltaRpp2,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR, & 
& cplcFeFvcVWRmL,cplcFeFvcVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,         & 
& cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,     & 
& cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,       & 
& cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,              & 
& cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,           & 
& cplcVWRmVWRmVZR,cplcdeltaRppcHpmcVWRm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,   & 
& cplAhAhcVWRmVWRm,cpldeltaRppcdeltaRppcVWRmVWRm,cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,   & 
& cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,          & 
& cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,& 
& cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,          & 
& cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,delta,mass,mass2,kont)

Real(dp), Intent(in) :: MHpm(3),MHpm2(3),MAh(3),MAh2(3),MVWLm,MVWLm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFe(3),MFe2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MdeltaRpp,MdeltaRpp2

Real(dp), Intent(in) :: g2,gR,vd,vu,vR,PhiW

Complex(dp), Intent(in) :: cplAhHpmcVWRm(3,3),cplAhcVWRmVWLm(3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),         & 
& cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6),cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,               & 
& cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,      & 
& cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,    & 
& cplhhHpmcVWRm(3,3),cplhhcVWRmVWLm(3),cplhhcVWRmVWRm(3),cplHpmcVWRmVP(3),               & 
& cplHpmcVWRmVZ(3),cplHpmcVWRmVZR(3),cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,       & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcdeltaRppcHpmcVWRm(3),               & 
& cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhcVWRmVWRm(3,3),cpldeltaRppcdeltaRppcVWRmVWRm,& 
& cplhhhhcVWRmVWRm(3,3),cplHpmcHpmcVWRmVWRm(3,3),cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,    & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3

Integer , Intent(inout):: kont 
Integer :: i1,i2,i3,i4,j1,j2,j3,j4,il,i_count, ierr 
Real(dp), Intent(in) :: delta 
Real(dp) :: mi, mi2, p2, test_m2 
Complex(dp) :: PiSf, SigL, SigR, SigS 
Real(dp), Intent(out) :: mass, mass2 
Iname = Iname + 1 
NameOfUnit(Iname) = 'OneLoopVWRm'
 
mi2 = MVWRm2 

 
p2 = MVWRm2
PiSf = ZeroC 
Call Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,MFd2,               & 
& MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,      & 
& cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFeFvcVWRmL,             & 
& cplcFeFvcVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,        & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplcVWRmVPVWLm,              & 
& cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,          & 
& cplcdeltaRppcHpmcVWRm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppcVWRmVWRm,cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,  & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,     & 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,& 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,             & 
& cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
i_count = 0 
Do  
i_count = i_count + 1 
test_m2 = mass2 
p2 =  mass2 
PiSf = ZeroC 
Call Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,MFd2,               & 
& MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,MdeltaRpp2,      & 
& cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFeFvcVWRmL,             & 
& cplcFeFvcVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,        & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplcVWRmVPVWLm,              & 
& cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,          & 
& cplcdeltaRppcHpmcVWRm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppcVWRmVWRm,cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,  & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,     & 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,& 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,             & 
& cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,PiSf)

mass2 = mi2 + Real(PiSf,dp) 
mass = sqrt(mass2) 
 If (test_m2.Ne.0._dp) Then 
    test_m2 = Abs(test_m2 - mass2) / test_m2 
 Else 
    test_m2 = Abs(mass2) 
 End If 
 If (mass2.Ge.0._dp) Then 
   If (RotateNegativeFermionMasses) Then 
    mass = sqrt(mass2) 
   End if 
  Else 
 If (Abs(mass2).lt.1.0E-30_dp) test_m2 = 0._dp 
     Write(ErrCan,*) 'Warning from routine'//NameOfUnit(Iname) 
     Write(ErrCan,*) 'in the calculation of the masses' 
     Write(ErrCan,*) 'occurred a negative mass squared!' 
   SignOfMassChanged = .True. 
   mass = 0._dp 
  End If 
If (test_m2.LT.0.1_dp*delta) Exit 
If (i_count.Gt.30) Then 
  Write(*,*) "Problem in "//NameOfUnit(Iname), test_m2, mass2 
  kont = -510 
  Call AddError(510) 
 Exit 
End If 
End Do 
 
 
Iname = Iname -1 
End Subroutine OneLoopVWRm
 
 
Subroutine Pi1LoopVWRm(p2,MHpm,MHpm2,MAh,MAh2,MVWLm,MVWLm2,MFu,MFu2,MFd,              & 
& MFd2,MFe,MFe2,MFv,MFv2,Mhh,Mhh2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,MdeltaRpp,            & 
& MdeltaRpp2,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFeFvcVWRmL,  & 
& cplcFeFvcVWRmR,cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,        & 
& cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,     & 
& cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,cplhhHpmcVWRm,cplhhcVWRmVWLm,        & 
& cplhhcVWRmVWRm,cplHpmcVWRmVP,cplHpmcVWRmVZ,cplHpmcVWRmVZR,cplcVWRmVPVWLm,              & 
& cplcVWRmVPVWRm,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,          & 
& cplcdeltaRppcHpmcVWRm,cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhcVWRmVWRm,  & 
& cpldeltaRppcdeltaRppcVWRmVWRm,cplhhhhcVWRmVWRm,cplHpmcHpmcVWRmVWRm,cplcVWRmVPVPVWRm3,  & 
& cplcVWRmVPVPVWRm1,cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,     & 
& cplcVWLmcVWRmVWLmVWRm1,cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,& 
& cplcVWRmVWRmVZVZ1,cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,             & 
& cplcVWRmVWRmVZRVZR2,cplcVWRmVWRmVZRVZR3,kont,res)

Implicit None 
Real(dp), Intent(in) :: MHpm(3),MHpm2(3),MAh(3),MAh2(3),MVWLm,MVWLm2,MFu(3),MFu2(3),MFd(3),MFd2(3),           & 
& MFe(3),MFe2(3),MFv(6),MFv2(6),Mhh(3),Mhh2(3),MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,MdeltaRpp,MdeltaRpp2

Complex(dp), Intent(in) :: cplAhHpmcVWRm(3,3),cplAhcVWRmVWLm(3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),         & 
& cplcFeFvcVWRmL(3,6),cplcFeFvcVWRmR(3,6),cplcgWLpgPcVWRm,cplcgWRpgPcVWRm,               & 
& cplcgPgWLmcVWRm,cplcgZgWLmcVWRm,cplcgZpgWLmcVWRm,cplcgPgWRmcVWRm,cplcgZgWRmcVWRm,      & 
& cplcgZpgWRmcVWRm,cplcgWLpgZcVWRm,cplcgWRpgZcVWRm,cplcgWLpgZpcVWRm,cplcgWRpgZpcVWRm,    & 
& cplhhHpmcVWRm(3,3),cplhhcVWRmVWLm(3),cplhhcVWRmVWRm(3),cplHpmcVWRmVP(3),               & 
& cplHpmcVWRmVZ(3),cplHpmcVWRmVZR(3),cplcVWRmVPVWLm,cplcVWRmVPVWRm,cplcVWRmVWLmVZ,       & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,cplcdeltaRppcHpmcVWRm(3),               & 
& cplcdeltaRppcVWLmcVWRm,cplcdeltaRppcVWRmcVWRm,cplAhAhcVWRmVWRm(3,3),cpldeltaRppcdeltaRppcVWRmVWRm,& 
& cplhhhhcVWRmVWRm(3,3),cplHpmcHpmcVWRmVWRm(3,3),cplcVWRmVPVPVWRm3,cplcVWRmVPVPVWRm1,    & 
& cplcVWRmVPVPVWRm2,cplcVWLmcVWRmVWLmVWRm2,cplcVWLmcVWRmVWLmVWRm3,cplcVWLmcVWRmVWLmVWRm1,& 
& cplcVWRmcVWRmVWRmVWRm2,cplcVWRmcVWRmVWRmVWRm3,cplcVWRmcVWRmVWRmVWRm1,cplcVWRmVWRmVZVZ1,& 
& cplcVWRmVWRmVZVZ2,cplcVWRmVWRmVZVZ3,cplcVWRmVWRmVZRVZR1,cplcVWRmVWRmVZRVZR2,           & 
& cplcVWRmVWRmVZRVZR3

Integer, Intent(inout) :: kont 
Real(dp) :: B0m2, F0m2, G0m2, B1m2, H0m2, B22m2, m1, m2 
Real(dp), Intent(in) :: p2 
Complex(dp) :: A0m2, A0m12, A0m22 
Complex(dp), Intent(inout) :: res 
Complex(dp) :: coupL1, coupR1, coupL2,coupR2, coup1,coup2, coup3, temp, sumI 
Integer :: i1,i2,i3,i4, gO1, gO2, ierr 
 
 
res = 0._dp 
 
!------------------------ 
! Hpm, Ah 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = VSSloop(p2,MAh2(i2),MHpm2(i1))  
coup1 = cplAhHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, Ah 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWLm2,MAh2(i2)) 
coup1 = cplAhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! bar[Fu], Fd 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 H0m2 = Hloop(p2,MFu2(i1),MFd2(i2)) 
B0m2 = 4._dp*MFu(i1)*MFd(i2)*B0(p2,MFu2(i1),MFd2(i2)) 
coupL1 = cplcFuFdcVWRmL(i1,i2)
coupR1 = cplcFuFdcVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +3._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[Fe], Fv 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 6
 H0m2 = Hloop(p2,MFe2(i1),MFv2(i2)) 
B0m2 = 4._dp*MFe(i1)*MFv(i2)*B0(p2,MFe2(i1),MFv2(i2)) 
coupL1 = cplcFeFvcVWRmL(i1,i2)
coupR1 = cplcFeFvcVWRmR(i1,i2)
    SumI = (Abs(coupL1)**2+Abs(coupR1)**2)*H0m2 & 
                & + (Real(Conjg(coupL1)*coupR1,dp))*B0m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! bar[gWLmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,0._dp,MVWLm2)
coup1 = cplcgWLpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gP 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,0._dp,MVWRm2)
coup1 = cplcgWRpgPcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,0._dp)
coup1 = cplcgPgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVZ2)
coup1 = cplcgZgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWLm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWLm2,MVZR2)
coup1 = cplcgZpgWLmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gP], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,0._dp)
coup1 = cplcgPgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZ], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,MVZ2)
coup1 = cplcgZgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gZR], gWRm 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVWRm2,MVZR2)
coup1 = cplcgZpgWRmcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZ2,MVWLm2)
coup1 = cplcgWLpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZ 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZ2,MVWRm2)
coup1 = cplcgWRpgZcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWLmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZR2,MVWLm2)
coup1 = cplcgWLpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! bar[gWRmC], gZR 
!------------------------ 
sumI = 0._dp 
 
SumI = 0._dp 
B0m2 = VGGloop(p2,MVZR2,MVWRm2)
coup1 = cplcgWRpgZpcVWRm
coup2 = Conjg(coup1) 
   SumI = coup1*coup2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Hpm, hh 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
       Do i2 = 1, 3
 B22m2 = VSSloop(p2,Mhh2(i2),MHpm2(i1))  
coup1 = cplhhHpmcVWRm(i2,i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
     End Do 
 !------------------------ 
! VWLm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWLm2,Mhh2(i2)) 
coup1 = cplhhcVWRmVWLm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWRm, hh 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVWRm2,Mhh2(i2)) 
coup1 = cplhhcVWRmVWRm(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VP, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,0._dp,MHpm2(i2)) 
coup1 = cplHpmcVWRmVP(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZ, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVZ2,MHpm2(i2)) 
coup1 = cplHpmcVWRmVZ(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VZR, Hpm 
!------------------------ 
sumI = 0._dp 
 
      Do i2 = 1, 3
 B0m2 = VVSloop(p2,MVZR2,MHpm2(i2)) 
coup1 = cplHpmcVWRmVZR(i2)
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
    End Do 
 !------------------------ 
! VWLm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWLm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWLm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VWRm, VP 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVPVWRm
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVWRm2,0._dp)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWLm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWLmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWLm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZ, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZ
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZ2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! VZR, VWRm 
!------------------------ 
sumI = 0._dp 
 
coup1 = cplcVWRmVWRmVZR
coup2 = Conjg(coup1) 
    SumI = -VVVloop(p2,MVZR2,MVWRm2)*coup1*coup2 
res = res +1._dp* SumI  
!------------------------ 
! conj[Hpm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
    Do i1 = 1, 3
 B22m2 = VSSloop(p2,MdeltaRpp2,MHpm2(i1))  
coup1 = cplcdeltaRppcHpmcVWRm(i1)
    SumI = Abs(coup1)**2*B22m2 
res = res +1._dp* SumI  
      End Do 
 !------------------------ 
! conj[VWLm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWLm2,MdeltaRpp2) 
coup1 = cplcdeltaRppcVWLmcVWRm
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! conj[VWRm], conj[deltaRpp] 
!------------------------ 
sumI = 0._dp 
 
B0m2 = VVSloop(p2,MVWRm2,MdeltaRpp2) 
coup1 = cplcdeltaRppcVWRmcVWRm
    SumI = Abs(coup1)**2*B0m2 
res = res +1._dp* SumI  
!------------------------ 
! Ah 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(MAh2(i1))
 coup1 = cplAhAhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[deltaRpp] 
!------------------------ 
SumI = 0._dp 
 A0m2 = A0(MdeltaRpp2)
 coup1 = cpldeltaRppcdeltaRppcVWRmVWRm
 SumI = coup1*A0m2 
res = res +1* SumI  
!------------------------ 
! hh 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(Mhh2(i1))
 coup1 = cplhhhhcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1._dp/2._dp* SumI  
      End Do 
 !------------------------ 
! conj[Hpm] 
!------------------------ 
    Do i1 = 1, 3
 SumI = 0._dp 
 A0m2 = A0(MHpm2(i1))
 coup1 = cplHpmcHpmcVWRmVWRm(i1,i1)
 SumI = coup1*A0m2 
res = res +1* SumI  
      End Do 
 !------------------------ 
! VP 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(0._dp) +RXi/4._dp*A0(0._dp*RXi) 
coup1 = cplcVWRmVPVPVWRm3
coup2 = cplcVWRmVPVPVWRm1
coup3 = cplcVWRmVPVPVWRm2
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*0._dp-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! conj[VWLm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWLm2) +RXi/4._dp*A0(MVWLm2*RXi) 
coup1 = cplcVWLmcVWRmVWLmVWRm2
coup2 = cplcVWLmcVWRmVWLmVWRm3
coup3 = cplcVWLmcVWRmVWLmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWLm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! conj[VWRm] 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVWRm2) +RXi/4._dp*A0(MVWRm2*RXi) 
coup1 = cplcVWRmcVWRmVWRmVWRm2
coup2 = cplcVWRmcVWRmVWRmVWRm3
coup3 = cplcVWRmcVWRmVWRmVWRm1
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVWRm2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1* SumI  
!------------------------ 
! VZ 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVZ2) +RXi/4._dp*A0(MVZ2*RXi) 
coup1 = cplcVWRmVWRmVZVZ1
coup2 = cplcVWRmVWRmVZVZ2
coup3 = cplcVWRmVWRmVZVZ3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZ2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
!------------------------ 
! VZR 
!------------------------ 
SumI = 0._dp 
A0m2 = 3._dp/4._dp*A0(MVZR2) +RXi/4._dp*A0(MVZR2*RXi) 
coup1 = cplcVWRmVWRmVZRVZR1
coup2 = cplcVWRmVWRmVZRVZR2
coup3 = cplcVWRmVWRmVZRVZR3
SumI = ((2._dp*rMS*coup1+(1-RXi**2)/8._dp*(coup2+coup3))*MVZR2-(4._dp*coup1+coup2+coup3)*A0m2)
res = res +1._dp/2._dp* SumI  
res = oo16pi2*res 
 
End Subroutine Pi1LoopVWRm 
 

  Complex(dp) Function FloopRXi(p2,m12,m22) 
   Implicit None 
   Real(dp),Intent(in)::p2,m12,m22 
    
   
    If (RXi.eq.1._dp) Then
       FloopRXi=Floop(p2,m12,m22)
    Else
       If ((m12.gt.1.0E-10_dp).and.(m22.gt.1.0E-10_dp)) Then
          FloopRXi=A0(m12)-A0(m22)+((m12-p2)*A0(m22))/m22-&
               & ((m12-p2+m22*RXi)*A0(m22*RXi))/m22+(-m12+m22+p2)*b0(p2,m12,m22)-&
               & (m12-(m12-p2)**2/m22+3._dp*p2)*b0(p2,m12,m22)-((m12-p2)**2*b0(p2,m12,m22*RXi))/m22
       Else
          If (m12.gt.1.0E-10_dp) Then
              FloopRXi=A0(m12)-2._dp*(m12+p2)*B0(p2,0._dp,m12)
          Else If (m22.gt.1.0E-10_dp) Then
              FloopRXi=(-((m22+p2)*A0(m22))+(p2-m22*RXi)*A0(m22*RXi)+(m22-p2)**2*B0(p2,0._dp,m22)-p2**2*B0(p2,0._dp,m22*RXi))/m22
          Else
              FloopRXi=0._dp
          End if
       End if
    End if
     If (Real(FloopRXi,dp).ne.Real(FloopRXi,dp)) Write(*,*) "NaN in FloopRXi", p2,m12,m22
  End Function FloopRXi


  
  Complex(dp) Function SVVloop(p2,m12,m22)
    Implicit None

    Real(dp),Intent(in)::p2,m12,m22
    

    If (RXi.eq.1._dp) Then
	   
        SVVloop = 4._dp*Real(B0(p2,m12,m22)-0.5_dp*rMS,dp)
    Else If (RXi.lt.0.1_dp) Then
	If (m12.gt.1.0E-10_dp) Then
	    If (p2.gt.0.1_dp) Then
		SVVloop = -2._dp*(rMS-A0(m12)/(8._dp*m12)+(RXi*A0(m12))/(8._dp*m12)-A0(m22)/(8._dp*m22)+(RXi*A0(m22))/(8._dp*m22)+A0(m12*RXi)/(8._dp*m12)&
               &-(RXi*A0(m12*RXi))/(8._dp*m12)+A0(m22*RXi)/(8._dp*m22)-&
               &(RXi*A0(m22*RXi))/(8._dp*m22)-(5._dp*B0(p2,m12,m22))/4._dp-(m12*B0(p2,m12,m22))/(8._dp*m22)&
               &-(m22*B0(p2,m12,m22))/(8._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m22)-&
               &(p2**2*B0(p2,m12,m22))/(8._dp*m12*m22)+(m12*B0(p2,m12,m22*RXi))/(8._dp*m22)-(p2*B0(p2,m12,m22*RXi))/(4._dp*m22)&
               &+(p2**2*B0(p2,m12,m22*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m12,m22*RXi))/4._dp-&
               &(p2*RXi*B0(p2,m12,m22*RXi))/(4._dp*m12)+(m22*RXi**2*B0(p2,m12,m22*RXi))/(8._dp*m12)&
               &+(m22*B0(p2,m22,m12*RXi))/(8._dp*m12)-(p2*B0(p2,m22,m12*RXi))/(4._dp*m12)+&
               &(p2**2*B0(p2,m22,m12*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m22,m12*RXi))/4._dp-(p2*RXi*B0(p2,m22,m12*RXi))/(4._dp*m22)&
               &+(m12*RXi**2*B0(p2,m22,m12*RXi))/(8._dp*m22)-&
               &(p2**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12*m22)+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m12)&
               &+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m22)-(RXi**2*B0(p2,m12*RXi,m22*RXi))/4._dp-&
               &(m12*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m22)-(m22*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12))
!                Write(*,*) SVVloop
	    Else
	     If (m12.eq.m22) Then 
	        SVVloop = 0._dp
	     Else 
		SVVloop = (2._dp*rMS*(-m12+m22)+3._dp*A0(m12)-3._dp*A0(m22))/(m12-m22)
             End if
	    End if
        Else
	     If (p2.gt.0.1) Then
		SVVloop = (-8._dp*rMS*m22+A0(m22)+2._dp*p2*B0(p2,0._dp,0._dp)+2._dp*(5._dp*m22-p2)*B0(p2,0._dp,m22))/(4._dp*m22)
	    Else
		SVVloop = -2._dp*rMS + 3._dp*B0(0._dp,0._dp,m22)
	    End if
	End if
    Else
    
       If ((m12.gt.1.0E-10_dp).and.(m22.gt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = (-2._dp*rMS*m12+2._dp*rMS*m22+3._dp*A0(m12)-3._dp*A0(m22)+RXi*A0(m12*RXi)-RXi*A0(m22*RXi))/(m12-m22)
	  Else
	  
	   If (m12-m22.lt.1_dp) Then 
	     SVVloop=  (p2**2*(B0(p2,m12,m12) - 2*B0(p2,m12,m12*RXi) + B0(p2,m12*RXi,m12*RXi)) + &
     &  4*m12*p2*(-B0(p2,m12,m12) + (1 + RXi)*B0(p2,m12,m12*RXi) - RXi*B0(p2,m12*RXi,m12*RXi)) + &
     &  2*m12*((1 - RXi)*A0(m12) + (-1 + RXi)*A0(m12*RXi) - m12*(4*rMS - 6*B0(p2,m12,m12) + (-1 + RXi)**2*B0(p2,m12,m12*RXi) - 2*RXi**2*B0(p2,m12*RXi,m12*RXi))))/(4*m12**2)
	   Else 
	      SVVloop = -2._dp*(rMS-A0(m12)/(8._dp*m12)+(RXi*A0(m12))/(8._dp*m12)-A0(m22)/(8._dp*m22)+(RXi*A0(m22))/(8._dp*m22)+A0(m12*RXi)/(8._dp*m12)&
               &-(RXi*A0(m12*RXi))/(8._dp*m12)+A0(m22*RXi)/(8._dp*m22)-&
               &(RXi*A0(m22*RXi))/(8._dp*m22)-(5._dp*B0(p2,m12,m22))/4._dp-(m12*B0(p2,m12,m22))/(8._dp*m22)&
               &-(m22*B0(p2,m12,m22))/(8._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m12)+(p2*B0(p2,m12,m22))/(4._dp*m22)-&
               &(p2**2*B0(p2,m12,m22))/(8._dp*m12*m22)+(m12*B0(p2,m12,m22*RXi))/(8._dp*m22)-(p2*B0(p2,m12,m22*RXi))/(4._dp*m22)&
               &+(p2**2*B0(p2,m12,m22*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m12,m22*RXi))/4._dp-&
               &(p2*RXi*B0(p2,m12,m22*RXi))/(4._dp*m12)+(m22*RXi**2*B0(p2,m12,m22*RXi))/(8._dp*m12)&
               &+(m22*B0(p2,m22,m12*RXi))/(8._dp*m12)-(p2*B0(p2,m22,m12*RXi))/(4._dp*m12)+&
               &(p2**2*B0(p2,m22,m12*RXi))/(8._dp*m12*m22)-(RXi*B0(p2,m22,m12*RXi))/4._dp-(p2*RXi*B0(p2,m22,m12*RXi))/(4._dp*m22)&
               &+(m12*RXi**2*B0(p2,m22,m12*RXi))/(8._dp*m22)-&
               &(p2**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12*m22)+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m12)&
               &+(p2*RXi*B0(p2,m12*RXi,m22*RXi))/(4._dp*m22)-(RXi**2*B0(p2,m12*RXi,m22*RXi))/4._dp-&
               &(m12*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m22)-(m22*RXi**2*B0(p2,m12*RXi,m22*RXi))/(8._dp*m12))
!                Write(*,*) SVVloop
          End if
          End if 
       Else If ((m12.gt.1.0E-10_dp).and.(m22.lt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = (-8._dp*rMS*m22+(11._dp+RXi)*A0(m22)+(1._dp+3._dp*RXi)*A0(m22*RXi))/(4._dp*m22)
	  Else
	      SVVloop =  -2._dp*rMS+A0(m12)/(4._dp*m12)-(RXi*A0(m12))/(4._dp*m12)-A0(m12*RXi)/(4._dp*m12)+(RXi*A0(m12*RXi))/(4._dp*m12)&
              &+(5._dp*B0(p2,0._dp,m12))/2._dp-(p2*B0(p2,0._dp,m12))/(2._dp*m12)+(RXi*B0(p2,0._dp,m12))/2._dp+(p2*RXi*B0(p2,0._dp,m12))/(2._dp*m12)& 
              &+(p2*B0(p2,0._dp,m12*RXi))/(2._dp*m12)+(RXi*B0(p2,0._dp,m12*RXi))/2._dp-(p2*RXi*B0(p2,0._dp,m12*RXi))/(2._dp*m12) + (RXi**2*B0(p2,0._dp,m12*RXi))/2._dp
          End if 
          
       Else If ((m22.gt.1.0E-10_dp).and.(m12.lt.1.0E-10_dp)) Then
	  If (p2.lt.0.1) Then
	      SVVloop = -2._dp*rMS + (1.0_dp*RXi)*B0(0._dp,0._dp,m22*RXi) + (3._dp)*B0(0._dp,0._dp,m22) !+ A0(m22)/m22
	  Else
	       SVVloop =  -2._dp*rMS+A0(m22)/(4._dp*m22)-(RXi*A0(m22))/(4._dp*m22)-A0(m22*RXi)/(4._dp*m22)+(RXi*A0(m22*RXi))/(4._dp*m22)&
              &+(5._dp*B0(p2,0._dp,m22))/2._dp-(p2*B0(p2,0._dp,m22))/(2._dp*m22)+(RXi*B0(p2,0._dp,m22))/2._dp+(p2*RXi*B0(p2,0._dp,m22))/(2._dp*m22)& 
              &+(p2*B0(p2,0._dp,m22*RXi))/(2._dp*m22)+(RXi*B0(p2,0._dp,m22*RXi))/2._dp-(p2*RXi*B0(p2,0._dp,m22*RXi))/(2._dp*m22) + (RXi**2*B0(p2,0._dp,m22*RXi))/2._dp
          End if 
          
       End if
    End if
         If (Real(SVVloop,dp).ne.Real(SVVloop,dp)) Write(*,*) "NaN in SVVloop", p2,m12,m22
  End Function SVVloop

Complex(dp) Function VSSloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 

VSSloop=  -4._dp*B00(p2,m12,m22) 

! If (RXi.eq.1._dp) Then 
!   VSSloop=  -4._dp*B00(p2,m12,m22) 
! Else
!   If (p2.gt.0) Then 
!         VSSloop=   -(6*(m12 + m22)*(-1 + RXi) + (2*p2*(-p2 + 3*(m12 + m22)*RXi) + &
!       & 3*(p2 + (m12 - m22)*RXi)*A0(m12) + 3*(p2 - m12*RXi + m22*RXi)*A0(m22) - &
!       & 3*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12,m22))/p2)/9._dp  &
!       &  + rMS*(2._dp/3._dp)*(m12 + m22)*(-1._dp + RXi)
!   Else ! to be added
!      VSSloop= 0._dp
!    End if
! End if
End Function VSSloop

Complex(dp) Function VVSloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 

If (RXi.eq.1._dp) Then 
  VVSloop=  B0(p2,m12,m22) 
Else
  ! VVSloop = B0(p2,m12,m22) - 0.25_dp*(B00(p2,m12,m22) + B00(p2,rxi*m12,m22))/m12  !! Mark
   VVSloop = B0(p2,m12,m22) + (-B00(p2,m12,m22) + B00(p2,m22,rxi*m12))/m12 !! FeynArts
End if

End Function VVSloop


Complex(dp) Function VVVloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 
Real(dp) :: b001

If (RXi.eq.1._dp) Then 
  VVVloop=   -2._dp*rMS*(m12 + m22 - p2/3._dp) + 10._dp*B00(p2,m12,m22) &
     & + (m12+m22+4._dp*p2)*B0(p2,m12,m22)+  A0(m12) + A0(m22)
Else
!   If ((m12.eq.m22).and.(m22.gt.0._dp)) Then 
!       b001 = (-A0(m22)+(p2+m12-m22)*B11(MZ2,m22,m22) + 2._dp*m22*B1(MZ2,m22,m22) - 1._dp/6._dp*(-p2 + 2._dp*m22+4._dp*m22))/8._dp
!       VVVloop =        ((m22*(96._dp*b001*MZ2 + 16._dp*m22*MZ2*rMS - 3._dp*m22**2*(-1._dp + 32._dp*rMS + RXi**2)) + 6._dp*m22*(4*MZ2 + m22*(-3._dp + 4._dp*RXi))*A0(m22) + 6._dp*m22*(-4._dp*MZ2 + m22*(4._dp + 3._dp*RXi))*A0(m22*RXi) +  &
!        &      24._dp*(7._dp*m22**2*MZ2*B0(MZ2,m22,m22) + m22**2*(m22 - 2._dp*MZ2 - 4._dp*MZ2*RXi + m22*RXi**2)*B0(MZ2,m22,m22*RXi) + 12._dp*m22**2*B00(MZ2,m22,m22) - 7._dp*m22*MZ2*B00(MZ2,m22,m22) +  &
!        &         MZ2**2*B00(MZ2,m22,m22) - m22**2*B00(MZ2,m22,m22*RXi) + 9._dp*m22*MZ2*B00(MZ2,m22,m22*RXi) - 2._dp*MZ2**2*B00(MZ2,m22,m22*RXi) - m22**2*RXi*B00(MZ2,m22,m22*RXi) +  &
!        &         MZ2**2*B00(MZ2,m22*RXi,m22*RXi) - 2._dp*m22**2*MZ2*b1(MZ2,m22,m22) - 4._dp*m22**2*MZ2*RXi*b1(MZ2,m22,m22*RXi) - 4._dp*m22*MZ2**2*b11(MZ2,m22,m22) + 4._dp*m22*MZ2**2*b11(MZ2,m22,m22*RXi))))/ &
!        &  (24._dp*m22**2)
!   Else      
    
  If ((p2.gt.0).and.(m12.gt.0_dp).and.(m22.gt.0._dp)) Then 
      VVVloop= ((m12*m22*p2*(-3*m12 - 3*m22 - 40*p2 - 12*(m12 + m22 - 4*p2)*RXi - 9*(m12 + m22)*RXi**2) +  &
     &      6*m22*(-m22**2 - 9*m22*p2 + m12*(-9*m22 + p2*(13 - 2*RXi)) + m12**2*(9 + RXi) + p2**2*(9 + RXi))*A0(m12) -  &
     &      6*m12*(m12**2 + 9*m12*(m22 + p2) - m22**2*(9 + RXi) - p2**2*(9 + RXi) + m22*p2*(-13 + 2*RXi))*A0(m22) +  &
     &      6*(m22*(m22**2 + m22*(9*p2 - m12*RXi) - p2*(-11*m12*RXi + p2*(9 + RXi)))*A0(m12*RXi) + m12*(m12**2 + 9*m12*p2 - 9*p2**2 - (m12*m22 - 11*m22*p2 + p2**2)*RXi)*A0(m22*RXi) -  &
     &         m12**4*B0(p2,m12,m22) - 8*m12**3*m22*B0(p2,m12,m22) + 18*m12**2*m22**2*B0(p2,m12,m22) - 8*m12*m22**3*B0(p2,m12,m22) - m22**4*B0(p2,m12,m22) - 8*m12**3*p2*B0(p2,m12,m22) + &  
     &         32*m12**2*m22*p2*B0(p2,m12,m22) + 32*m12*m22**2*p2*B0(p2,m12,m22) - 8*m22**3*p2*B0(p2,m12,m22) + 18*m12**2*p2**2*B0(p2,m12,m22) + 32*m12*m22*p2**2*B0(p2,m12,m22) +  &
     &         18*m22**2*p2**2*B0(p2,m12,m22) - 8*m12*p2**3*B0(p2,m12,m22) - 8*m22*p2**3*B0(p2,m12,m22) - p2**4*B0(p2,m12,m22) + m12**4*B0(p2,m12,m22*RXi) + 8*m12**3*p2*B0(p2,m12,m22*RXi) -  &
     &         18*m12**2*p2**2*B0(p2,m12,m22*RXi) + 8*m12*p2**3*B0(p2,m12,m22*RXi) + p2**4*B0(p2,m12,m22*RXi) - 2*m12**3*m22*RXi*B0(p2,m12,m22*RXi) + 2*m12**2*m22*p2*RXi*B0(p2,m12,m22*RXi) +  &
     &         2*m12*m22*p2**2*RXi*B0(p2,m12,m22*RXi) - 2*m22*p2**3*RXi*B0(p2,m12,m22*RXi) + m12**2*m22**2*RXi**2*B0(p2,m12,m22*RXi) - 2*m12*m22**2*p2*RXi**2*B0(p2,m12,m22*RXi) +  &
     &         m22**2*p2**2*RXi**2*B0(p2,m12,m22*RXi) + m22**4*B0(p2,m22,m12*RXi) + 8*m22**3*p2*B0(p2,m22,m12*RXi) - 18*m22**2*p2**2*B0(p2,m22,m12*RXi) + 8*m22*p2**3*B0(p2,m22,m12*RXi) +  &
     &         p2**4*B0(p2,m22,m12*RXi) - 2*m12*m22**3*RXi*B0(p2,m22,m12*RXi) + 2*m12*m22**2*p2*RXi*B0(p2,m22,m12*RXi) + 2*m12*m22*p2**2*RXi*B0(p2,m22,m12*RXi) - 2*m12*p2**3*RXi*B0(p2,m22,m12*RXi) +  &
     &         m12**2*m22**2*RXi**2*B0(p2,m22,m12*RXi) - 2*m12**2*m22*p2*RXi**2*B0(p2,m22,m12*RXi) + m12**2*p2**2*RXi**2*B0(p2,m22,m12*RXi) -  &
     &         p2**2*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12*RXi,m22*RXi))))/(72.*m12*m22*p2) -2._dp*(rMS-1._dp)*(m12 + m22 - p2/3._dp)
  Else ! to be added
     Write(*,*) "Warning from VVVloop", p2,m12,m22
     VVVloop= 0._dp
   End if
! End if
End if
End Function VVVloop


Complex(dp) Function VGGloop(p2,m12,m22) 
Implicit None 
Real(dp),Intent(in)::p2,m12,m22 


If (RXi.eq.1._dp) Then 
  VGGloop=  B00(p2,m12,m22) 
Else
  VGGloop=  B00(p2,m12*RXi,m22*RXi) 

!   If (p2.gt.0) Then 
!       VGGloop=   -((2*p2*(p2 - 3*(m12 + m22)*RXi) - 3*(p2 + (m12 - m22)*RXi)*A0(m12*RXi)  &
!       & - 3*(p2 - m12*RXi + m22*RXi)*A0(m22*RXi) +  &
!     &       3*(p2**2 - 2*(m12 + m22)*p2*RXi + (m12 - m22)**2*RXi**2)*B0(p2,m12*RXi,m22*RXi)))/(36.*p2)
!   Else  ! to be added
!          Write(*,*) "Warning from VVSloop", p2,m12,m22
!      VGGloop= 0._dp
!    End if
End if
End Function VGGloop
End Module LoopMasses_LRmodelsLRSSM 
