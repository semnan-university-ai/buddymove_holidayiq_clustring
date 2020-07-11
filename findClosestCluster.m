function [d_x_i_C_k,k] = findClosestCluster( ii, labels, X )
% Amir Shokri
% amirsh.nll@gmail.com
% amirshnll.ir
% github.com/amirshnll
% July 2020
ulabels = unique(labels);
if( ulabels(1)==0 ) 
  ulabels = ulabels(2:end);
end
x_ii_to_cluster = [];
for lab = ulabels,
  inds = find( labels==lab );
  rep  = getClusterRepresentative( inds, X ); 
  d = sqrt( ( X(ii,:)' - rep )' * ( X(ii,:)' - rep ) ); 
  x_ii_to_cluster = [ x_ii_to_cluster, d ]; 
end
[d_x_i_C_k,mind] = min(x_ii_to_cluster); 
k = ulabels(mind);