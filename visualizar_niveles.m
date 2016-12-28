
%
% Este método muestra en una ventana, el nivel de compresión que se utilizará
% en cada una de las regiones. Se mostrará la imágen en escala de grises. 
% Cuanto más nivel de compresión se utilice en una región concreta de la imágen,
% más oscura aparecerá.
% Toma como parámetro un array de celdas nx3, donde n es el número de regiones.
% La primera columna almacena un vector [x,y] que indica la posición de la región relativa a la
% imágen original.
% La segunda columna almacena una subimagen con los píxeles de la región correspondiente
% La última indica el nivel de compresión a utilizar en la región en el rango [0, 1].
% También debe indicarse como parámetro la imágen original.
function visualizar_niveles(M, R)
	[n,m,p] = size(M);
	nr = size(R,1);
	M2 = zeros(n,m);
	
	for i=1:nr
		p = R{i,1};
		pixels = R{i,2};
		L = R{i,3};
		x = p(1); y = p(2);
		[n,m,p] = size(pixels);
		M2(x:x+n-1,y:y+m-1) = L;
	end;
	figure;
	imshow(uint8(M2*255));
end
