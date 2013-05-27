#ifdef DEBUG
QSay_t say = std::string("back");
#endif

NAO_State_value = NAO_State_ptr.get();
NAO_State_value.set_Stance(FallenBack);
NAO_State_ptr.set(NAO_State_value);
