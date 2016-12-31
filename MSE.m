
% Se calcula el Mean-Square-Error de una imágen dada M, siendo M2 la
% imagen original.
function [E] = MSE(M, M2)
	E = sum(sum(sum((M2-M).^2))) / prod(size(M));
end
