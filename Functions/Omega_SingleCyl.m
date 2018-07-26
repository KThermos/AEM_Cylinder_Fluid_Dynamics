function [ omega ] = Omega_SingleCyl( z, w0, R, z0 )
%OMEGA_SINGLECYL computes the complex potential for a single impermeable
%sphere in a field of uniform flow

r = z-z0;
omega = -(conj(w0)*(R^2/(r)));

if r*conj(r) < R^2
    omega = complex(NaN,NaN);
end

end