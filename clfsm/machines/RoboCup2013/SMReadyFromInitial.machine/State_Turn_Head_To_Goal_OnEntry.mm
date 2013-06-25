const TopParticles top_particles = particles.get();
const ParticlePosition &top_particle = top_particles.particles(0);
targetHeading = top_particle.heading();

head.GoToWithTime(int(RAD2DEG(headAngleX)), 0, headDelayInUS);
head_ptr.set(head);
