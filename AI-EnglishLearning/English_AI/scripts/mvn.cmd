@echo off
rem Run Maven with JDK 17+ (mirrors scripts/mvn.sh).
rem
rem Background: JAVA_HOME may point to a JRE 8, which makes mvn fail with
rem   "class file version 61.0 ... up to 52.0".
rem
rem Usage:
rem   scripts\mvn.cmd -pl exercise-service -am test
rem   scripts\mvn.cmd -DskipTests install
setlocal EnableExtensions

set "CHOSEN="
call :try_jdk "%JAVA_HOME%"
if not defined CHOSEN call :try_jdk "%ProgramFiles%\Java\jdk-21"
if not defined CHOSEN call :try_jdk "%ProgramFiles%\Java\jdk-17"
if not defined CHOSEN call :try_jdk "C:\jdk-21"
if not defined CHOSEN call :try_jdk "C:\jdk-17"

if not defined CHOSEN (
    echo ERROR: no JDK 17+ found. Install JDK 17 or 21, or set JAVA_HOME. 1>&2
    echo        current JAVA_HOME=%JAVA_HOME% 1>&2
    exit /b 1
)

set "JAVA_HOME=%CHOSEN%"
echo [mvn.cmd] JAVA_HOME=%JAVA_HOME%
call mvn %*
exit /b %ERRORLEVEL%

rem ---------------------------------------------------------------
rem :try_jdk ^<dir^> - set CHOSEN when dir has bin\javac.exe and major >= 17
rem ---------------------------------------------------------------
:try_jdk
set "CAND=%~1"
set "RAW="
set "MAJOR="
if "%CAND%"=="" exit /b 0
if not exist "%CAND%\bin\javac.exe" exit /b 0

rem javac -version prints e.g. "javac 17.0.3.1".
rem Redirect to a temp file and read the first line: for /f quote handling
rem is unreliable when the path contains spaces.
set "VERFILE=%TEMP%\mvn_jdk_ver_%RANDOM%%RANDOM%.txt"
"%CAND%\bin\javac.exe" -version > "%VERFILE%" 2>&1
set "LINE="
set /p LINE=<"%VERFILE%"
del "%VERFILE%" >nul 2>&1
if not defined LINE exit /b 0

for %%a in (%LINE%) do set "RAW=%%a"
if not defined RAW exit /b 0

for /f "tokens=1 delims=." %%a in ("%RAW%") do set "MAJOR=%%a"
if "%MAJOR%"=="1" for /f "tokens=2 delims=." %%b in ("%RAW%") do set "MAJOR=%%b"
if not defined MAJOR exit /b 0
if %MAJOR% LSS 17 exit /b 0

set "CHOSEN=%CAND%"
exit /b 0
