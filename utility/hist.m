% Este método devuelve el histograma de un conjunto de datos de
% entrada. 
% Devuelve como retorno, por un lado, un vector columna Y con los datos
% que aparecen al menos una vez en X y otro vector columna H con su frecuencia
% correspondiente
function [Y, H] = hist(X)
	X = reshape(X, 1, []);
	Y = unique(X)';
	k = length(Y);
	
	H = zeros(size(Y,1),1);
	for i=1:k
		H(i) = sum(X == Y(i)) / k;
	end;
end
