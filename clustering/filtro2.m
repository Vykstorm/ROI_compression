function [ img2 ] = filtro2( img, kernel )
    %% Esta función filtra una imagen usando la matriz de convolución indicada.
    % Devuelve la imágen filtrada.
    
    %[m, n] = size(img);
    %[p, q] = size(kernel);
    
    % Añadimos filas y columnas a la imágen para poder aplicar el filtro
    % sobre los píxeles en los bordes de la imágen. 
    %img = padarray(img, [(p-1)/2, (q-1)/2], 'replicate');
    
    % Aplico el filtro sobre cada pixel de la imágen.
    %img2 = zeros(m,n);
    %for i=1:m
    %    for j=1:n
    %        vecindad = img(i:i+(p-1), j:j+(q-1));
    %        img2(i,j) = sum(sum(vecindad .* kernel));
    %    end;
    %end;
  
    img2 = imfilter(img, kernel);
end

