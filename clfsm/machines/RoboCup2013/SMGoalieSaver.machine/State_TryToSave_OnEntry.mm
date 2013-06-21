// Find X for when Y=0.
float m = averageDiff.x / averageDiff.y;
int changeX = (int)(previousPos.x * m);
interceptX = previousPos.x + changeX;
