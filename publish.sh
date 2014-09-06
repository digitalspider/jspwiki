#CATALINA_HOME=/opt/tomcat/tomcat-9080
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
JSPWIKIDIR=$CATALINA_HOME/webapps/JSPWiki
MYWIKIDIR=$CATALINA_HOME/webapps/mywiki
TESTWIKIDIR=$CATALINA_HOME/webapps/testwiki

# Setup jspwiki-custom.properties
cp -f $BASEDIR/dswiki/conf/jspwiki-custom-linux.properties $JSPWIKIDIR/WEB-INF/classes/jspwiki-custom.properties
cp -f $BASEDIR/mywiki/conf/jspwiki-custom-linux.properties $MYWIKIDIR/WEB-INF/classes/jspwiki-custom.properties
cp -f $BASEDIR/testwiki/conf/jspwiki-custom-linux.properties $TESTWIKIDIR/WEB-INF/classes/jspwiki-custom.properties

