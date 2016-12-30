
% Este método trunca los n ultimos valores del vector X con el valor k 
% si n es mayor o igual al número de elementos del vector, todos los elementos
% se truncan con el valor k. 
function [Y] = truncate(X, n, k)
	s = length(X);
	Y = ones(size(X)) * k;
	Y(1:s-n) = X(1:s-n);
end
