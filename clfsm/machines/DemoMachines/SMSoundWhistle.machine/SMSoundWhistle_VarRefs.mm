//
// SMSoundWhistle_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

SMSoundWhistle *_m = static_cast<SMSoundWhistle *>(_machine);

FFTStatus	&fft = _m->fft;	///< last read FFT data
FFTStatus_t	&wbfft = _m->wbfft;	///< FFT analysis data from whiteboard
int16_t	&level = _m->level;	///< RMS threshold
uint16_t	&lo = _m->lo;	///< low fsk freq
uint16_t	&hi = _m->hi;	///< high fsk freq
MOTION_Commands_t	&motion_ptr = _m->motion_ptr;	///< 
MOTION_Status_t	&motion_status = _m->motion_status;	///< 

#pragma clang diagnostic pop
