from CodeGen import *
from CPP_MetaMachineDefinition import *
from CLMetaGenConstants import *
from CPP_MetaPropertyWriter import *
from CPP_Type_Interpreter import *

class CPP_MetaCreateScriptWriter():

    def __init__(self, machineDef, cpp):
        self.machineDef = machineDef
        self.cpp = cpp
        self.typeInterpreter = CPP_Type_Interpreter()

    def write(self):
        cpp = self.cpp
        cpp("// Creation script")
        with cpp.block("refl_metaMachine Create_MetaMachine()"):
            cpp("refl_metaMachine m = refl_initMetaMachine(NULL);")
            cpp('refl_setMetaMachineName(m, "' + self.machineDef.name + '", NULL);')
            if len(self.machineDef.properties) > 0:
                machinePropertiesVar = self.writeMachineProperties()
                with cpp.subs(propsVar = machinePropertiesVar, numProps = len(self.machineDef.properties)):
                    cpp("refl_setMachineMetaProperties(m, $propsVar$, $numProps$, NULL);")

            statesVar = self.writeStateDefinitions()
            with cpp.subs(states = statesVar, numStates = len(self.machineDef.states)):
                cpp('refl_setMetaStates(m, $states$, $numStates$, NULL);')
            with cpp.subs(initState = self.machineDef.initalState):
                cpp('refl_setCurrentState(m, $initState$, NULL);')
            if self.machineDef.suspendState != None:
                with cpp.subs(sState = self.machineDef.suspendState):
                    cpp('refl_setSuspendState(m, $sState$, NULL);')
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
                if len(state.properties) > 0:
                    stateProps = self.writeStateProperties(state)
                    with cpp.subs(stateProps = stateProps, numProps = len(state.properties)):
                        cpp('refl_setStateMetaProperties(ms_$sName$, $stateProps$, $numProps$, NULL);')
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

    def writeMachineProperties(self):
        cpp = self.cpp
        propertiesVar = "machineProperties"
        with cpp.subs(numProperties = len(self.machineDef.properties),
                        propsVar = propertiesVar):
            cpp("refl_metaProperty $propsVar$[$numProperties$];")
        for index, prop in enumerate(self.machineDef.properties):
            getFunctionV = "mp_machine_" + prop.name + "_getAsVoid"
            setFunctionV = "mp_machine_" + prop.name + "_setAsVoid"
            getFunctionS = "mp_machine_" + prop.name + "_getAsString"
            setFunctionS = "mp_machine_" + prop.name + "_setAsString"
            with cpp.subs(mName = self.machineDef.name, pName = prop.name,
                            pType = prop.dataType, varName = "mp_machine_" + prop.name,
                            getV = getFunctionV, setV = setFunctionV,
                            getS = getFunctionS, setS = setFunctionS, index = index,
                            indirection = prop.indirection, enumType = prop.enumType):
                cpp("refl_metaProperty $varName$ = refl_initMetaProperty(NULL);")
                cpp('refl_setMetaPropertyName($varName$, "$pName$", NULL);')
                cpp('refl_setMetaPropertyTypeString($varName$, "$pType$", NULL);')
                if prop.isUnsigned:
                    cpp('refl_setIsMetaPropertyUnsigned($varName$, refl_TRUE, NULL);')
                else:
                    cpp('refl_setIsMetaPropertyUnsigned($varName$, refl_FALSE, NULL);')
                cpp('refl_setMetaPropertyIndirection($varName$, $indirection$, NULL);')
                cpp('refl_setMetaPropertyType($varName$, $enumType$ , NULL);')
                cpp("refl_setMetaPropertyVoidFunctions($varName$, $getV$, $setV$, NULL);")
                cpp("refl_setMetaPropertyStringFunctions($varName$, $getS$, $setS$, NULL);")
                cpp('machineProperties[$index$] = $varName$;')
        return propertiesVar

    def writeStateProperties(self, state):
        cpp = self.cpp
        statePropsVar = state.name + '_properties'
        numProps = len(state.properties)
        with cpp.subs(statePropsVar = statePropsVar, numProps = numProps):
            cpp('refl_metaProperty $statePropsVar$[$numProps$];')
            for index, prop in enumerate(state.properties):
                getFunctionV = 'mp_' + state.name + '_' + prop.name + "_getAsVoid"
                setFunctionV = 'mp_' + state.name + '_' + prop.name + "_setAsVoid"
                getFunctionS = 'mp_' + state.name + '_' + prop.name + "_getAsString"
                setFunctionS = 'mp_' + state.name + '_' + prop.name + "_setAsString"
                isUs = 'refl_TRUE' if prop.isUnsigned else 'refl_FALSE'
                enumType = self.typeInterpreter.getReflectType(prop.dataType)
                with cpp.subs(varName = 'mp_' + state.name + '_' + prop.name,
                              index = index, pName = prop.name, pType = prop.dataType,
                              getV = getFunctionV, setV = setFunctionV,
                              getS = getFunctionS, setS = setFunctionS,
                              isUs = isUs, enumType = enumType,
                              indirection = prop.indirection):
                    cpp("refl_metaProperty $varName$ = refl_initMetaProperty(NULL);")
                    cpp('refl_setMetaPropertyName($varName$, "$pName$", NULL);')
                    cpp('refl_setMetaPropertyTypeString($varName$, "$pType$", NULL);')
                    if prop.isUnsigned:
                        cpp('refl_setIsMetaPropertyUnsigned($varName$, refl_TRUE, NULL);')
                    else:
                        cpp('refl_setIsMetaPropertyUnsigned($varName$, refl_FALSE, NULL);')
                    cpp('refl_setMetaPropertyIndirection($varName$, $indirection$, NULL);')
                    # Get type enum value
                    enumType = self.typeInterpreter.getReflectType(prop.dataType)
                    if enumType:
                        cpp('refl_setMetaPropertyType($varName$, ' + enumType + ', NULL);')
                    cpp("refl_setMetaPropertyVoidFunctions($varName$, $getV$, $setV$, NULL);")
                    cpp("refl_setMetaPropertyStringFunctions($varName$, $getS$, $setS$, NULL);")
                    cpp('$statePropsVar$[$index$] = $varName$;')
        return statePropsVar
