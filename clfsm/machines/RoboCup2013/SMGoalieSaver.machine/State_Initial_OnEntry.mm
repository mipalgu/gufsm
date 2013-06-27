// Init size of array.
historySize = 5;
ballDifferences.reserve(historySize);

// Set initial values
for (unsigned long i = 0; i < historySize; i++)
{
	vec2 v;
	v.x = 0;
	v.y = 0;
	ballDifferences[i] = v;
}

suspend("SMFindGoalOnSpot");
