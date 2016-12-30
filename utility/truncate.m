
% Este método trunca una matriz X. Los elementos truncados con el valor k
% que se indica como parámetro.
% Si Y es la matriz truncada. Y(i,j) = X(i,j) si i<r y j<c, y
% Y(i,j) = 0 en caso contrario, donde B=[r,c]

function [Y] = truncate(X, B, k)
	[n,m] = size(X);
	Y = X;
	B = min(B, size(X));
	if prod(B) > 0
		r = n-B(1)+1; c = m-B(2)+1;
		Y(r:n,c:m) = k;
	end;
end
