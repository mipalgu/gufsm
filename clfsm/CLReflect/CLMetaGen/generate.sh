# Resolves the absolute path to the machine and invokes the generator

machine_dir=$(cd $1; pwd)
python main.py $machine_dir $2 
