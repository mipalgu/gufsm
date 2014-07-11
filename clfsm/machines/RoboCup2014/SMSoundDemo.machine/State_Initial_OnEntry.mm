level = 600;
lo = 200, hi = 320;  fft = wbfft();
const char *lofreq = getenv("LOW_FREQ");
const char *hifreq = getenv("HIGH_FREQ");
if (lofreq) lo = static_cast<uint16_t>(atoi(lofreq));
if (hifreq) hi = static_cast<uint16_t>(atoi(hifreq));
fft.rms().set_left(0);
fft.rms().set_right(0);
fft.fsk().set_lo_freq(lofreq);
fft.fsk().set_hi_freq(hifreq);
wbfft.post(fft);
