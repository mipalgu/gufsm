suspend("SMHeadScanner");
suspend("SMHeadBallTracker");


HAL_HeadTarget_t head_ptr;
HAL_HeadTarget head;
head.Stop();
head_ptr.set(head);
