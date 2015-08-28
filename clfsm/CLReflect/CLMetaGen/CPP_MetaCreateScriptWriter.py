from CodeGen import *
from CPP_MetaMachineDefinition import *
from CLMetaGenConstants import *

class CPP_MetaCreateScriptWriter():

    def __init__(self, machineDef, cpp):
        self.machineDef = machineDef
        self.cpp = cpp

    def write(self):
        cpp = self.cpp
        cpp("// Creation script")
        with cpp.block("refl_metaMachine Create_MetaMachine()"):
            cpp("refl_metaMachine m = refl_initMetaMachine(NULL);")
            cpp('refl_setMetaMachineName(m, "' + self.machineDef.name + '", NULL);')
            statesVar = self.writeStateDefinitions()
            with cpp.subs(states = statesVar, numStates = len(self.machineDef.states)):
                cpp('refl_setMetaStates(m, $states$, $numStates$, NULL);')
            cpp('return m;')

    def writeStateDefinitions(self):
        cpp = self.cpp
        statesVarName = "states"
        with cpp.subs(states = statesVarName, numStates = len(self.machineDef.states)):
            cpp('refl_metaState $states$[$numStates$];\n')
        for state in self.machineDef.states:
            with cpp.subs(sName = state.name, sIndex = state.index):
                cpp("\n\t//State: $sName$")
                cpp('refl_metaState ms_$sName$ = refl_initMetaState(NULL);')
                cpp('refl_setMetaStateName(ms_$sName$, "$sName$", NULL);\n')
                for action in CLMetaGenConstants.ACTIONS:
                    with cpp.subs(action = action):
                        cpp('refl_metaAction ma_$sName$_$action$ = refl_initMetaAction(NULL);')
                        cpp('refl_setMetaActionMethod(ma_$sName$_$action$, $sName$_$action$, NULL);')
                        cpp('refl_set$action$(ms_$sName$, ma_$sName$_$action$, NULL);')
                cpp('states[$sIndex$] = ms_$sName$;')
                # Transitions
                numTransitions = len(state.transitions)
                if numTransitions > 0:
                    cpp('refl_metaTransition $sName$_transitions[' + str(numTransitions) + '];')
                for trans in state.transitions:
                    with cpp.subs(tIndex = trans.index, target = trans.target,
                            source = trans.source, expr = trans.expression,
                            varName = 'mt_' + state.name + '_T_' + str(trans.index)):
                            cpp('refl_metaTransition $varName$ = refl_initMetaTransition(NULL);')
                            cpp('refl_setMetaTransitionSource($varName$, $source$, NULL);')
                            cpp('refl_setMetaTransitionTarget($varName$, $target$, NULL);')
                            cpp('refl_setMetaTransitionExpression($varName$, "$expr$", NULL);')
                            cpp('refl_transitionEval_f $varName$_eval_f = $sName$_Transition_$tIndex$;')
                            cpp('refl_setMetaTransitionEvalFunction($varName$, $varName$_eval_f, NULL, NULL);')
                            cpp('$sName$_transitions[$tIndex$] = $varName$;')
                if numTransitions > 0:
                    cpp('refl_setMetaTransitions(ms_$sName$, $sName$_transitions, ' + str(numTransitions) + ', NULL);')

        return statesVarName
