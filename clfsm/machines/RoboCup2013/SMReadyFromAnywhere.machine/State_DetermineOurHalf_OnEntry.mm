const TopParticles top_particles = particles.get();
const ParticlePosition &top_particle = top_particles.particles(0);
heading = top_particle.heading();



ourHalf = (top_particle.y() < 0);
