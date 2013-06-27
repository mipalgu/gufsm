QSay_t say;
char str[4];
str[0] = (char)ball_info.distance();
str[1] = (char)NULL;

say(std::string(str));

restart("SMKicker");
