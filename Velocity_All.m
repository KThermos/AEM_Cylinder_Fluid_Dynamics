function [ w ] = Velocity_All( z, Rs, z0s, all_alphas, w0 )
%VELOCITY_ALL Will compute the complex velocity for a field of impermeable
%cylinders in a uniform flow.

w = w0;

num_cyls = length(Rs);

for i = 1:num_cyls
    R = Rs(i);
    z0 = z0s(i);
    if (z-z0)*conj(z-z0)<R^2
        w = complex(NaN,NaN);
    else
        z0 = z0s(i);
        alphas = all_alphas{i};
        Z = CapZ(z,z0,R);
        num_alphas = length(alphas);
        sum = 0;
        for j = 1:num_alphas-1
            alpha = alphas(j+1); %skips alpha0
            sum = sum + alpha*(-j)*Z^(-(j+1));
        end
        w = w - (1/R)*sum;
    end
end
end
