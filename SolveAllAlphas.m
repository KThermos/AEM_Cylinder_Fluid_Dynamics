function [ newAlphas ] = SolveAllAlphas( Rs, z0s, oldAlphas, funcOther, tol, N, iteration)
%SOLVEALLALPHAS This function will iteratively solve for all alphas of all
%cylinders in the system until no alpha values are changing by more than
%the tolerance value (tol).
%
% % Rs is an array of radius lengths for each of the cylinders
%
% % z0s is an array of locations of centers of cylinders
%
% % oldAlphas is an array of lists of the different alpha values for each
% cylinder.
%
% % funcOther is the function that computes the value of the complex
% potential of all other items in the aquifer
%
% % tol is the amount by which alpha values cannot vary if the system is
% converged.
%
% % iteration is the number of times that the function has been called.
% When calling this function for the first time, this number should be 0.
%
% % N is the number of divisions that should be used in the numerical
% approximation of the Cauchy integral.

count = 0;
newAlphas = oldAlphas; %just to allocate the correct amount of space.

for j = 1:length(Rs)
    alphas = oldAlphas{j};
    num_alphas = length(alphas);
    Rj = Rs(j);
    z0 = z0s(j);
    
    
    nAlphas = PopulateAlphas(N,@(z)funcOther(z,newAlphas,j), Rj, z0, num_alphas);
    
    count = count + CheckChange(nAlphas, alphas, tol);
    
    newAlphas{j}=nAlphas;
end
    
iteration = iteration + 1;
    
%Check if converged. Check if max num of iterations had been reached.

if count > 0 %it hasn't converged
    if iteration > 400
        warning('The maximum number of iterations has been reached!');
    else
        SolveAllAlphas( Rs, z0s, newAlphas, funcOther, tol, N, iteration);
    end
end

end