fft.rms().set_left(0);
fft.rms().set_right(0);
fft.fsk().set_lo_freq(lofreq);
fft.fsk().set_hi_freq(hifreq);
wbfft.post(fft);
