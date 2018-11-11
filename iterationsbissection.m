function x = iterationsbissection(fname,a,b,niter,varargin)

% iteratitionsbissection finds zero of function using the bissection method
%  Usage
%    x = iterationsbissection(fname,a,b,niter,varargin)
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
%    help iterationschord
%    help iterationsregulafalsi
%    help iterationssecant
%    help iterationsNewtonRaphson
  
  parametersf = varargin;
  if length(a)==2,
     parametersf = {niter,varargin{:}};
     niter = b; b = a(2); a = a(1);
  end
  
  x = [a zeros(1,niter-1)];
  x(1) = (a + b) / 2; % milieu
  
  
  
  for i = 2:niter,
    fa = feval(fname, a, parametersf{:});           % f(a)
    fb = feval(fname, b, parametersf{:});           % f(b)
    fx = feval(fname, x(i-1), parametersf{:});      % f(x)
    
    if (fa*fx) < 0,                 % a     ici     x              b
      b = x(i-1);
      x(i) = (a + b) / 2;
      
    elseif (fb*fx) < 0,
      a = x(i-1);                   % a             x      ici     b
      x(i) = (a + b) / 2;
     
    else,
      x(i) = (a + b) / 2;
      
  end
  x = x(1:niter);
 
end