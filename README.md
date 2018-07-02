Sample Maven project to reproduce https://issues.apache.org/jira/projects/MDEP/issues/MDEP-82

Usage: 
- First go offline in a dedicated, clean repository: `mvn -Dmaven.repo.local=${DIR}/m2repo -U -C -e -V dependency:go-offline`
- Then try to compile in offline mode using that repository: `mvn -Dmaven.repo.local=${DIR}/m2repo -e -V --offline clean package`
- This fails with Maven 3.5.4 on Ubuntu 16.04 x64 and JDK 1.8 u171
- Fail occurs because of missing dependency of JaCoCo plugin
- Using `mvn [...] dependency:resolve-plugins -DexcludeTransitive=false` does not help

`./build.sh` wraps the 2 commands.
