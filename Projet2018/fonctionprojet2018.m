
function y = fonctionprojet2018(x,p,r)

% f(x) = 1-r-cos[pi( px^(p+1)-(p+1)x^p )]

s = (p+1)*x.^p-p*x.^(p+1);
y = 1-r-cos(pi*s);
