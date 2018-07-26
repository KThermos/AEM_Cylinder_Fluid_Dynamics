function [  ] = circle_c( R,x0,y0 )
%This routine plots a circle of radius R, centered at x0, y0.
%Add hold on either after or before plotting if you wish the circle to be
%plotted over other material.

t=0:pi/20:2*pi;
plot(R*cos(t)+x0,R*sin(t)+y0,'LineWidth',2);
axis equal;

end

