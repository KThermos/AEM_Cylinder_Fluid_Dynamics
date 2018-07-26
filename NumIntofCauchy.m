function [ anj ] = NumIntofCauchy(N, n, funcOther, Rj, zj)
%NUMINTOFCAUCHY Is the numerical integration of the Cauchy integral. 
% % 
% % N is the number of segments that the closed circle object should be
% % divided into for this numerical integration 
% 
% % n is the index of the constant that is to be solved for 
% 
% % funcOther is a function handle for the function describing all other
% % elements apart from the one being solved for
% 
% % Rj is the radius of the object being solved for

dtheta = (2*pi)/N;
sum = 0; %initializing the sum

if n == 0
    
    anj = real(funcOther(zj));
    
else
    
    for k = 1:N
        thetak = k*dtheta;
        zk = zj+exp(1i*k*dtheta)*Rj;
        sum = sum + funcOther(zk)*exp(-1i*n*thetak);
    end
    
    anj = (1/N)*sum;
end

end