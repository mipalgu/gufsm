const TopParticles top_particles = particles.get();
const ParticlePosition &top_particle = top_particles.particles(0);
heading = top_particle.heading();
if (heading > M_PI) heading -= float(2*M_PI);

angle = (targetHeading - heading) / 4;

if (angle > DEG2RAD(5.0)) angle = float(DEG2RAD(5.0));
else if (angle < DEG2RAD(-5.0)) angle = -float(DEG2RAD(5.0));
