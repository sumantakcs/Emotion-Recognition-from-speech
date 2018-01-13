function k=lpccoef_parcor(p,alpha)
%
% function to convert from lpc polynomial coefficients to parcor
% coefficients
%
% Inputs:
%   p=lpc order
%   a=set of lpc coefficients for p-th order solution, A(z)=1-sum(i=1 to p)
%   a-sub-i times z.^(-i)
% Output:
%   k=set of parcor coefficients

% initialize alpha array
    a(1:p,1:p)=0;
    a(1:p,p)=alpha(1:p);
    k(p)=a(p,p);
    
% run the recursion backwards (from p-th order solution to first order
% solution; end result is the set of k's
    for i=p:-1:2
        for j=1:i-1
            a(j,i-1)=(a(j,i)+k(i)*a(i-j,i))/(1-k(i).^2);
        end
          k(i-1)=a(i-1,i-1);
    end
end
