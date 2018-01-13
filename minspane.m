function [p,s]=minspane(x)
%MINSPANE calculate minimum spanning tree using euclidean distance [p,s]=X
 %
 % Inputs:  x(n,d)    d-dimensional data points, one per row
 %
 % Outputs:  indices of the parent of each node within the tree
 %                      (data point n is the root)
 %          s(n-1,1)  list of the edges in ascending order of euclidean
 %                      distance. Thus the shortest edge goes from node
 %                      s(1) to node p(s(1))
 %

[np,nd]=size(x);
 t=delaunayn(x); % nd+1 vertices per polytope
 nt=size(t,1);
 cn=choosenk(nd+1,2);
 nf=size(cn,1);
ee=zeros(nt,nf,2);     % space for all the edges
ee(:,:,1)=t(:,cn(:,1));
ee(:,:,2)=t(:,cn(:,2));
ee=reshape(ee,[],2);
mk=ee(:,1)>ee(:,2);
ee(mk,:)=ee(mk,2:-1:1); % make all edges in ascending order
% ees=sparse(ee(:,1),ee(:,2),1);      % remove duplicates
 [er,ec]=find(sparse(ee(:,1),ee(:,2),1));      % remove duplicates
 ee=[er,ec];
 ne=size(ee,1);
 
 % now apply Kruskal shortest spanning tree algorithm
 
 sz=sum((x(ee(:,1),:)-x(ee(:,2),:)).^2,2);     % length^2 of each edge
 [vz,mz]=sort(sz);
 ee=ee(mz,:);        % sort edges into ascenging length order
 ts=ones(ne,1);      % size of each component
 tp=zeros(np,1);     % root node links
 ei=zeros(np-1,1);     % index of shortest spanning tree edges
 k=0;
 for i=1:ne
   i1=ee(i,1);
   j=tp(i1);
    while j         % find root node for ee(i,1)
         i1=j;
         j=tp(i1);
     end
     i2=ee(i,2);
     j=tp(i2);
     while j         % find root node for ee(i,2)
         i2=j;
         j=tp(i2);
     end
     if i1~=i2       % if they are different, merge them
         k=k+1;
         ei(k)=i;    % add to the shortest spanning tree
         if ts(i1)>ts(i2)
             tp(i2)=i1;          % make i2 a sub tree of i1
             ts(i1)=ts(i1)+ts(i2);
         else
            tp(i1)=i2;          % make i1 a sub tree of i2
             ts(i2)=ts(i1)+ts(i2);
         end
    end
 end
 ee=ee(ei,:);        % refine the edges to include only those in the minimum spanning tree
 
 % now arrange as a tree with point np as the head
 
 eet=sparse(ee(:,1),ee(:,2),1:np-1,np,np);
 p=zeros(np-1,1);              % points to parent node
 s=zeros(np-1,1);              % sorted index
chn=np;                                 % start with the root node of the tree
 [rf,cf]=find(eet(:,chn));               % find any nodes that connect to it
 [rg,cg]=find(eet(chn,:));
while ~isempty(rf) || ~isempty(rg)
    p(rf)=chn(cf);                      % set the parents
     rcf=rf(:)+np*(chn(cf(:))-1);
    s(eet(rcf))=rf(:);
     eet(rcf)=0;                         % delete the edges linking them to their parents
     p(cg)=chn(rg);
    rcg=chn(rg(:))+np*(cg(:)-1);
    s(eet(rcg))=cg(:);
    eet(rcg)=0;
    chn=[rf(:); cg(:)];                 % now search for their children
    [rf,cf]=find(eet(:,chn));
     [rg,cg]=find(eet(chn,:));
 end