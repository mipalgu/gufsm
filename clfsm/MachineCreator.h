#include <vector>
#include <string>

namespace FSM {
    template <class MachineType>
    class MachineCreator<storageType, MachineType> {
        public:
            virtual std::vector<MachineType*> createMachines(std::string) = 0;
    };
}
