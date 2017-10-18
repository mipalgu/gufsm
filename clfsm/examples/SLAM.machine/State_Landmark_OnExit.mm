LMass=FSRMsg.get().LFoot_FSR_FrontLeft()+FSRMsg.get().LFoot_FSR_FrontRight() +FSRMsg.get().LFoot_FSR_RearLeft()+FSRMsg.get().LFoot_FSR_RearRight();
RMass=FSRMsg.get().RFoot_FSR_FrontLeft()+FSRMsg.get().RFoot_FSR_FrontRight() +FSRMsg.get().RFoot_FSR_RearLeft()+FSRMsg.get().RFoot_FSR_RearRight();
if(LMass>1.2)
{
	HeadingDir=atan2(TestOdom.LeftData()[6],TestOdom.LeftData()[10])*57.29;
	if(-45<HeadingDir && HeadingDir<45)
	{
		Ytemp=TestOdom.LeftData()[7]-50;
		Ztemp=TestOdom.LeftData()[11]+CAM_OFF;
	}
	else if(45<HeadingDir && HeadingDir<135)
	{
		Ytemp=TestOdom.LeftData()[7]+CAM_OFF;
		Ztemp=TestOdom.LeftData()[11]+50;
	}
	else if(-135<HeadingDir && HeadingDir<-45)
	{
		Ytemp=TestOdom.LeftData()[7]-CAM_OFF;
		Ztemp=TestOdom.LeftData()[11]-50;
	}
	else
	{
		Ytemp=TestOdom.LeftData()[7]+50;
		Ztemp=TestOdom.LeftData()[11]-CAM_OFF;
	}
}
else
{
	HeadingDir=atan2(TestOdom.RightData()[6],TestOdom.RightData()[10])*57.29;
	if(-45<HeadingDir && HeadingDir<45)
	{
		Ytemp=TestOdom.RightData()[7]+50;
		Ztemp=TestOdom.RightData()[11]+CAM_OFF;
	}
	else if(45<HeadingDir && HeadingDir<135)
	{
		Ytemp=TestOdom.RightData()[7]+CAM_OFF;
		Ztemp=TestOdom.RightData()[11]-50;
	}
	else if(-135<HeadingDir && HeadingDir<-45)
	{
		Ytemp=TestOdom.RightData()[7]-CAM_OFF;
		Ztemp=TestOdom.RightData()[11]+50;
	}
	else
	{
		Ytemp=TestOdom.RightData()[7]-50;
		Ztemp=TestOdom.RightData()[11]-CAM_OFF;
	}
}
std::cout<<Ytemp<<","<<Ztemp<<std::endl;
std::cout<<"Adding landmark to database!"<<std::endl;
MeasMsg.X=Ztemp-ZLandmark;
MeasMsg.Y=Ytemp-YLandmark;
MeasMsg.Unc=200;
Landmarks=MeasMx.GetNumberOfLandmarks();
LandmarkIdx=MeasMx.AddMeasurement(MeasMsg, LandmarkIdx);
std::cout<<"AddMeasurement returned: "<<LandmarkIdx<< " as landmarkIdx"<<std::endl;
if(-1<LandmarkIdx)
{
	YLandmark=Ytemp;
	ZLandmark=Ztemp;
	foo=MeasMx.GetPosition(LandmarkIdx);
	if(LandmarkIdx>Landmarks-1)
	{
		std::cout<<"Landmark Poisition after addition: Y: "<<foo.Y<<" Z: "<<foo.X<<" Unc: "<<foo.Unc<<std::endl;
		SayMsg("New landmark added!");
	}
	else
	{
		std::cout<<"Landmark Poisition after update: Y: "<<foo.Y<<" Z: "<<foo.X<<" Unc: "<<foo.Unc<<std::endl;
		if(LandmarkIdx)
		{
			SayMsg("Landmark position updated!");
		}
		else
		{
			SayMsg("Returned to home position!");
		}
	}
	if(-45<HeadingDir && HeadingDir<45)
	{
		TestOdom.LeftData()[7]=foo.Y+50;
		TestOdom.LeftData()[11]=foo.X-CAM_OFF;
		TestOdom.RightData()[7]=foo.Y-50;
		TestOdom.RightData()[11]=foo.X-CAM_OFF;
	}
	else if(45<HeadingDir && HeadingDir<135)
	{
		TestOdom.LeftData()[7]=foo.Y-CAM_OFF;
		TestOdom.LeftData()[11]=foo.X-50;
		TestOdom.RightData()[7]=foo.Y-CAM_OFF;
		TestOdom.RightData()[11]=foo.X+50;
	}
	else if(-135<HeadingDir && HeadingDir<-45)
	{
		TestOdom.LeftData()[7]=foo.Y+CAM_OFF;
		TestOdom.LeftData()[11]=foo.X+50;
		TestOdom.RightData()[7]=foo.Y+CAM_OFF;
		TestOdom.RightData()[11]=foo.X-50;
	}
	else
	{
		TestOdom.LeftData()[7]=foo.Y-50;
		TestOdom.LeftData()[11]=foo.X+CAM_OFF;
		TestOdom.RightData()[7]=foo.Y+50;
		TestOdom.RightData()[11]=foo.X+CAM_OFF;
	}
}
MeasMx.MxP();
