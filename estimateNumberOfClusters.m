function [thetas,numFoundClusters] = estimateNumberOfClusters(X,s,Nsteps, q)
% Amir Shokri
% amirsh.nll@gmail.com
% amirshnll.ir
% github.com/amirshnll
% July 2020
N         = size(X,1);
nFeatures = size(X,2);
Xd = pdist(X, 'euclidean');
a = min(Xd);
b = max(Xd);
thetas           = linspace( a, b, Nsteps );
numFoundClusters = zeros( s, Nsteps ); 
for ti = 1:Nsteps,
  t = thetas(ti); 
  for si = 1:s, 
    labs = BSAS( X(randperm(N),:), t, q ); 
    numFoundClusters(si,ti) = length(unique(labs));
  end
end