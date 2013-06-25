const TopParticles top_particles = particles.get();
const ParticlePosition &top_particle = top_particles.particles(0);
heading = top_particle.heading();

angle = (targetHeading - heading) / 4;

if (angle > DEG2RAD(5.0)) angle = float(DEG2RAD(5.0));
else if (angle < DEG2RAD(-5.0)) angle = -float(DEG2RAD(5.0));
