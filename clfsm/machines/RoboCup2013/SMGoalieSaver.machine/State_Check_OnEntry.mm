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

averageDiff = diff; // Bypass average.

//printf("distance:%d angle:%f difference x:%d y:%d\n", currentDist, currentAngle, 
//                                                      averageDiff.x, averageDiff.y);

// Decided whether to identify the ball as moving in a direction, only if the
// past three differences have been in the same direction.
bool diff1X, diff1Y, diff2X, diff2Y;
vec2 diff1, diff2, diff3;

diff1 = ballDifferences[headIndex];
diff2 = ballDifferences[(headIndex - 1) % historySize];
diff3 = ballDifferences[(headIndex - 2) % historySize];

// Change three vectors of integers effectively into three vectors of 1-bit directions.
if (diff1.x > 0) diff1.x = 1;
else if (diff1.x == 0) diff1.x = 0;
else diff1.x = -1;
if (diff1.y > 0) diff1.y = 1;
else if (diff1.y == 0) diff1.y = 0;
else diff1.y = -1;

if (diff2.x > 0) diff2.x = 1;
else if (diff2.x == 0) diff2.x = 0;
else diff2.x = -1;
if (diff2.y > 0) diff2.y = 1;
else if (diff2.y == 0) diff2.y = 0;
else diff2.y = -1;

if (diff3.x > 0) diff3.x = 1;
else if (diff3.x == 0) diff3.x = 0;
else diff3.x = -1;
if (diff3.y > 0) diff3.y = 1;
else if (diff3.y == 0) diff3.y = 0;
else diff3.y = -1;


//printf("diff1--x:%d y:%d diff2--x:%d y:%d\n", diff1.x, diff1.y, diff2.x, diff2.y);

if (diff1.x == diff2.x &&
    diff1.y == diff2.y &&
    diff2.x == diff3.x &&
    diff2.y == diff3.y &&
    (diff1.x != 0 || diff1.y != 0 ||
     diff2.x != 0 || diff2.y != 0))
{
	constantDirection = true;
}
