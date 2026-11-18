@echo off
setlocal
if not exist out mkdir out
echo Compiling TrustServe Java backend...
javac -encoding UTF-8 -d out src\main\java\com\trustserve\*.java
if errorlevel 1 (
  echo Compilation failed. Check that JDK 17 or newer is installed.
  exit /b 1
)
echo Starting TrustServe at http://localhost:8080
java -cp out com.trustserve.TrustServeServer
