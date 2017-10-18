HeadMsg.set(HeadTrg);
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
//std::cout << LMass <<"  \t"<<RMass<<std::endl;
/*
std::cout << FSRMsg.get().LFoot_FSR_FrontLeft() <<",";
std::cout << FSRMsg.get().LFoot_FSR_FrontRight() <<",";
std::cout << FSRMsg.get().LFoot_FSR_RearLeft() <<",";
std::cout << FSRMsg.get().LFoot_FSR_RearRight() <<",";
std::cout << FSRMsg.get().RFoot_FSR_FrontLeft() <<",";
std::cout << FSRMsg.get().RFoot_FSR_FrontRight() <<",";
std::cout << FSRMsg.get().RFoot_FSR_RearLeft() <<",";
std::cout << FSRMsg.get().RFoot_FSR_RearRight() <<","<< std::endl;*/
/*
TestOdom.CalcLeftPos(Joints);
for(ii=0;ii<4;ii++)
{
	for(jj=0;jj<4;jj++)
	{
		std::cout<<TestOdom.LeftData()[4*ii+jj]<<"\t";
	}
	std::cout<<""<<std::endl;
}*/
//std::cout<<"---------------------------------------------------------------------------------"<<std::endl;
/*for(ii=0;ii<6;ii++)
{
	std::cout<<Joints[ii]<<" ";
}*/
//std::cout<<"----------------------------------------------------------------------------------"<<std::endl;
//std::cout << Joints[6]<< std::endl;
