HeadMsg.set(HeadTrg);
//WalkMsg(WALK2014_ControlStatus(WALK, 100, 0, static_cast<int>(((LineMsg & 1023) - 320)/5), 0));
WalkMsg(NaoWalkCommand().walk(100,0, static_cast<int>(((LineMsg & 1023) - 320)/5)));
Joints[0]=SenMsg.get().LHipYawPitch();
Joints[1]=SenMsg.get().LHipRoll();
Joints[2]=SenMsg.get().LHipPitch();
Joints[3]=SenMsg.get().LKneePitch();
Joints[4]=SenMsg.get().LAnklePitch();
Joints[5]=SenMsg.get().LAnkleRoll();
Joints[6]=SenMsg.get().LHipYawPitch();
Joints[7]=SenMsg.get().RHipRoll();
Joints[8]=SenMsg.get().RHipPitch();
Joints[9]=SenMsg.get().RKneePitch();
Joints[10]=SenMsg.get().RAnklePitch();
Joints[11]=SenMsg.get().RAnkleRoll();
LMass=FSRMsg.get().LFoot_FSR_FrontLeft()+FSRMsg.get().LFoot_FSR_FrontRight() +FSRMsg.get().LFoot_FSR_RearLeft()+FSRMsg.get().LFoot_FSR_RearRight();
RMass=FSRMsg.get().RFoot_FSR_FrontLeft()+FSRMsg.get().RFoot_FSR_FrontRight() +FSRMsg.get().RFoot_FSR_RearLeft()+FSRMsg.get().RFoot_FSR_RearRight();
if((LMass>1.2) && (RMass<0.5) && !Step)
{
	Step=true;
	Ytemp=TestOdom.LeftData()[7];
	Ztemp=TestOdom.LeftData()[11];
	TestOdom.CalcLeftPos(Joints);
	HeadingDir=atan2(TestOdom.LeftData()[6],TestOdom.LeftData()[10])*57.29;
	if(-45<HeadingDir && HeadingDir<45)
	{
		TestOdom.LeftData()[5]=1;
		TestOdom.LeftData()[6]=0;
		TestOdom.LeftData()[9]=0;
		TestOdom.LeftData()[10]=1;
		TestOdom.LeftData()[7]=Ytemp;
	}
	else if(45<HeadingDir && HeadingDir<135)
	{
		TestOdom.LeftData()[5]=0;
		TestOdom.LeftData()[6]=1;
		TestOdom.LeftData()[9]=-1;
		TestOdom.LeftData()[10]=0;
		TestOdom.LeftData()[11]=Ztemp;
	}
	else if(-135<HeadingDir && HeadingDir<-45)
	{
		TestOdom.LeftData()[5]=0;
		TestOdom.LeftData()[6]=-1;
		TestOdom.LeftData()[9]=1;
		TestOdom.LeftData()[10]=0;
		TestOdom.LeftData()[11]=Ztemp;
	}
	else
	{
		TestOdom.LeftData()[5]=-1;
		TestOdom.LeftData()[6]=0;
		TestOdom.LeftData()[9]=0;
		TestOdom.LeftData()[10]=-1;
		TestOdom.LeftData()[7]=Ytemp;
	}
	/*for(ii=0;ii<12;ii++)
	{
		std::cout<<Joints[ii]<<",";
	}*/
	std::cout<<atan2(TestOdom.LeftData()[6],TestOdom.LeftData()[10])*57.29<<"\t"<<TestOdom.LeftData()[7]<<"\t"<<TestOdom.LeftData()[11]<<std::endl;
}
if((RMass>1.2) && (LMass<0.5) && Step)
{
	Step=false;

	Ytemp=TestOdom.RightData()[7];
	Ztemp=TestOdom.RightData()[11];
	TestOdom.CalcRightPos(Joints);
	HeadingDir=atan2(TestOdom.RightData()[6],TestOdom.RightData()[10])*57.29;
	if(-45<HeadingDir && HeadingDir<45)
	{
		TestOdom.RightData()[5]=1;
		TestOdom.RightData()[6]=0;
		TestOdom.RightData()[9]=0;
		TestOdom.RightData()[10]=1;
		TestOdom.RightData()[7]=Ytemp;
	}
	else if(45<HeadingDir && HeadingDir<135)
	{
		TestOdom.RightData()[5]=0;
		TestOdom.RightData()[6]=1;
		TestOdom.RightData()[9]=-1;
		TestOdom.RightData()[10]=0;
		TestOdom.RightData()[11]=Ztemp;
	}
	else if(-135<HeadingDir && HeadingDir<-45)
	{
		TestOdom.RightData()[5]=0;
		TestOdom.RightData()[6]=-1;
		TestOdom.RightData()[9]=1;
		TestOdom.RightData()[10]=0;
		TestOdom.RightData()[11]=Ztemp;
	}
	else
	{
		TestOdom.RightData()[5]=-1;
		TestOdom.RightData()[6]=0;
		TestOdom.RightData()[9]=0;
		TestOdom.RightData()[10]=-1;
		TestOdom.RightData()[7]=Ytemp;
	}
	/*for(ii=0;ii<12;ii++)
	{
		std::cout<<Joints[ii]<<",";
	}*/
	//std::cout<<"1,"<<atan2(TestOdom.RightData()[6],TestOdom.RightData()[10])*57.29<<","<<TestOdom.RightData()[7]<<","<<TestOdom.RightData()[11]<<std::endl;
}
