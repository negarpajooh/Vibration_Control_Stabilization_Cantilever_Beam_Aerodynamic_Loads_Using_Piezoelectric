function  y=GeomFunc(x1,x2)
xmin=x1;
xmax=x2;
fun1=@(x) sin(x);
fun2=@(x) x;
y1=integral(fun1,xmin,xmax);
y2=integral(fun2,xmin,xmax);
y=[y1;y2];
end