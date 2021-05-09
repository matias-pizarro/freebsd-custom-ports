# CMake generated Testfile for 
# Source directory: /usr/home/mpizarro/devel/ports/databases/apache-orc/work/orc-rel-release-1.6.4/java
# Build directory: /usr/home/mpizarro/devel/ports/databases/apache-orc/java
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(java-test "mvn" "--batch-mode" "-Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn" "-Pcmake" "-Dbuild.dir=/usr/home/mpizarro/devel/ports/databases/apache-orc/java" "test")
set_tests_properties(java-test PROPERTIES  WORKING_DIRECTORY "/usr/home/mpizarro/devel/ports/databases/apache-orc/work/orc-rel-release-1.6.4/java" _BACKTRACE_TRIPLES "/usr/home/mpizarro/devel/ports/databases/apache-orc/work/orc-rel-release-1.6.4/java/CMakeLists.txt;47;add_test;/usr/home/mpizarro/devel/ports/databases/apache-orc/work/orc-rel-release-1.6.4/java/CMakeLists.txt;0;")
