
function [demodData] = demodulate(r, s, section_points)
%calculate and initialize auxiliary variables
nr = length(r);
ns = length(s);
demodData = zeros(nr,1);
xq = real(r);
yq = imag(r);
%check in which decision area the demodulated symbol belongs to 
%every area is denoted by a (different) polygon
for i = 1 : ns
    xv = section_points{i,1};
    yv = section_points{i,2};
    [in,on] = inpolygon(xq,yq,xv,yv);
    index = in == 1 | on == 1;
    demodData(index) = i;
end
end

