// Search for goals using the top camera.
VisionControlStatus vision;
vision.set_selectedCamera(Top);
wbVisionControl.set(vision);

restart("SMFindGoalOnSpot");
