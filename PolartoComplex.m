function [ comp ] = PolartoComplex( mag, angle )
%POLARTOCOMPLEX This function converts locations from polar to complex
%format

comp = mag*exp(-1i*angle);
end

