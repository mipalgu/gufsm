#include <vector>

namespace FSM {
    template <class storageType, class MachineType>
    class MachineCreator<storageType, MachineType> {
        public:
            virtual std::vector<MachineType*> createMachines(storageType*) = 0;
    };
}
