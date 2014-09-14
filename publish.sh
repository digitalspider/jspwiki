CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CONFIGDIR=$BASEDIR/config
DATADIR=$BASEDIR/data
WIKISDIR=$BASEDIR/wikis
WEBAPPS=$CATALINA_HOME/webapps

# Create classes directories
mkdir -p $WIKISDIR/JSPWiki/WEB-INF/classes
mkdir -p $WIKISDIR/mywiki/WEB-INF/classes
mkdir -p $WIKISDIR/testwiki/WEB-INF/classes

# Setup jspwiki-custom.properties
cp -f $CONFIGDIR/JSPWiki/jspwiki-custom-linux.properties $WIKISDIR/JSPWiki/WEB-INF/classes/jspwiki-custom.properties
cp -f $CONFIGDIR/mywiki/jspwiki-custom-linux.properties $WIKISDIR/mywiki/WEB-INF/classes/jspwiki-custom.properties
cp -f $CONFIGDIR/testwiki/jspwiki-custom-linux.properties $WIKISDIR/testwiki/WEB-INF/classes/jspwiki-custom.properties

# Setup jspwiki-custom.policy
cp -f $DATADIR/JSPWiki/jspwiki-custom.policy $WIKISDIR/JSPWiki/WEB-INF/jspwiki-custom.policy
cp -f $DATADIR/mywiki/jspwiki-custom.policy $WIKISDIR/mywiki/WEB-INF/jspwiki-custom.policy
cp -f $DATADIR/testwiki/jspwiki-custom.policy $WIKISDIR/testwiki/WEB-INF/jspwiki-custom.policy

# Setup jspwiki-filters.xml
#cp -f $BASEDIR/dswiki/data/jspwiki-filters.xml $JSPWIKIDIR/WEB-INF/classes/filters.xml
#cp -f $BASEDIR/mywiki/data/jspwiki-filters.xml $MYWIKIDIR/WEB-INF/classes/filters.xml
#cp -f $BASEDIR/testwiki/data/jspwiki-filters.xml $TESTWIKIDIR/WEB-INF/classes/filters.xml

# Deploy to live
cp -rf $WIKISDIR/JSPWiki/* $WEBAPPS/JSPWiki/
cp -rf $WIKISDIR/mywiki/* $WEBAPPS/mywiki/
cp -rf $WIKISDIR/testwiki/* $WEBAPPS/testwiki/

