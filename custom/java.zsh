## JAVA_HOME
if command -v java &> /dev/null
then
	# export JAVA_HOME="$(readlink -f /usr/bin/java | sed "s:/bin/java::")" 
  export JAVA_HOME="$HOME/.local/share/JetBrains/Toolbox/apps/android-studio/jbr/"
fi
