#include "CLReflect_API.h"

using namespace std;
using namespace CLReflect;

shared_ptr<CLMetaState> API::getCurrentStateDefintion(string machineName)
{
    //XXX: stub
    vector<shared_ptr<CLMetaState>> states = API::getStatesForMetaMachine(machineName);
    return states[0];
}
