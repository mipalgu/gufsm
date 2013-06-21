printf("TRYING TO SAVE\n");

// Find X for when Y=0.
float m = ballDifferences[headIndex].x / ballDifferences[headIndex].y;
int changeX = (int)(previousPos.x * m);
interceptX = previousPos.x + changeX;
