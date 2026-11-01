# Set JAVA_HOME variable
if command -v java &>/dev/null; then
	## Get the actual java executable path from update-alternatives
	export JAVA_HOME=$(readlink -f $(which java) | sed 's:/bin/java::')
	# export PATH=$JAVA_HOME/bin:$PATH
fi
