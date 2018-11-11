
function x = iterationschord(fname,a,b,niter,varargin)

% iteratitionschord finds zero of function using the chord method
%  Usage
%    x = iteratitionschord(fname,a,b,niter,varargin)
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
%    help iterationssecant
%    help iterationsNewtonRaphson

parametersf = varargin;
if length(a)==2, 
   parametersf = {niter,varargin{:}};
   niter = b; b = a(2); a = a(1);
end
x = [a zeros(1,niter)];
for i = 2:niter+1,
   x(i) = chord(x(i-1),fname,a,b,parametersf{:});
end
x = x(2:niter+1);
