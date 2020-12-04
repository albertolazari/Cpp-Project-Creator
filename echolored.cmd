:: Echolored (ver. 1.1.0 - 2020)
:: Made by Alberto Lazari

@echo off
set red=[91m
set green=[92m
set blue=[94m
set yellow=[93m
set cyan=[96m

set end=[0m

set Echolored=%green%E%blue%c%red%h%yellow%o%green%l%blue%o%red%r%yellow%e%green%d%end%

if "%~1" == "" (
    echo %red%error: you need to pass a string to echo
    echo use -? or --help to see the instructions%end%
    goto end
)
if %1 == -? goto help
if %1 == --help goto help
if %1 == -v goto version
if %1 == --version goto version
if %1 == --credits goto version

if "%2" == "" (
    echo %red%error: you need to specify the color you want the string to be echoed%end%
    echo %red%use -? or --help to see the instructions%end%
    goto end
)
if %2 == red (
    echo %red%%~1%end%
    goto end
)
if %2 == green (
    echo %green%%~1%end%
    goto end
)
if %2 == blue (
    echo %blue%%~1%end%
    goto end
)
if %2 == yellow (
    echo %yellow%%~1%end%
    goto end
)
if %2 == cyan (
    echo %cyan%%~1%end%
    goto end
)

echo %red%error: color %2 not supported
echo use -? or --help to see the instructions%end%
goto end

:help
    echo.
    echo %Echolored% allows you to echo colored strings from batch files!!
    echo syntax: call echolored %red%"string to echo"%end% [%blue%color%end%]
    echo.
    echo colors supported:
    echo %red%red
    echo %green%green
    echo %blue%blue
    echo %yellow%yellow
    echo %cyan%cyan%end%
    echo.
    echo you can also use these parameters:
    echo %green%-?, --help%end%
    echo     shows this message
    echo %green%-v, --version, --credits%end%
    echo     displays the current version and credits about the script
    goto end

:version
    echo.
    echo *********************************
    echo * %Echolored% (ver. 1.1.0 - 2020) *
    echo *    Made by %blue%Alberto Lazari%end%     *
    echo *********************************
    echo.
    goto end

:end
