#!/bin/bash
#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CODEDIR=$BASEDIR/code
SRCDIR=$CODEDIR/jspwiki-dev
TARGET=$SRCDIR/jspwiki-war/target
WIKISDIR=$BASEDIR/wikis

$BASEDIR/scripts/applypatches.sh

# Run maven
cd $SRCDIR
mvn -Dmaven.test.skip=true package
cd $BASEDIR

while read WIKINAME; do
  WIKIHOME=$WIKISDIR/$WIKINAME
  WIKIDEST=$CATALINA_HOME/webapps/$WIKINAME
  WEBLIBDIR=$WIKIDEST/WEB-INF/lib/

  # Deploy jspwiki-commons.js
  cp $TARGET/JSPWiki/scripts/jspwiki-common.js $WIKIDEST/scripts/
  #cp $SRCDIR/jspwiki-war/src/main/scripts/jspwiki-common.js $WIKIDEST/scripts/

  # Deploy JSPWiki-classes.jar
  cp $TARGET/JSPWiki-classes.jar $WEBLIBDIR/JSPWiki-classes.jar

  echo "Deployed $WIKINAME"
done < $BASEDIR/activewikis.txt

#sudo service tomcat restart
