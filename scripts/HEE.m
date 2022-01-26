
% Heliocentric Solar Ecliptic coordinate system

% set size of figure
figure('Renderer','painters','Position',[10 10 1000 700])

addpath '/home/mark.miesch/opt/matlab_exchange'

% draw ecliptic
[x y] = meshgrid(-2:0.1:2)
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

% draw axes
L = 0.8
p0 = [0,0,0];
px = [L,0,0];
py = [0,L,0];
pz = [0,0,L];
mArrow3(p0,px)
mArrow3(p0,py)
mArrow3(p0,pz)

% set view angle
view(30,30)