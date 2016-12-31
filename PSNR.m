
% Este método calcula el ratio Peak-Signal-To-Noise de una imágen en la que 
% se ha introducido ruido M, comparandola con la imágen original sin ruido.
function [Q] = PSNR(M, M2)
	Q = 10 * log10((255 * size(M,3))^2/MSE(M,M2));
end

