n=2000;
deltx=0.1;
start=1000;
x=start:deltx:(start+n*deltx);
y=sin(0.05.*x).*(1+0.9.*sin(0.01.*x));
plot(x,y);

