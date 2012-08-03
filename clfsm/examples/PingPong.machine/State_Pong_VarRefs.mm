Pong *_s = static_cast<Pong *>(_state);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

int &counter = _s->counter;

#pragma clang diagnostic pop
