clear;

alpha = 0; %degrees
v0 = 20; %meters/day
w0 = PolartoComplex(v0,alpha);

Rs = [1, 2, 4, 3, 5, 2,1,3,4,1];
z0s = [complex(3,3), complex(-2,-2), complex(-16,2),complex(6,-15),complex(20,-3), complex(-14,-14),complex(0,15),complex(10,12), complex(-10,20), complex(20,-13)];
%all_alphas = {[1,1,1,1,1,1,1,.5],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1] };
tol = .001;
N = 30;

num_cyls = length(Rs);
all_alphas = cell(1,num_cyls);
for i = 1: num_cyls
    all_alphas{i}=[1,1,1,1,1,1,1,1];
end


%solves iteratively for the correct set of alphas.
final_alphas = SolveAllAlphas(Rs,z0s,all_alphas,@(z,alphas,n)Omega_Other(z,Rs,z0s,alphas,n, w0),tol,N,0);


%Sets up the plot
xfrom = -20;
xto = 25;
Nx = 250;
yfrom = -20;
yto = 25;
Ny = 250;
nint = 35;


% %Plots the cylinders
% %ContourMe_flow_net(xfrom, xto,Nx,yfrom,yto,Ny,@(z)Omega_Other(z,Rs,z0s,final_alphas,0, w0),nint);
% ContourMe_I_nint(xfrom, xto,Nx,yfrom,yto,Ny,@(z)Omega_Other(z,Rs,z0s,final_alphas,0, w0),nint);
% 
% hold on
 % PlotAllCircles(Rs,z0s);
% hold off
% 
% ContourMe_I_nint(1,5,Nx,1,5,Ny,@(z)Omega_Other(z,Rs,z0s,final_alphas,0, w0),nint);
% hold on
% PlotAllCircles([1],[complex(3,3)]);

%-----------------------------------------------------------------------------
%Plotting pressure

H = v0^2/(2*9.81);

%contourMe_R_nint(xfrom, xto, Nx, yfrom, yto, Ny, @(z)abs(Velocity_All(z,Rs,z0s,final_alphas,w0)),nint);
contourMe_R_nint(1, 5, Nx, 1, 5, Ny, @(z)abs(Velocity_All(z,Rs,z0s,final_alphas,w0)),nint);
%contourMe_R_nint(xfrom, xto, Nx, yfrom, yto, Ny, @(z)Pressure_All(z,Rs,z0s,all_alphas,w0,H),nint);
contourMe_R_nint(1, 5, Nx, 1,5, Ny, @(z)Pressure_All(z,Rs,z0s,all_alphas,w0,H),nint);
% hold on
% PlotAllCircles(Rs,z0s);
% hold off

