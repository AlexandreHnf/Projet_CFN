
function x = iterationsregulafalsi(fname,a,b,niter,varargin)

% iteratitionsregulafalsi finds zero of function using the regula falsi
%  Usage
%    x = iteratitionsregulafalsi(fname,a,b,niter,varargin)
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
%    help iterationschord
%    help iterationssecant
%    help iterationsNewtonRaphson

parametersf = varargin;
if length(a)==2,
   parametersf = {niter,varargin{:}};
   niter = b; b = a(2); a = a(1);
end
x = [a b zeros(1,niter)];
x0 = a; f0 = feval(fname,x0,parametersf{:});
x1 = b; f1 = feval(fname,x1,parametersf{:});
for i = 3:niter+2,
   if abs(x1-x0)>eps,
      x(i) = chord(x(i-1),fname,x0,x1,parametersf{:});
      fi = feval(fname,x(i),parametersf{:});
      if fi*f0>0, f0 = fi; x0 = x(i); else, f1=fi; x1 = x(i); end
   else
      x(i) = x(i-1);
   end
end
x = x(3:niter+2);
