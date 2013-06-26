printf("CONSTANT DIRECTION!");
constantDirection = false;

// Get the average movement on the y dimension (how close it is to the robot).
vec2 diff1 = ballDifferences[headIndex];
vec2 diff2 = ballDifferences[(headIndex - 1) % historySize];
vec2 diff3 = ballDifferences[(headIndex - 2) % historySize];

averageDiff.x = (int)((diff1.x + diff2.x + diff3.x) / 2);
averageDiff.y = (int)((diff1.y + diff2.y + diff3.y) / 2);

printf("averageY: %d\n", averageDiff.y);
