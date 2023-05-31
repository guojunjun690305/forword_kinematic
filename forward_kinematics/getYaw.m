function yawFrame = getYaw(yaw, x, y, z)
yawFrame = [cos(yaw), -sin(yaw),0,x;
            sin(yaw), cos(yaw),0,y;
            0,0,1,z;
            0,0,0,1];
end

