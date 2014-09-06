echo off
REM set CATALINA_HOME=C:\tomcat\tomcat-9080
set DSDIR=C:\digitalspider
set BASEDIR=%DSDIR%\jspwiki
set JSPWIKIDIR=%CATALINA_HOME%\webapps\JSPWiki
set MYWIKIDIR=%CATALINA_HOME%\webapps\mywiki
set TESTWIKIDIR=%CATALINA_HOME%\webapps\testwiki
set WIKIDIR=%CATALINA_HOME%\webapps\JSPWiki

REM Setup jspwiki-custom.properties
xcopy %BASEDIR%\dswiki\conf\jspwiki-custom-windows.properties %JSPWIKIDIR%\WEB-INF\classes\jspwiki-custom.properties /Y /Q
xcopy %BASEDIR%\mywiki\conf\jspwiki-custom-windows.properties %MYWIKIDIR%\WEB-INF\classes\jspwiki-custom.properties /Y /Q
xcopy %BASEDIR%\testwiki\conf\jspwiki-custom-windows.properties %TESTWIKIDIR%\WEB-INF\classes\jspwiki-custom.properties /Y /Q

REM Setup jspwiki-custom.policy
xcopy %BASEDIR%\dswiki\data\jspwiki-custom.policy %JSPWIKIDIR%\WEB-INF\classes\jspwiki-custom.policy /Y /Q
xcopy %BASEDIR%\mywiki\data\jspwiki-custom.policy %MYWIKIDIR%\WEB-INF\classes\jspwiki-custom.policy /Y /Q
xcopy %BASEDIR%\testwiki\data\jspwiki-custom.policy %TESTWIKIDIR%\WEB-INF\classes\jspwiki-custom.policy /Y /Q
