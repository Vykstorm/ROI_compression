
% Autor: Víctor Ruiz Gómez
% Descripción: Este método permite visualizar las regiones obtenidas al
% decomponer una imágen.
% Toma como parámetro la imágen original y la información sobre la división de
% la imágen en regiones (valor de retorno del método regiones)

function visualizar_regiones (M, R)
	
	figure;
	imshow(uint8(M));
	hold on;
	
	k = size(R,1);
	for i=1:k  % Mostramos cada región..
		p = R{i,1};
		x = p(1); y = p(2);
		[n,m,p] = size(R{i,2});
		rectangle('Position', [y,x,n,m], 'LineWidth', 2, 'EdgeColor', 'g');
	end;
end;
