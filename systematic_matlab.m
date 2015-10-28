MAINDIR=$PWD
FD=RATIOS_INTERFACE_POSITION
FV=RATIOS_INTERFACE_PHYSICS
mkdir $FD
mkdir $FV
FM=PLOT_MICROLAYER


FILE=plot_Rc_subplot.m
rm $FILE

cat>>$FILE <<EOF
clear all
close all
clc
EOF



for levels in 8
do
for j in 7
do
for k in 0 #1.25 2.5 3.75 5 6.25 7.5 8.75
do
for ub in 1. 10.
do
for mu in 0.1 1 10 #1 10
do
for rho in 0.1 1 10
do
for sig in 0.1 1 10 #0.1 1 10
do
for jj in 1 5 10
do

DIR=ratios4-$levels-$j$k-$ub-$rho-$mu-$sig

cat>>$FILE <<EOF
copyfile('./VELO/VELO-$DIR/velo-$DIR-$jj.000.dat', 'tt5')
t5=load('tt5');
Ub=$ub;
[mm,index]=max(t5(:,3));
nn=length(t5(:,2));
dmax=t5(index,2);
kk=0;

t5b=[];
ubt=[];
r5b=[];
K5b=[];

for ii=1:nn
    if (t5(ii,2)<dmax || t5(ii,2)==dmax)
        kk=kk+1;
        t5b(kk)=t5(kk,2);
        r5b(kk)=t5(kk,3);
        K5b(kk)=t5(kk,16);
        ubt(kk)=((t5(kk,7).^2+t5(kk,8).^2).^0.5)./Ub;
    end
end

X1=r5b';
Y1=t5b';
YMatrix1=ubt';
YMatrix2=1./K5b';


figure1 = figure;
subplot1 = subplot(3,1,2,'Parent',figure1,'FontSize',24);
%% Uncomment the following line to preserve the Y-limits of the axes
ylim(subplot1,[0 1]);
hold(subplot1,'on');
ylabel('U_{int}/U_b [-]');
plot1 = plot(X1,YMatrix1,'Parent',subplot1);
set(plot1,'Marker','o','LineStyle','none','Color',[1 0 0]);
subplot2 = subplot(3,1,3,'Parent',figure1,'FontSize',24);
ylim(subplot2,[0 40]);
hold(subplot2,'on')
ylabel('Rc [\mum]');
xlabel('r [\mum]');
plot2 = plot(X1,YMatrix2,'Parent',subplot2);
set(plot2(1),'Marker','o','LineStyle','none','Color',[1 0 0]);
subplot3 = subplot(3,1,1,'Parent',figure1,'FontSize',24);
hold(subplot3,'on');
ylabel('z [\mum]');

plot3=plot(X1,Y1,'Parent',subplot3,'Marker','o','LineStyle','none','Color',[0 0 0]);
set(plot3,'DisplayName','$j$k deg, $ub m/s, rho=$rho, mu=$mu, sig=$sig, t=$jj','Marker','o','LineStyle','none');
 legend3 = legend(subplot3,'show');
set(legend3,...
    'Position',[0.153565325055803 0.859523809523811 0.5753173828125 0.0595238095238095],...
        'FontSize',14);
print('figure-$DIR-$jj.png','-dpng')
EOF

done
done
done
done
done
done
done
done
