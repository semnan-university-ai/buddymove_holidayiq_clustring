function labels = TTSAS(X,theta1,theta2)

% Amir Shokri
% amirsh.nll@gmail.com
% 
% github.com/amirshnll
% July 2020

N         = size(X,1);
nFeatures = size(X,2);
m             = 0;
is_labeled    = zeros(N,1);
prev_change   = 0;
cur_change    = 0; 
exists_change = 0; 
labels        = zeros(1,N); 
while( sum(is_labeled)<N )
  first_in_while_loop = 1; 
  for ii=1:N
    if( is_labeled(ii)==0 && first_in_while_loop==1 && exists_change==0 )
      first_in_while_loop = 0; 
      m              = m+1; 
      labels(ii)     = m; 
      is_labeled(ii) = 1; 
      cur_change     = cur_change + 1; 
    elseif( is_labeled(ii)==0 )
      [d_x_i_C_k,k] = findClosestCluster( ii, labels, X ); 
      if( d_x_i_C_k < theta1 )
	labels(ii)     = k; 
	is_labeled(ii) = 1; 
	cur_change     = cur_change + 1; 
      elseif( d_x_i_C_k > theta2 )
	m              = m+1; 
	labels(ii)     = m; 
	is_labeled(ii) = 1; 
	cur_change     = cur_change + 1; 
      end
    elseif( is_labeled(ii)==1 )
      cur_change = cur_change + 1; 
    else
      fprintf('should never get here\n'); 
    end
  end
  exists_change = abs( cur_change - prev_change ); 
  prev_change   = cur_change; 
  cur_change    = 0;
end