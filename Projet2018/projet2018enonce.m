
fontsize = 14;
fontspec = {'fontsize',fontsize,'fontweight','bold'};
m = 5;
xmin = 0;
xmax = 1;
N = 1000;
x = (0:N)/N*(xmax-xmin)+xmin;
a = xmin;
b = xmax;
r = 0.123;
p = 3;

dd = (1:100);
rr = 2.^(-dd);
cc = 1-dd;
xx = zeros(100,5);
niter = 100;
fname = 'fonctionprojet2018';
fprimename = 'deriveeprojet2018';

niter = 100;
for i = 1:100,
   r = rr(i);
   xB = iterationsbissection(fname,a,b,niter,p,r);
   xx(i,1) = xB(niter);
   xC = iterationschord(fname,a,b,niter,p,r);
   xx(i,2) = xC(niter);
   xS = iterationssecant(fname,a,b,niter,p,r);
   xx(i,3) = xS(niter);
   xRF = iterationsregulafalsi(fname,a,b,niter,p,r);
   xx(i,4) = xRF(niter);
   xNR = iterationsNewtonRaphson(fname,fprimename,xB(1),niter,p,r);
   xx(i,5) = xNR(niter);
end

figure(1)
plot(dd,log(abs(xx)),'linewidth',2)
axis([0 100 -20 1])
legend('B','C','S','RF','NR')
set(gca,fontspec{:})

%% (2) iterations de la corde

r = 0.5;
xC = iterationschord(fname,a,b,niter,p,r);
figure(2)
plot(xC,'linewidth',2)
figure(3)
phiC = chord(x,fname,a,b,p,r);
plot(x,phiC,'linewidth',2);
hold on
plot(x,x,'k','linewidth',2)
hold off
axis([0 1 0 1])

%% (3) secante et fausse position
r = 0.22;
xS = iterationssecant(fname,a,b,niter,p,r);
xRF = iterationsregulafalsi(fname,a,b,niter,p,r);

%% (4) Newton-Raphson's iterations diverge
r = 1.e-8;
xB = iterationsbissection(fname,a,b,niter,p,r);
xNR = iterationsNewtonRaphson(fname,fprimename,xB(1),niter,p,r);

figure(2)
umax = xB(niter)*10;
u = (0:1000)/1000*umax;
fprime = feval(fprimename,u,p,r);
f = feval(fname,u,p,r);
phiNR = u-f./fprime;
plot(u,phiNR,'linewidth',2);
hold on
plot(u,u,'k','linewidth',2)
hold off
axis([0 umax 0 umax])

figure(3)
plot(log2(xB),'b','linewidth',2) 
hold on
plot(log2(xNR),'r','linewidth',2)
hold off
legend('B','NR')
set(gca,fontspec{:})

