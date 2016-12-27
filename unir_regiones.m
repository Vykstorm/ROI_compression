
% Autor: Víctor Ruiz Gómez
% Descripción: Este método, a partir de las regiones obtenidas al subdividir 
% la imágen original, es capaz de reconstruir dicha imágen, uniendo las 
% distintas regiones.
% Parámetros: Un array de celdas R que contiene información de las distintas
% regiones (es igual que el valor de retorno de la función regiones).
% También debe indicarse el tamaño S de la imágen original.
% Valor de retorno: La imágen resultante de unir las distintas regiones.
function [ M ] = unir_regiones(R, S)
	M = zeros(S);
	k = size(R,1); % nº regiones.
	
	for i=1:k % Por cada región..
		p = R{i,1};
		x = p(1); y = p(2); % Posición de la región.
		pixels = R{i,2}; % Pixeles de la región.
		[n,m,p] = size(pixels);
		M(x:x+n-1, y:y+m-1,:) = pixels;
	end;
end
