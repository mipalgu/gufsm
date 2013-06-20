// Check the whiteboard for info about the ball.
ball_info = wbSighting.get();

// Get the current ball distance and angle.
int currentDist = ball_info.distance();
float currentAngle = ball_info.horizontal_angle();

// Calculate current position vector, with the robot's torso lying at x=0, 
// left being x<0 and right being x>0.
vec2 currentPos;
currentPos.x = (int)(sin(currentAngle) * currentDist);
currentPos.y = (int)(cos(currentAngle) * currentDist);

// Calculate a vector between the first ball sighting and the second, and store
// in the ballDifferences array.
vec2 diff;
diff.x = currentPos.x - previousPos.x;
diff.y = currentPos.y - previousPos.y;

headIndex = (unsigned long)((int)(headIndex + 1) % (int)historySize);
ballDifferences[headIndex] = diff;

// Store the current position as the previous, ready for the next iteration.
previousPos = currentPos;

// Calculate the change in distance by finding the magnitude of the last
// vector stored into ballDifferences.
dd = (int)(sqrt(diff.x * diff.x + diff.y * diff.y));
