
% Geocentric Solar Magnetospheric (GSM) Coordinate system

% set size of figure
figure('Renderer','painters','Position',[10 10 1000 700])

addpath '/home/mark.miesch/opt/matlab_exchange'

% draw ecliptic
[x y] = meshgrid(-2:0.05:2)
z = zeros(size(x,1))
surf(x,y,z,'FaceAlpha',0.5,'EdgeColor','none','FaceColor','#797979')
xlim([-1.5,1.5])
ylim([-1.5,1.5])
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

% draw yz plane
[y z] = meshgrid(-2:0.05:2)
x = ones(size(y))
surf(x,y,z,'EdgeColor','none','FaceColor','#DAA520','FaceAlpha',0.5)

% draw axes
L = 0.8
th = - 20.0 * pi / 180
zy = - L * sin(th)
zz = L * cos(th)
yy = - L * cos(th)
yz = - L * sin(th)
p0 = [1,0,0];
px = [1-L,0,0];
py = [1,yy,yz];
pz = [1,zy,zz];
mArrow3(p0,px)
mArrow3(p0,py)
mArrow3(p0,pz)

plot3([1,1],[0,0],[0,0.8],':','Color','black','Linewidth',4)

% rotate view
view(-45,30)