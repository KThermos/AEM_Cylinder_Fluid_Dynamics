function [ p ] = Pressure_All( z, Rs, z0s, all_alphas, w0, H )
%PRESSURE_ALL Will compute the pressure at a point z in a field of uniform
%flow and multiple cylinders

g = 9.81; %m/s^2
rho = 1000; %kg/m^3

w = Velocity_All(z,Rs,z0s,all_alphas,w0);
velocitySquared = w*conj(w);

p = rho * g * (H-(velocitySquared/(2*g)));

end

