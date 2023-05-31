function pitchFrame = getPitch(pitch ,x, y, z)
pitchFrame = [cos(pitch),0,sin(pitch),x;
              0,1,0,y;
              -sin(pitch),0, cos(pitch),z;
              0,0,0,1];
end

