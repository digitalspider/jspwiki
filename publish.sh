#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CONFIGDIR=$BASEDIR/config
DATADIR=$BASEDIR/data
WIKISDIR=$BASEDIR/wikis
WEBAPPS=$CATALINA_HOME/webapps

while read WIKINAME; do
  # Create classes directories
  mkdir -p $WIKISDIR/$WIKINAME/WEB-INF/classes

  # Setup jspwiki-custom.properties
  cp -f $CONFIGDIR/$WIKINAME/jspwiki-custom-linux.properties $WIKISDIR/$WIKINAME/WEB-INF/classes/jspwiki-custom.properties

  # Setup jspwiki-custom.policy
  cp -f $DATADIR/$WIKINAME/jspwiki-custom.policy $WIKISDIR/$WIKINAME/WEB-INF/jspwiki-custom.policy

  # Setup jspwiki-filters.xml
  #cp -f $BASEDIR/$WIKINAME/data/jspwiki-filters.xml $WIKISDIR/$WIKINAME/WEB-INF/classes/filters.xml

  # Deploy to live
  cp -rf $WIKISDIR/$WIKINAME/* $WEBAPPS/$WIKINAME/

  # Output
  echo "Deployed $WIKINAME"
done <activewikis.txt
