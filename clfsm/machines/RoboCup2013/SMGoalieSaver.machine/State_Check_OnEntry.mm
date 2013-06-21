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

// Calculate a vector between the first ball sighting and the second, and store
// in the ballDifferences array.
vec2 diff;
diff.x = currentPos.x - previousPos.x;
diff.y = currentPos.y - previousPos.y;

headIndex = (unsigned long)((int)(headIndex + 1) % (int)historySize);
ballDifferences[headIndex] = diff;

// Calculate an average distance from previous distances.
unsigned long back1Index = (headIndex - 1) % historySize;
unsigned long back2Index = (headIndex - 2) % historySize;
int sumX = ballDifferences[headIndex].x + ballDifferences[back1Index].x +
           ballDifferences[back2Index].x;
int sumY = ballDifferences[headIndex].y + ballDifferences[back1Index].y +
           ballDifferences[back2Index].y;

averageDiff.x = (int)(sumX / 3.0);
averageDiff.y = (int)(sumY / 3.0);

//printf("distance:%d angle:%f difference x:%d y:%d\n", currentDist, currentAngle, 
//                                                      averageDiff.x, averageDiff.y);

printf("|\n");
