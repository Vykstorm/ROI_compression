
% Autor: Víctor Ruiz Gómez
% Descripción: Este método aplica una función para cada slice de una
% matriz tridimensional.
% Si la matriz tridimensional X es 3x3x3, primero aplicaría fun sobre
% los elmentos X(:,:,1), luego en X(:,:,2), ...
% La función fun debe devolver un valor (puede devolver cualquier cosa).
% Este método devolverá un array de celdas Y, donde 
% Y(i) será el resultado de la llamada a fun con X(:,:,i)
function [ Y ] = slicefun(X, fun)
	k = size(X,3);
	Y = cell(1,k);
	for i=1:k
		Y(i) = fun(X(:,:,i));
	end;
end
