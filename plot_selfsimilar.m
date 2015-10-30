
FILE=plot_selfsimilar.m
rm $FILE

for levels in 8
do
for j in  7
do
for k in 0 #1.25 2.5 3.75 5 6.25 7.5 8.75
do
for ub in 1. 10.
do
for mu in 0.1 1 10 #10 #1 10
do
for rho in 0.001 0.01 0.1
do
for sig in 1 #0.1 1 10 #0.1 1 10
do

DIR=velo-ratios2-$levels-$j$k-$ub-$rho-$mu-$sig

for jj in 4 6 8 10
do
grep -v '^#' $DIR-$jj.000.dat  > ttt; mv ttt $DIR-$jj.000.dat
done

cat>>$FILE <<EOF
clear all
close all
clc
X1=[];
Y1=[];
X4=[];
Y4=[];
X6=[];
Y6=[];
X8=[];
Y8=[];
X10=[];
Y10=[];
t4=[];
t6=[];
t8=[];
t10=[];

copyfile('./$DIR-4.000.dat', 's')
t4=load('s');

copyfile('./$DIR-6.000.dat', 's')
t6=load('s');

copyfile('./$DIR-8.000.dat', 's')
t8=load('s');

copyfile('./$DIR-10.000.dat', 's')
t10=load('s');

%---------------------------------------------
f=t4;
if (size(f(:,1)))>0
[mm,index]=max(f(:,3));
nn=length(f(:,2));
dmax=f(index,2);
kk=0;
t5b=[];
ubt=[];
r5b=[];
K5b=[];
for ii=1:nn
    if (f(ii,2)<dmax || f(ii,2)==dmax)
        kk=kk+1;
        t5b(kk)=f(kk,2);
        r5b(kk)=f(kk,3);
    end
end
X4=r5b';
Y4=t5b';
end
%---------------------------------------------
f=t6;
if (size(f(:,1)))>0
[mm,index]=max(f(:,3));
nn=length(f(:,2));
dmax=f(index,2);
kk=0;

t5b=[];
ubt=[];
r5b=[];
K5b=[];

for ii=1:nn
    if (f(ii,2)<dmax || f(ii,2)==dmax)
        kk=kk+1;
        t5b(kk)=f(kk,2);
        r5b(kk)=f(kk,3);
    end
end
X6=r5b';
Y6=t5b';
end
%---------------------------------------------
f=t8;
if (size(f(:,1)))>0
[mm,index]=max(f(:,3));
nn=length(f(:,2));
dmax=f(index,2);
kk=0;
t5b=[];
ubt=[];
r5b=[];
K5b=[];
for ii=1:nn
    if (f(ii,2)<dmax || f(ii,2)==dmax)
        kk=kk+1;
        t5b(kk)=f(kk,2);
        r5b(kk)=f(kk,3);
    end
end
X8=r5b';
Y8=t5b';
end
%---------------------------------------------
f=t10;
if (size(f(:,1)))>0
[mm,index]=max(f(:,3));
nn=length(f(:,2));
dmax=f(index,2);
kk=0;
t5b=[];
ubt=[];
r5b=[];
K5b=[];
for ii=1:nn
    if (f(ii,2)<dmax || f(ii,2)==dmax)
        kk=kk+1;
        t5b(kk)=f(kk,2);
        r5b(kk)=f(kk,3);
    end
end
X10=r5b';
Y10=t5b';
end
%---------------------------------------------
% PLOT AND SAVE
%---------------------------------------------
figure1 = figure;
axes1 = axes('Parent',figure1,'YGrid','on','XGrid','on','FontSize',20);
hold(axes1,'on');
title({'\rho_l=$rho, \theta=$j$k, ub=$ub , \mu_l=$mu'});
ylabel(['          \Theta (\rho) [-]             ';'                                        ';'= \delta (\rho,t) / \delta_{max}(t)     ';'                                        '],...
    'FontWeight','bold');
xlabel(['          \rho [-]                      ';'                                        ';'=(r-r_{min}(t))/(r-r_{max}(t))          '],...
    'HorizontalAlignment','center',...  
    'FontWeight','bold');
hold on
plot((X4-X4(1))/(X4(end)-X4(1)), Y4/Y4(end),'DisplayName','4\mus')
plot((X6-X6(1))/(X6(end)-X6(1)), Y6/Y6(end),'DisplayName','6\mus')
plot((X8-X8(1))/(X8(end)-X8(1)), Y8/Y8(end),'DisplayName','8\mus')
plot((X10-X10(1))/(X10(end)-X10(1)), Y10/Y10(end),'DisplayName','10\mus')
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.251785714285714 0.717857142857144 0.148214285714286 0.175],...
    'FontSize',18);
%---------------------------------------------
print('figure-$DIR.png','-dpng')
%---------------------------------------------
EOF

done
done
done
done
done
done
done
