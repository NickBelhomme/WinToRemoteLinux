@echo off
SET cleanedPath=%1
REM the mapped drive letter in windows must be mapped to your folder in linux and slashes must be converted
set "rootPath=\export"
SET cleanedPath=%rootPath%%cleanedPath:~2%
SET cleanedPath=%cleanedPath:\=/%
REM write the command into a file to be executed by plink
ECHO phpunit --colors --bootstrap /PATH_TO_YOUR_BOOTSTRAP_ON_THE_LINUX_SYSTEM/bootstrap.php "%cleanedPath%" > C:\PATH_TO_PUTTY\phpunit.cmd
REM execute the command
C:\[PATH_TO_PUTTY]\plink.exe -load devbox -pw mypass -m C:\PATH_TO_PUTTY\phpunit.cmd
