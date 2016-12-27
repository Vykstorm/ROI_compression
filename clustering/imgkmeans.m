function [ I ] = imgkmeans( img, q, alpha )
    % Este funci�n aplica el m�todo k-means sobre una im�gen RGB de entrada
    % clasificando los pixeles con q clusteres, teniendo en cuenta la
    % vecindad a la hora de clasificar los pixeles.
    % alpha es un par�metro del k-means que determina cuanta importancia se
    % le da a la vecindad de cada pixel a la hora de clasificar
    % Devuelve como resultado los indices de los clusteres de cada pixel.

	d = size(img,3); % nº componentes
	n = prod(size(img)) / d; % nº pixeles
	X = permute(reshape(img, [n 1 d]), [1 3 2]);
    
    % Obtenemos la im�gen suavizada.
    kernel_size = [3 3];
    kernel = ones(kernel_size) / prod(size(kernel_size));
	X2 = permute(reshape(filtro2(img, kernel), [n 1 d]), [1 3 2]);
		
	% Seleccionamos aleatorioamente q pixeles para formar los centroides.
	U = X(randperm(n, q),:);
	
	% Lanzamos el algoritmo K-means
	I = reshape(kmeans(X, X2, U, alpha), [size(img,1) size(img,2)]);
end

