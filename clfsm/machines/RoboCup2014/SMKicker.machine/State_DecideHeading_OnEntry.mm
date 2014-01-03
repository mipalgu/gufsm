fprintf(stderr, "decide\n");

ball = ball_ptr.get();


particles = particles_ptr.get();
facingMySide = particles.particles(0).headingInDegrees() > 180 ? true : false;
