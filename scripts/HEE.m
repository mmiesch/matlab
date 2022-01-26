addpath '/home/mark.miesch/opt/matlab_exchange'

% draw ecliptic
[x,y,z] = ellipsoid(0,0,-0.01,1,1,0.01,100)
surf(x,y,z,'FaceAlpha',0.5)
zlim([-1,1])
shading interp
axis off

% draw sun
hold on
[x,y,z] = ellipsoid(0,0,0,0.1,0.1,0.1,100)
surf(x,y,z,'FaceColor','#E2F516','EdgeColor','none')

% draw earth
hold on
[x,y,z] = ellipsoid(1,0,0,0.1,0.1,0.1,100)
surf(x,y,z,'FaceColor','#2B65EC','EdgeColor','none')

% draw axis
p0 = [0,0,0];
px = [1,0,0];
py = [0,1,0];
pz = [0,0,1];
mArrow3(p0,px)
mArrow3(p0,py)
mArrow3(p0,pz)