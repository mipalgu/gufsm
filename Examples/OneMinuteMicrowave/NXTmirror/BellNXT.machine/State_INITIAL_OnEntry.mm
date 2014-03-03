#ifdef DEBUG
print_ptr("PLAY_A_NOTE");
#endif

C = 523;
D = 587;
E = 659;
G = 784;
R = 0;

int16_t mary_song[]= {E, D, C, D, E, E, E, R, D, D, D, R, E, G, G, R, E, D, C, D, E, E, E, E, D, D, E, D, C};
std::vector<int16_t> the_song (mary_song, mary_song + sizeof(mary_song) / sizeof(int16_t) );
song=the_song;
currentNote=0;
songLength=song.size();
bellSignal=0;

WBMsg test =wb.getMessage("sound");
if (test.getType()==WBMsg::TypeInt)
   bellSignal=test.getIntValue();
