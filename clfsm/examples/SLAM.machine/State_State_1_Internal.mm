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
	TestOdom.CalcLeftPos(Joints);
	//std::cout<<TestOdom.LeftData()[3]<<","<<TestOdom.LeftData()[7]<<","<<TestOdom.LeftData()[11];
	//std::cout<<TestOdom.RightData()[7]<<"\t"<<TestOdom.RightData()[11]<<std::endl;
}
if((RMass>1.2) && (LMass<0.5) && Step)
{
	Step=false;
	TestOdom.CalcRightPos(Joints);
	//std::cout<<TestOdom.LeftData()[3]<<","<<TestOdom.LeftData()[7]<<","<<TestOdom.LeftData()[11];
	std::cout<<TestOdom.RightData()[7]<<"\t"<<TestOdom.RightData()[11]<<std::endl;
}
