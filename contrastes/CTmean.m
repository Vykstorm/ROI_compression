function [ contraste ] = CTmean(X)
	%% Esta función calcula el contraste total de una imágen a partir del
	% mapa de contrastes locales X
	% Este método devuelve como contraste total, la media de los contrastes
	% locales. Devuelve 1 si el mapa de contrastes locales es una imágen
	% binaria y existe al menos un valor de contraste local igual a 1
	
	if (prod(prod((X == 0) + (X == 1)))) && (max(max(X)) ~= min(min(X)))
		contraste = 1;
	else
		contraste = sum(sum(X)) / prod(size(X));
	end;
end
