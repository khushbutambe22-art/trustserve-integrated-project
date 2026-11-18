@echo off
setlocal
if not exist out mkdir out
echo Compiling application and test classes...
javac -encoding UTF-8 -d out src\main\java\com\trustserve\*.java src\test\java\com\trustserve\*.java
if errorlevel 1 (
  echo Test compilation failed.
  exit /b 1
)
echo Running TrustServe test cases...
java -cp out com.trustserve.TrustServeTests
