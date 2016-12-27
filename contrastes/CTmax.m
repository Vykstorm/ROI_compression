function [ contraste ] = CTmax(X)
	%% Esta función calcula el contraste total de una imágen a partir del
	% mapa de contrastes locales X
	% Este método devuelve básicamente como contraste total, el contraste
	% local máximo encontrado.
	contraste = max(max(X));
end
