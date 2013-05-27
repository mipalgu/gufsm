#ifdef DEBUG
QSay_t say = std::string("right");
#endif

NAO_State_value = NAO_State_ptr.get();
NAO_State_value.set_stance(FallenRight);
NAO_State_ptr.set(NAO_State_value);
