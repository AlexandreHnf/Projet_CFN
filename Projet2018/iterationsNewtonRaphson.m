
function x = iteratitionsNewtonRaphson(fname,fprimename,x0,niter,varargin)

% iteratitionsNewtonRaphson finds zero of function using Newton-Raphson
%                           iterations
%  Usage
%    x = iteratitionsNewtonRaphson(fname,fprimename,x0,niter,varargin)
%  Inputs
%    fname      name of (external) function 
%    fprimename name of the derivative function
%    x0         starting point
%    niter      number of iterations
%    varargin   optional parameters of function
%  Outputs
%    x        iteration values
%  Description
%    search for zero(s) of function f(x) specified by fname on the interval
%    [a,b]
%  Note
%    This version assumes that the definitions of f and fprime involve the same
%    set of parameters.
%  See also:
%    help iterationschord
%    help iterationsbissection
%    help iterationsregulafalsi
%    help iterationssecant

parametersf = varargin;
x = [x0 zeros(1,niter)];
for i = 2:niter+1,
   x(i) = x(i-1) - feval(fname,x(i-1),parametersf{:})/...
                   feval(fprimename,x(i-1),parametersf{:});
end
x = x(2:niter+1);
