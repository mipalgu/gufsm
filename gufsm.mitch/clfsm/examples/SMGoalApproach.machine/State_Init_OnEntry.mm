rightPost = sightings_ptr.get().get_object(FVOGoalPostRight);
leftPost = sightings_ptr.get().get_object(FVOGoalPostLeft);
genericPost = sightings_ptr.get().get_object(FVOGoalPost);
goalAngle = 0;

cout << "RIGHT: " << rightPost.isVisible() << endl;
cout << "LEFT: " << leftPost.isVisible() << endl;
cout << "GENERIC: " << genericPost.isVisible() << endl;
cout << "GENERIC: " << genericPost.distance() << endl;


guvision_width = 1280;
guvision_height = 960;

horiz_fov = 61;
vert_fov = 48;
