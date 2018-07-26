function [ omega] = OmegaPart12( z, Rs, z0s, w0, alphas )
%OMEGAPART12 This function just returns the picture in part 1.2. Two
%cylinders each with a single constant that was computed assuming that the
%other one wasn't there.

omega = Omega_UniFlow(z,w0);


if (z-z0s(1))*conj((z-z0s(1)))> Rs(1)^2
    if (z-z0s(2))*conj((z-z0s(2))) > Rs(2)^2
        omega = omega + alphas(1)/CapZ(z,z0s(1),Rs(1));
        omega = omega + alphas(2)/CapZ(z,z0s(2),Rs(2));
    else
        omega = complex(NaN,NaN);
    end
else
    omega = complex(NaN,NaN);
end


end