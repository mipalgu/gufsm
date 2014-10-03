#ifdef DEBUG
QSay_t say = std::string("front");
#endif

NAO_State_value = NAO_State_ptr.get();
NAO_State_value.set_stance(FallenForward);
NAO_State_ptr.set(NAO_State_value);
