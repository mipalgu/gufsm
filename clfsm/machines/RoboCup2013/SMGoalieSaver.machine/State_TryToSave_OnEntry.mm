// Find X for when Y=0.
float m = (float)averageDiff.x / (float)averageDiff.y;
float changeX = previousPos.x * m;
interceptX = previousPos.x + changeX;
printf("interceptX:%f grad:%f\n", interceptX, m);
