
function x = iterationssecant(fname,a,b,niter,varargin)

% iteratitionssecant finds zero of function using the secant method
%  Usage
%    x = iteratitionssecant(fname,a,b,niter,varargin)
%  Inputs
%    fname      name of (external) function 
%    a,b        left and right end points of interval
%    niter      number of iterations
%    varargin   optional parameters of function
%  Outputs
%    x        iteration values
%  Description
%    search for zero(s) of function f(x) specified by fname on the interval
%    [a,b]
%  Note
%  See also:
%    help iterationsbissection
%    help iterationsregulafalsi
%    help iterationschord
%    help iterationsNewtonRaphson

parametersf = varargin;
if length(a)==2,
   parametersf = {niter,varargin{:}};
   niter = b; b = a(2); a = a(1);
end
x = [a b zeros(1,niter)];
for i = 3:niter+2,
   if abs(x(i-2)-x(i-1))>eps,
      x(i) = chord(x(i-1),fname,x(i-2),x(i-1),parametersf{:});
   else
      x(i) = x(i-1);
   end
end
x = x(3:niter+2);
