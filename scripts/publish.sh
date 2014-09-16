#!/bin/bash
#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
WIKISDIR=$BASEDIR/wikis

while read WIKINAME; do
  WIKIHOME=$WIKISDIR/$WIKINAME
  WIKIDEST=$CATALINA_HOME/webapps/$WIKINAME
  WEBLIBDIR=$WIKIDEST/WEB-INF/lib/

  # Create classes directories
  mkdir -p $WIKIHOME/webapp/WEB-INF/classes

  # Setup jspwiki-custom.properties
  cp -f $WIKIHOME/conf/jspwiki-custom-linux.properties $WIKIHOME/webapp/WEB-INF/classes/jspwiki-custom.properties

  # Setup jspwiki-custom.policy
  cp -f $WIKIHOME/data/jspwiki-custom.policy $WIKIHOME/webapp/WEB-INF/jspwiki-custom.policy

  # Setup jspwiki-filters.xml
  #cp -f $WIKIHOME/data/jspwiki-filters.xml $WIKIHOME/webapp/WEB-INF/classes/filters.xml

  # Deploy to live
  cp -rf $WIKIHOME/webapp/* $WIKIDEST/

  # Output
  echo "Published $WIKINAME"
done < $BASEDIR/activewikis.txt
