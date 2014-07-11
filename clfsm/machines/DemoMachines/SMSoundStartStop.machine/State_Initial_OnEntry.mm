level = 600;
lo = 200, hi = 320;  fft = wbfft();
const char *lofreq = getenv("LOW_FREQ");
const char *hifreq = getenv("HIGH_FREQ");
if (lofreq) lo = atou16(lofreq);
if (hifreq) hi = atou16(hifreq);
fft.rms().set_left(0);
fft.rms().set_right(0);
fft.fsk().set_lo_freq(lo);
fft.fsk().set_hi_freq(hi);
wbfft.post(fft);
