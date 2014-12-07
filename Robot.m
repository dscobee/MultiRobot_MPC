classdef Robot < handle
   
    properties
        radius = 1;
        x = 0;
        y = 0;
        theta = 0;
        
        z = [0;0;0;0]; %[x; y; v_x; v_y];
        
        % Robot ID number
        id = 0;
        
        % Visualization Data
        color = 'b';
    end
    
    properties (Constant = true)
        mass = 1;
        
    end
    
    methods
        
        % Constructor
        function bot = Robot(id, r, x0, y0, theta)
            bot.id = id;
            bot.radius = r;
            bot.x = x0;
            bot.y = y0;
            bot.theta = theta;
            
            % adding robot state
            bot.z(1) = x0;
            bot.z(2) = y0;
            bot.z(3) = 0;
            bot.z(4) = 0;
        end
        
        function plot(bot)
            
            alpha = 0:0.1:2*pi;
            x = bot.x + bot.radius*cos(alpha);
            y = bot.y + bot.radius*sin(alpha);
            plot(x,y,'Color',bot.color, 'LineWidth',2);
            
            x = [bot.x bot.x+1*bot.radius*cos(bot.theta)];
            y = [bot.y bot.y+1*bot.radius*sin(bot.theta)];
            plot(x,y,'Color',bot.color,'LineWidth',2);

            plot(bot.x,bot.y,'.','Color',bot.color,'MarkerSize',20); 
        end
        
        function updateState(bot, z_new)
            bot.z = z_new;
        end
        
        function updateTheta(bot,theta_new)
            bot.theta = theta_new;
        end
    end
    
end