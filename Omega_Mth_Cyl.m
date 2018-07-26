function [ omega ] = Omega_Mth_Cyl( z, z0, R, alphas )
%OMEGA_MULTICYL This function will compute the contribution to the complex 
%potential from one of multiple impermeable cylinders, given the set of 
%constants alpha.

r = z-z0;
Z = CapZ(z,z0,R);

endIter = length(alphas);

omega = 0;
if (r * conj(r)) < R^2
    omega = NaN;
else
    for i = 1:endIter-1
        term = alphas(i+1)*(1/Z^(i));
        omega = omega + term;
    end
end

end