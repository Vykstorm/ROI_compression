%
% Autor: Víctor Ruiz Gómez
% Descripción: Este método realiza una división de la imágen de entrada
% usando el algoritmo quadtree. La imágen original se subdivide en 4.
% Cada una de estas divisiones se subdivide de forma recursiva en otras 
% 4 divisiones. Esta división continua hasta que cierto criterio se satisfaga.

% Dada una región de la imágen M, se subdividirá en cuatro regiones 
% M1, M2, M3, M4, si y solo si se cumple cierto criterio -> f(M) = 1.
% Si f(M) es por el contrario 0, M no se subdivide.
% 
% Si contruimos un árbol cuaternario de forma que la raíz reprsenta la imágen
% original, y un nodo de este (M), tiene cuatro hijos M1, M2, M3, M4 si se cumple
% que f(M) = 1, entonces...
% Este método devuelve la información sobre las hojas de este árbol, es decir,
% aquellas regiones M que satisfagan f(M) = 0

% Parámetros de entrada:
% - M es un mapa de valores que se usaráa para determinar si
% una región debe subdividirse más o no.
% - M2 es la imágen real de la que posteriormente se extraeran los pixeles de las regiones,
%  si M ~= M2 (tanto M como M2 deben tener las mismas dimensiones)
% - Criterio de división F(M) -> {0, 1} Es 1 si M debe subdividirse, 0 en caso contrario.
% % Valor de retorno: (proporciona información sobre la divisón en regiones realizada...)
% - Un array de celdas (rxe) donde r es el número de regiones en las que se ha dividido la
% imágen. La primera columna de cada región indica en que posición se encuentra, 
% en relación con la imágen original (x,y) (es un vector de 2 componentes)
% La segunda columna es una matriz con los pixeles de la región correspondiente.
% La tercera, es una submatriz del mapa M de la región correspondiente.
function [R] = regiones(M, M2, f)
	[n,m] = size(M);
	F = @(D) cell2mat(slicefun(f, D));

	S = reshape(full(qtdecomp(M, F))', 1, []);
	P = find(S > 0);
	P = [floor((P-1)/m) + 1; mod(P-1, m) + 1]';
	k = size(P,1); % nº regiones identificadas (hojas del árbol quadtree)
	
	R = cell(k, 3);
	R(:,1) = mat2cell(P, ones(1,k), 2);
	
	% Obtenemos los píxeles de cada región...
	for i=1:k
		x = P(i,1); y = P(i,2); % Posición de la región en la imágen
		l = S((x-1)*m + y);  % Tamaño de la región
		pixels = M2(x:x+l-1, y:y+l-1, :); % Píxeles de la región.
		R{i,2} = pixels;
		R{i,3} = M(x:x+l-1, y:y+l-1);
	end;
end 
