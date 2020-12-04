:: C++ Project Creator (ver. 1.1.4 - 2020)
:: Made by Alberto Lazari
:: Includes Auto Makefile

@echo off
:: Color variables
set red=[91m
set green=[92m
set blue=[94m
set yellow=[93m
set end=[0m

set projName=""
set prompted=false

if "%1" == "" goto prompt

if %1 == -h goto dohere
if %1 == --here goto dohere

if %1 == -? goto help
if %1 == --help goto help

if %1 == -v goto version
if %1 == --version goto version
if %1 == --credits goto version

if %1 == -n goto name
if %1 == --name goto name

call echolored "error: %1 not supported" red
call echolored "use -? or --help to see the instructions" red
goto end

:help
  echo.
  echo The command "setup-cpp-proj" creates a new directory consisting of all the files and
  echo directories you will need to code a C++ project in Visual Studio Code
  echo.
  echo parameters:
  call echolored "-?, --help" green
  echo     shows this message
  call echolored "-h, --here" green
  echo     creates the files and directories in the current directory
  call echolored "-v, --version, --credits" green
  echo     displays the current version and credits about the script
  call echolored "-n, --name" green
  echo     creates a new project with a specific name (skips prompt)
  goto end

:version
  echo.
  echo *******************************************
  echo * %green%C++ Project Creator (ver. 1.1.4 - 2020)%end% *
  echo *          Made by %blue%Alberto Lazari%end%         *
  echo *          Includes %yellow%Auto Makefile%end%         *
  echo *******************************************
  echo.
  goto end

:name
  if "%2" == "" (
      call echolored "error: when using %1 you have to specify a name for the project" red
      call echolored "use -? or --help to see the instructions" red
      goto end
    )
    set projName=%2
    goto prompt

:prompt
  set prompted=true
  if %projName% == "" (
    set projName=NewProject
    set /P projName="Project Name: %green%"
    echo %end%
  )
  if exist "%cd%\%projName%" (
    call echolored "error: %projName% directory already exists" red
    echo.
    goto prompt
  )
  mkdir "%cd%"\"%projName%"
  cd "%projName%"
  goto dohere

:dohere
  for /F "delims==" %%i in ("%cd%") do set projName=%%~ni
  if not exist "%cd%"\src mkdir "%cd%"\src
  if not exist "%cd%"\include mkdir "%cd%"\include
  >NUL copy "%~dp0"\Makefile "%cd%"\Makefile /Y
  >NUL xcopy /E "%~dp0"\.vscode "%cd%"\.vscode\ /Y
  
  if %prompted% == true cd ..

  echo ============ PROJECT %green%%projName%%end% CREATED ============
  goto end

:end
