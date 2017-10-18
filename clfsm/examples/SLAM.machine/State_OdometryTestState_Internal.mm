LMass=FSRMsg.get().LFoot_FSR_FrontLeft()+FSRMsg.get().LFoot_FSR_FrontRight() +FSRMsg.get().LFoot_FSR_RearLeft()+FSRMsg.get().LFoot_FSR_RearRight();
RMass=FSRMsg.get().RFoot_FSR_FrontLeft()+FSRMsg.get().RFoot_FSR_FrontRight() +FSRMsg.get().RFoot_FSR_RearLeft()+FSRMsg.get().RFoot_FSR_RearRight();
LeftStep=(LMass>1.2) && (RMass<0.5);
RightStep=(RMass>1.2) && (LMass<0.5);
