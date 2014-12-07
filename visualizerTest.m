%% Plot an example scene

figure; hold on; grid on;

maxNumBots = 10;
numBots = 3; % must be less than maxNumBots

% Establish Robot sizes
rMaster = 0.5;
rRobot  = rMaster * sin(pi/maxNumBots);

% Create the master
bot0 = Robot(0, rMaster, -2, 2, pi/6);
bot0.plot

bots(1) = bot0;
dTheta = 2*pi/10;
theta = -dTheta;

% Surround the master with other robots
for i = 1:numBots
    theta = theta + (i+1)*dTheta;
    poslen = rMaster + rRobot;
    
    posX = poslen*cos(theta) + bot0.x;
    posY = poslen*sin(theta) + bot0.y;
    
    
    bots(i) = Robot(1,rRobot,posX,posY,theta-pi);
    bots(i).color = 'r';
    bots(i).plot
end

% Create target area
targetX = 2;
targetY = -2;
alpha = 0:0.1:2*pi;
x = targetX + 1.2*bot0.radius*cos(alpha);
y = targetY + 1.2*bot0.radius*sin(alpha);
plot(x,y,'Color',bot0.color,'LineStyle','--', 'LineWidth',2);

axis equal;
axis([-3 3 -3 3]);
axis square;

%% Example animation
N = 50;
dt = 0.1;
pause(dt);
% Calculate straight-line path to goal
xMove = -(bot0.x - targetX)/N;
yMove = -(bot0.y - targetY)/N;

for k = 1:N
   clf;
   hold on;
   
   % Update master
   bot0.x = bot0.x + xMove;
   bot0.y = bot0.y + yMove;
   bot0.plot;
   
   % Update robots
   for i=1:numBots
       bots(i).x = bots(i).x + xMove;
       bots(i).y = bots(i).y + yMove;
       bots(i).plot;
   end
   
   plot(x,y,'Color',bot0.color,'LineStyle','--', 'LineWidth',2);
   axis equal;
   axis([-3 3 -3 3]);
   axis square;
   grid on;
   
   hold off;
   pause(dt*0.75);
end