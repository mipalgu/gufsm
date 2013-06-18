goalAngle = RAD2DEG(genericPost.horizontal_angle());

head.GoToWithTime((int)goalAngle, (int)0, 500000);
head_ptr.set(head);
