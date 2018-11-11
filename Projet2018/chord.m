function y = chord(x,fname,a,b,varargin),

% chord - constructs the functions phi(x) = x-(b-a)/[f(b)-f(a)]*f(x);
%  Usage
%     y = chord(x,fname,a,b,parametersf);
%  Inputs
%    x           vector of abscissae
%    fname       name of (external) function 
%    a,b         left and right end points of interval
%    parametersf optional parameters of function
%  Outputs
%    y           values of phi(x)
%  Description
%  Note
%  See also:
%    help iterationschord
%    help iterationsregulafalsi
%    help iterationssecant

parametersf = varargin;
if length(a)==2,
   parametersf = {b,varargin{:}};
   b = a(2); a = a(1);
end


fa = feval(fname,a,parametersf{:}); fb = feval(fname,b,parametersf{:});
fx = feval(fname,x,parametersf{:});
y = x - (b-a)/(fb-fa)*fx;

