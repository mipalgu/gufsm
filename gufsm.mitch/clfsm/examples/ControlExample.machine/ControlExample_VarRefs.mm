//
// ControlExample_VarRefs.mm
//
// Automatically created through MiCASE -- do not change manually!
//
ControlExample *_m = static_cast<ControlExample *>(_machine);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wshadow"

int	&machineNo = _m->machineNo;	///< Current Machine Counter
int	&numberOfMachines = _m->numberOfMachines;	///< Total Number of Machines

#pragma clang diagnostic pop
