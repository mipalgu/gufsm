Ping *_s = static_cast<Ping *>(_state);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"

int &counter = _s->counter;

#pragma clang diagnostic pop
