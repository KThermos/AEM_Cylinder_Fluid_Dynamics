function [ newAlphas ] = PopulateAlphas( N, funcOther, Rj, z0j, nalphas )
%POPULATEALPHAS This function will compute the alphas for a specific
%cylinder (j). It will return an array of these alphas (newAlphas). 
%
% % N is the number of evaluation points you want along each discretized
% cylinder
%
% % funcOther is a function that will return the complex potential due to
% everything else in the aquifer.
%
% % Rj is the radius of the cylinder that we are evaluating
%
% % z0j is the locatin of the center of the cylinder we are evaluating
%
% % nalphas is the number of alpha values that should be in newAlphas

newAlphas = NaN(1, nalphas);

for i = 0:(nalphas-1)
    
    anj = NumIntofCauchy(N, i, @(z)funcOther(z), Rj, z0j);
    alphanj = conj(anj);
    newAlphas(i+1) = alphanj;
    
end

end

