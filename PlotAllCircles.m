function [  ] = PlotAllCircles( Rs, z0s )
%PLOTALLCIRCLES This will plot a series of circles that are specified by
%the radii in Rs and the centers in z0s.

num_circles = length(Rs);

for i = 1:num_circles
    R = Rs(i);
    z0 = z0s(i);
    x = real(z0);
    y = imag(z0);
    circle_c(R,x,y);
end

end

