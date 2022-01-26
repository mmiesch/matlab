
% Earth Centered Intertial (J2000/EME200) Coordinate system

% set size of figure
figure('Renderer','painters','Position',[10 10 1000 700])

addpath '/home/mark.miesch/opt/matlab_exchange'

% draw ecliptic
[x y] = meshgrid(-2:0.02:2)
z = zeros(size(x,1))
surf(x,y,z,'FaceAlpha',0.5,'EdgeColor','none','FaceColor','#797979')
xlim([-2,2])
ylim([-2,2])
zlim([-1,1])
axis off

% draw sun
hold on
[x,y,z] = ellipsoid(0,0,0,0.1,0.1,0.1,100)
surf(x,y,z,'FaceColor','#E2F516','EdgeColor','none')

% draw earth
hold on
[x,y,z] = ellipsoid(1,0,0,0.1,0.1,0.1,100)
surf(x,y,z,'FaceColor','#2B65EC','EdgeColor','none')

% Draw Earth's orbit
hold on
t = 0:pi/50:2*pi
x = sin(t)
y = cos(t)
z = zeros(size(x))
plot3(x,y,z,'Color','black','LineWidth',2)

% draw Earth's equatorial plane
th = 23.5 * pi / 180.0
ph = - 30 * pi / 180.0
A = sin(th)*sin(ph)
B = - sin(th)*cos(ph)
C = cos(th)
D = -1*A
[x y] = meshgrid(-2:0.02:2)
z = -1/C*(A*x + B*y + D)
surf(x,y,z,'EdgeColor','none','FaceColor','#82CAFF','FaceAlpha',0.5)

% draw axes
dd = sqrt(1 + (A/B)^2)
xx = 1.0 / dd
xy = - A / (B*dd)
yx = - C*xy
yy = C*xx
yz = A*xy - B*xx
p0 = [1,0,0];
px = [xx+1,xy,0];
py = [yx+1,yy,yz];
pz = [A+1,B,C];
mArrow3(p0,px)
mArrow3(p0,py)
mArrow3(p0,pz)

% draw angle
%y1 = - A / B
%p1 = [2,y1,0]
%z2 = 0.5
%y2 = - (A + C*z2)/B
%p2 = [2,y2,z2]
%L = sqrt((y2-y1)^2 + z2^2)
%y3 = y1 + L
%plot3([2,2],[y1,y2],[0,z2],'Color','black','Linewidth',2)
%plot3([2,2],[y1,y3],[0,0],'Color','black','Linewidth',2)

x2 = yx+1
y2 = yy

plot3([1,x2],[0,y2],[0,0],'--','Color','black','Linewidth',2)

%r = 0.5
%zeta = 0:0.01:th
%z = r * sin(zeta)
%y = - r * cos(zeta) 
%x = 1 + sqrt(r^2 - y^2 - z^2)
%plot3(x,y,z)

% rotate view
view(60,40)