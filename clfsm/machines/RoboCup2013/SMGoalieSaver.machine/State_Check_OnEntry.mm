previousPos = currentPos;

// Check the whiteboard for info about the ball.
ball_info = wbSighting.get();

// Get the current ball distance and angle.
int currentDist = ball_info.distance();
float currentAngle = ball_info.horizontal_angle();

// Calculate current position vector, with the robot's torso lying at x=0, 
// left being x<0 and right being x>0.
currentPos.x = (int)(sin(currentAngle) * currentDist);
currentPos.y = (int)(cos(currentAngle) * currentDist);

//printf("%ld dist:%d angle:%f x:%d y:%d\n", time(NULL),currentDist, currentAngle, 
//                                           currentPos.x, currentPos.y);

// Calculate a vector between the first ball sighting and the second, and store
// in the ballDifferences array.
vec2 diff;
diff.x = currentPos.x - previousPos.x;
diff.y = currentPos.y - previousPos.y;

printf("distance:%d angle:%f difference x:%d y:%d\n", currentDist, currentAngle, diff.x, diff.y);

headIndex = (unsigned long)((int)(headIndex + 1) % (int)historySize);
ballDifferences[headIndex] = diff;
