function [slope, constant_term] = create_lines(s)
% lines between any two signal pairs, as
% indicated in the paper (in B) to define the judgement boundary between 
% them
% later, we decide and calculate (manually) the combinations of these lines
% that will give us the decision areas (in our case, the polygons)

% slope (8x8) array has the slope of the lines (k_ij in the paper)
% constant_term (8x8) array has the constant term of the lines (b_ij)

n = length(s);

slope = zeros(n);
constant_term = zeros(n);
for i = 1 : n
    for j = 1 : i-1
        slope(i,j) = ( real(s(j)) - real(s(i)) ) / ( imag(s(i)) - imag(s(j)) );
        slope(j,i) = slope(i,j);
        constant_term(i,j) = sqrt( ( imag(s(i)) + 1 ) * ( imag(s(j)) + 1 ) ) - 1 + ...
            ( real(s(i))^2 - real(s(j))^2 ) / 2 / ( imag(s(i)) - imag(s(j)) );
        constant_term(j,i) = constant_term(i,j);
    end
end

end

