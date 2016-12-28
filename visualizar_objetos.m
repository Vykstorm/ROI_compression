
%% Esta función muestra los objetos en distintos colores en la escala de grises, y
% el fondo de la imágen de color blanco.
% Toma como parámetro, un mapa con el resultado de la clasificación de los 
% píxeles de la imágen. Un 0 en la posición (x,y) del mapa debe indicar que
% el píxel forma parte del fondo, y un valor > 1 si forma parte de un objeto.
function visualizar_objetos(C)
	nc = length(unique(C));
	figure;
	imshow(uint8((1 - (C/(nc-1))) * 255));
end
