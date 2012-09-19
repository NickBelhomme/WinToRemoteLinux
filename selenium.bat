@echo off
SET cleanedPath=%1
REM the mapped drive letter in windows must be mapped to your folder in linux and slashes must be converted
set "rootPath=\export"
SET cleanedPath=%rootPath%%cleanedPath:~2%
SET cleanedPath=%cleanedPath:\=/%
REM write the command into a file to be executed by plink
ECHO Xvfb :1 ^& export DISPLAY=:1.0 ; /usr/lib/jvm/java-6-sun/bin/java -jar /PATH_TO_STANDALONE_SERVER/selenium-server-standalone-2.25.0.jar -htmlSuite *firefox http://www.nickbelhomme.com/ %cleanedPath% /media/windows/selenium-results.html ; pkill Xvfb; > C:\[PATH_TO_PUTTY]\selenium.cmd
ECHO SELENIUM Test started [waiting to complete]
REM execute the command
C:\[PATH_TO_PUTTY]\plink.exe -load devbox -pw mypass -m C:\[PATH_TO_PUTTY]\selenium.cmd
"C:\Program Files\Mozilla Firefox\firefox.exe" C:\vmShare\selenium-results.html
