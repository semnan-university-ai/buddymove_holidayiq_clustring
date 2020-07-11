function rep = getClusterRepresentative(inds, X)

% Amir Shokri
% amirsh.nll@gmail.com
% amirshnll.ir
% github.com/amirshnll
% July 2020

rep = mean( X(inds,:), 1 )';
end