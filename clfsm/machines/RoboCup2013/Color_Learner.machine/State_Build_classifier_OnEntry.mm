say("Building the classifier");

//system("java -classpath ~/OpenChallenge/java/weka.jar:. ~/OpenChallenge/java/ColorLearner");
//system("java -classpath ~/OpenChallenge/java/ HelloWorld");


std::string java_comp = "javac -classpath ";
java_comp += getenv("HOME");
java_comp += "/data/OpenChallenge/weka.jar ";
java_comp += getenv("HOME");
java_comp += "/data/OpenChallenge/ColorLearner.java";
system((char *) java_comp.c_str());

std::string java_run = "java -cp ";
java_run += getenv("HOME");
java_run += "/data/OpenChallenge/weka.jar:";
java_run += getenv("HOME");
java_run += "/data/OpenChallenge/ ColorLearner";
system((char *) java_run.c_str());
