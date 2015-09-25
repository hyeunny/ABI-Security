function rheology
timeint=evalin('base','timeint');
number_of_frames=evalin('base','number_of_frames');
rg_cutoff=evalin('base','rg_cutoff');
maxtime=evalin('base','maxtime');
a=evalin('base','maxtime');
dim=evalin('base','dim');
T=evalin('base','T');
clip=evalin('base','clip');
width=evalin('base','width');

conversions_no_dd(basepath,1);
getting_individual_beads(basepath,1);
[MSD,tau]=Mean_SD_many_single_beads(basepath,timeint,number_of_frames,rg_cutoff);
[msdtau]=making_logarithmically_spaced_msd_vs_tau(MSD,tau,maxtime);
[omega,Gs,Gp,Gpp,dd,dda]=calc_G(msdtau(:,1),msdtau(:,2),a,dim,T,clip,width);


figure(1)
plot(log(omega),log(Gp),'--r');hold on;


plot(log(omega),log(Gpp),'--b');


end