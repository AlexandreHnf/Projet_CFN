
function y = deriveeprojet2018(x,p,c)

s = (p+1)*x.^p-p*x.^(p+1);
sprime = (p+1)*p*(x.^(p-1)-x.^p);
y = pi*sin(pi*s).*sprime;
