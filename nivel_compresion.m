
% Este método calcula el nivel de compresión a utilizar sobre los píxeles
% de cada región, normalizado en el rango [0, 1). El valor 0 indicará que los píxeles
% de la región no deben comprimirse. Valores intermedios en el intervalo [0, 1) indican
% que debe llevarse a cabo compresión. e.j: si el nivel de compresión es 1/2, habrá que
% comprimir la región para transmitir solo el 50% de la información.  
% Nota: Si s es el nº de pixeles en la región. El nivel de compresión máximo que se puede
% dar es 1 - 1/s (al menos se ha de transmitir información equivalente a un 1 pixel por cada
% región)
%
% Para el calculo de este valor, se utilizan dos variables:
% - Proporción de pixeles que pertenecen a algún objeto y no al fondo:
% Cuantos más pixeles haya que pertenezcan a algún objeto, menor nivel de compresión,
% y cuantos más pixeles de fondo, mayor nivel de compresión.
% - Medida de contraste de los píxeles de la región: A más contraste menos nivel
% de compresión, cuanto menos contraste,  más compresión.

% Devuelve un vector columna. El elemento j-ésima indica el nivel de compresión para
% la región j-ésima
% Toma como parámetro una matriz de celdas nx2 donde n es el número de regiones.
% La primera columna debe almacenar una subimagén de los pixeles de la región correspondiente.
% La segunda debe ser un mapa de cada una de las regiones. Será una matriz donde la posición
% (x,y) tenga el valor 0, si el pixel en la posición (x,y) de la región pertenece al fondo, o un
% valor distinto > 0 si pertenece a alguno de los objetos de la imágen.
function [L] = nivel_compresion(R)
	nr = size(R,1);
	L = zeros(nr,1);
	
	for i=1:nr
		M = R{i,1};
		C = R{i,2};
		[n,m] = size(M);
		
		% Proporción de píxeles que pertenecen a algún objeto de la imágen
		p = sum(sum(C > 0)) / (n*m);
		
		% Contraste total de la región de píxeles.
		CT = CTmean(filtro(mean(M,3)/255, [3, 3], @CL1));
		
		% Este parámetro determina como debe aumentarse el nivel de compresión
		% a medida que la cantidad de píxeles de la región que no pertenecen al fondo
		% de la imágen se reduce.
		alpha = 4;
		
		% Este parámetro establce como debe reducirse el nivel de compresión a medida
		% que aumenta el contraste de los pixeles de la región.
		theta = 0.3;
		
		% Este parámetro establece la importancia que se le da a la proporcion 
		% de píxeles que pertenecen a algún objeto de la imágen en la región para el calculo
		% del nivel de compresión. 1-beta será la importancia que se la da al contraste
		% para calcular el nivel de compresión.
		beta = 0.7;
		
		l = beta * ((1-p)^alpha) + (1-beta) * (1 - CT^theta);
		
		% Ajustamos el nivel de compresión. Como máximo será 1-1/s donde s es el nºpixeles
		s = n * m;
		l = min(l, 1-1/s);
		
		L(i) = l;
	end;
end
