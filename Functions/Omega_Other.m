function [ omega ] = Omega_Other( z, Rs, z0s, coeffs, n, w0 )
%OMEGA_OTHER Will find the complex potential for a set of impermeable
%cylinders in a uniform flow, ignoring the cylinder represented by n (the nth cylinder in the
%list of cylinders.
%
%   z           the position at which to evaluate the function
%   Rs          a list of radii of cylinders
%   z0s         a list of center locations of cylinders
%   coeffs      an array of lists that represent the coefficients of each
%   of the cylinders.
%   n           the position in the lists of the attributes of the cylinder
%   that is to be skipped. n should be 0 if the contributions from all
%   cylinders is to be computed.
%   
% Note: All Rs, z0s, and coeffs must be in the same order in accordance
% with which cylinder they represent.

numcyl = length(Rs);

omega = Omega_UniFlow(z,w0);

for i = 1:numcyl
    if i ~= n
        R = Rs(i);
        z0 = z0s(i);
        alphas = coeffs{i};
        r = z-z0;
        
        if r*conj(r)<R^2
            omega = complex(NaN,NaN);
        else
            omega = omega + Omega_Mth_Cyl(z,z0,R,alphas);
        end
    end
end

end

