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

# Setup jspwiki-custom.policy
cp -f $BASEDIR/dswiki/data/jspwiki-custom.policy $JSPWIKIDIR/WEB-INF/classes/jspwiki-custom.policy
cp -f $BASEDIR/mywiki/data/jspwiki-custom.policy $MYWIKIDIR/WEB-INF/classes/jspwiki-custom.policy
cp -f $BASEDIR/testwiki/data/jspwiki-custom.policy $TESTWIKIDIR/WEB-INF/classes/jspwiki-custom.policy

# Setup jspwiki-filters.xml
#cp -f $BASEDIR/dswiki/data/jspwiki-filters.xml $JSPWIKIDIR/WEB-INF/classes/jspwiki-filters.xml
#cp -f $BASEDIR/mywiki/data/jspwiki-filters.xml $MYWIKIDIR/WEB-INF/classes/jspwiki-filters.xml
#cp -f $BASEDIR/testwiki/data/jspwiki-filters.xml $TESTWIKIDIR/WEB-INF/classes/jspwiki-filters.xml
