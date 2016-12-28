
% Esta función clasifica los pixeles en dos clases: fondo/objeto.
% Los pixeles que pertenecen al fondo de la imágen se clasificarán a la primera
% clase. En cambio, los píxeles que pertenecen a alguno de los objetos de la
% misma, se clasificarán como de la segunda clase.

% Parámetros: La imágen M cuyos píxeles queremos clasificar, y el número de objetos n
% que hay en la imágen (se aplicará el kmeans con n+1 clusteres, uno para el fondo)

% Retorno: Devuelve un mapa de los píxeles de la imágen, donde la posición (x,y),
% es 0 si el pixel pertenece al fondo de la imágen, o j > 1 si pertenece al objeto
% j-ésimo de la imágen.
function [C] = clasificar ( M, n )
	%% Usamos el algoritmo K-means para clasificar.
	
	% Nº clusteres. 
	q = n + 1;
	
	% Importancia que se le da a la vecindad de cada píxel
	% a la hora de clasificar.
	alpha = 10;
	
	C = imgkmeans(M, q, alpha);
	
	%% Ahora tenemos agrupados los píxeles en clústeres. 
	% Tenemos que identificar que cluster tiene los píxeles del fondo de la imágen y
	% que clústeres tienen los píxeles de los objetos de la imágen.
	% IDEA: Usar una medida de contraste total. Los píxeles del fondo tendrán un contraste global
	% inferior que los píxeles en los objetos.
	
	% Calculamos el mapa de contrastes locales.
	
	% Función de contraste local
	L = @CL1;
	
	% Función de contraste total
	T = @CTmean;
	
	% Tamaño de vecindad para el calculo de contrastes locales por píxel
	V = [3, 3];
	
	CL = filtro(mean(M,3)/255, V, @CL1);
	
	% Calculamos el contraste total por cada clúster.
	CT = zeros(1,q);
	
	A = logical(bsxfun(@eq, C, permute(1:q, [1, 3, 2])));
	for i=1:q
		CT(i) = CTmean(CL(A(:,:,i)));
	end;

	% Ordenamos los clústeres por el contraste total calculado de los píxeles que 
	% pertenecen a este.
	[CT, I] = sort(CT, 'ascend');
	C = changem(C, 1:q, I) - 1;
end;
