particles = particles_ptr.get();
facingMySide = particles.particles(0).headingInDegrees() < 180 ? false : true;
