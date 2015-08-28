std::cout << "------------ Variables ---------------" << std::endl;
unsigned int numProperties = refl_getNumberOfMachineProperties(metaMachine, NULL);
std::cout << "I have " << numProperties << " variables" << std::endl;
refl_metaProperty * properties = refl_getMachineMetaProperties(metaMachine, NULL);
for (unsigned int i = 0; i < numProperties; i++)
{
	std::string type(refl_getMetaPropertyType(properties[i], NULL));
	std::string name(refl_getMetaPropertyName(properties[i], NULL));
	void * address = refl_getMachinePropertyValue_V(metaMachine, i, NULL);
	std::cout << type << " " << name << " " << address << std::endl;
}
std::cout << "----------------------------------------- " << std::endl;
