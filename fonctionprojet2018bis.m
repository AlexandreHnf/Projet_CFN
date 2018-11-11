
function y = fonctionprojet2018bis(x,p,r)

% f(x) = 1-r-cos[pi( px^(p+1)-(p+1)x^p )]

s = (p+1)*x.^p-p*x.^(p+1);

g = pi*s;
y = 2*sin(g/2).^2 - r; 
