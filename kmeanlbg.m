% KMEANLBG Vector quantisation using the Linde-Buzo-Gray algorithm [X,ESQ,J]=(D,K)
% 
% Inputs:
%  D contains data vectors (one per row)
%  K is number of centres required
% 
% Outputs:
%  X is output row vectors (K rows)
%  ESQ is mean square error
%  J indicates which centre each data vector belongs to
 function[x,esq,j]=kmeanlbg(d,k)
nc=size(d,2);
[x,esq,j]=v_kmeans(d,1);
m=1;
while m<k
    n=min(m,k-m);
    m=m+n;
    e=1e-4*sqrt(esq)*rand(1,nc);
    [x,esq,j]=v_kmeans(d,m,[x(1:n,:)+e(ones(n,1),:);x(1:n,:)-e(ones(n,1),:);x(n+1:m-n,:)]);
end