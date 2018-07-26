alpha = 21.5; %degrees
v0 = 20; %meters/day
w0 = PolartoComplex(v0,alpha);

z01 = complex(6,6); %meters from origin
R1 = 1; %meters
z02 = complex(-2,-2); %meters from origin
R2 = 2; %meters
z03 = complex(0.5,0.5); %meters from origin
R3 = 1; %meters

%-----------------------------------------------------------------------------
%This will show the results of Part 1.1

xfrom = 4.5; %meters
xto = 7.5; %meters
nx = 100; %divisions
yfrom = 4.5; %meters
yto = 7.5; %meters
ny = 100; %divisions
nint = 20; %intervals

hold on
ContourMe_flow_net(xfrom, xto, nx, yfrom, yto, ny, @(z)(Omega_UniFlow(z,w0)+Omega_SingleCyl(z,w0,R1,z01)),nint);
circle_c(R1, real(z01),imag(z01));
hold off

%=============================================================================
%This will show the results of Part 1.2

%Put cylinder 1 and cylinder 2 together
Rs = [R1,R2];
z0s = [z01,z02];

%Put cylinder 2 and cylinder 3 together
Rsc = [R2,R3];
z0sc = [z02,z03];

%The two constants if the other sphere was not there.
alpha11 = -conj(w0)*R1;
alpha12 = -conj(w0)*R2;
alpha13 = -conj(w0)*R3;

alphas = [alpha11, alpha12];
alphasc = [alpha12, alpha13];
xfrom = -5;
xto = 10;
Nx = 100;
yfrom = -5;
yto = 10;
Ny = 100;
 nint = 30;

%Plots the cylinders when they are far apart
ContourMe_flow_net(xfrom,xto,Nx,yfrom,yto,Ny,@(z)OmegaPart12(z,Rs,z0s,w0,alphas),nint);
hold on
PlotAllCircles(Rs,z0s);
hold off

%Plots the cylinders when they are close together
ContourMe_flow_net(xfrom,xto,Nx,yfrom,yto,Ny,@(z)OmegaPart12(z,Rsc,z0sc,w0,alphasc),nint);
hold on
PlotAllCircles(Rsc,z0sc);
hold off
%-------------------------------------------------------------------------
%Guess-and-check method is done here for the alpha values.

R1 = 1;
R2 = 2;
z01 = complex(2,2);
z02 = complex(-1,-1);
alpha1 = -conj(w0)*R1;
alpha2 = -conj(w0)*R2;

alphas = [alpha1, alpha2];
Rs = [R1, R2];
z0s = [z01,z02];

xfrom = -4;
xto = 4;
yfrom = -4;
yto = 4;
Nx = 100;
Ny = 100;
nint = 30;

%Plots two cylinders at mid-range using the value for alpha computed as if
%the other cylinder was not there.
ContourMe_flow_net(xfrom,xto,Nx,yfrom,yto,Ny,@(z)OmegaPart12(z,Rs,z0s,w0,alphas),nint);
hold on
PlotAllCircles(Rs,z0s);
hold off

%Plots two cylinders at mid-range with the alpha values found using a
%guess-and-check method.
alphas = [complex(17,-12), complex(30,-25)];
ContourMe_flow_net(xfrom,xto,Nx,yfrom,yto,Ny,@(z)OmegaPart12(z,Rs,z0s,w0,alphas),nint);
hold on
PlotAllCircles(Rs,z0s);
hold off


