HeadMsg.set(HeadTrg);

//WalkMsg(WALK2014_ControlStatus(WALK, 100, 0, static_cast<int>(((LineMsg & 1023) - 320)/5), 0));
WalkMsg(NaoWalkCommand().walk(100,0, static_cast<int>(((LineMsg & 1023) - 320)/5)));

LMass=FSRMsg.get().LFoot_FSR_FrontLeft()+FSRMsg.get().LFoot_FSR_FrontRight() +FSRMsg.get().LFoot_FSR_RearLeft()+FSRMsg.get().LFoot_FSR_RearRight();
RMass=FSRMsg.get().RFoot_FSR_FrontLeft()+FSRMsg.get().RFoot_FSR_FrontRight() +FSRMsg.get().RFoot_FSR_RearLeft()+FSRMsg.get().RFoot_FSR_RearRight();
