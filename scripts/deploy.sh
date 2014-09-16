#!/bin/bash
#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
SRCDIR=$DSDIR/jspwiki-src
TARGET=$SRCDIR/jspwiki-war/target
WIKISDIR=$BASEDIR/wikis

# Run maven
cd $SRCDIR
mvn -Dmaven.test.skip=true package
cd $BASEDIR

while read WIKINAME; do
  WIKIHOME=$WIKISDIR/$WIKINAME
  WIKIDEST=$CATALINA_HOME/webapps/$WIKINAME

  # Deploy jspwiki-commons.js
  cp $TARGET/generated-sources/wro/scripts/jspwiki-common.js $WIKIDEST/scripts/

  # Deploy JSPWiki-classes.jar
  cp $TARGET/JSPWiki-classes.jar $WIKIDEST/WEB-INF/lib/JSPWiki-classes.jar

  echo "Deployed $WIKINAME"
done < $BASEDIR/activewikis.txt

sudo service tomcat restart
