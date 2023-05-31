function rollFrame = getRoll(roll,x,y,z)
rollFrame =[ 1, 0, 0, x;
             0, cos(roll), -sin(roll),y;
             0, sin(roll), cos(roll),z;
             0,0,0,1];
end

