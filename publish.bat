echo off
set WIKIDIR=%CATALINA_HOME%\webapps\JSPWiki

REM Setup jspwiki-custom.properties
xcopy .\jspwiki-custom-windows.properties .\WEB-INF\classes\jspwiki-custom.properties /Y /Q

REM Copy the WEB-INF directory
xcopy .\WEB-INF %WIKIDIR%\WEB-INF /Y /S /E /Q
