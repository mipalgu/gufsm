std::cout << "Init" << std::endl;
Joints=new double[16];
HeadTrg.GoToWithTime(0,13,1000000);
HeadMsg.set(HeadTrg);
MOTION_Commands motion(true,false,true);
motion.GoToStance(Motions::Kneeling_stance, Motions::Standing_stance);
MotMsg.set(motion);
HeadingDir=0;
//WalkMsg(WALK2014_ControlStatus(RESET_ODOMETRY));
LandmarkIdx=0;
//WalkMsg(WALK2014_ControlStatus(WALK, 100, 0, 0, 0));
/*
for(ii = 0; ii < LEN; ii++)
{
	MeasMsg.X = 100;
	MeasMsg.Y = 100;
	MeasMsg.Unc = 10;
	if((Res = MeasMx.AddMeasurement(MeasMsg, ii)))
	{
		for(jj = 0; jj < MeasMx.GetNumberOfLandmarks(); jj++)
		{
			foo = MeasMx.GetPosition(jj);
			std::cout << "Point " << jj << ": X: " << foo.X << " Y: " << foo.Y << " Unc: " << foo.Unc << std::endl;
		}
		std::cout << "---------------------------------- Iteration " << ii << " ended ---------------------------------" << std::endl;
	}
	else
	{
		std::cout << "---------------------------------- Invalid Measurement  ---------------------------------" << std::endl;	
	}
}
for(ii = 0; ii < LEN; ii++)
{
	MeasMsg.X = -100;
	MeasMsg.Y = -100;
	MeasMsg.Unc = 10;
	if((Res = MeasMx.AddMeasurement(MeasMsg, LEN - ii)))
	{
		for(jj = 0; jj < MeasMx.GetNumberOfLandmarks(); jj++)
		{
			foo = MeasMx.GetPosition(jj);
			std::cout << "Point " << jj << ": X: " << foo.X << " Y: " << foo.Y << " Unc: " << foo.Unc << std::endl;
		}
		std::cout << "---------------------------------- Iteration " << ii << " ended ---------------------------------" << std::endl;
	}
	else
	{
		std::cout << "---------------------------------- Invalid Measurement  ---------------------------------" << std::endl;	
	}
}
MeasMsg.X = 700;
MeasMsg.Y = 700;
MeasMsg.Unc = 10;
MeasMx.AddMeasurement(MeasMsg, 0);
for(jj = 0; jj < MeasMx.GetNumberOfLandmarks(); jj++)
{
	foo = MeasMx.GetPosition(jj);
	std::cout << "Point " << jj << ": X: " << foo.X << " Y: " << foo.Y << " Unc: " << foo.Unc << std::endl;
}
std::cout << "---------------------------------- All Iterations ended ---------------------------------" << std::endl;
*/
