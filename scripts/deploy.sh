#!/bin/bash
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CODEDIR=$BASEDIR/code
SRCDIR=$CODEDIR/jspwiki-dev
TARGET=$SRCDIR/jspwiki-war/target
WIKISDIR=$BASEDIR/wikis

#Ensure this script is run as spider
if [ `whoami` != 'spider' ] ; then
        echo "ERROR: This command needs to be run as spider user. You are: `whoami`"
        exit 1;
fi

if [ $# -lt 2 ] ; then
  echo "Usage $0 <tomcat> <wikiname> [-m]"
  exit 1;
fi

CATALINA_HOME=/opt/tomcat/$1
if [ ! -d $CATALINA_HOME ] ; then
  echo "Tomcat $1 does not exist";
  exit 1;
fi
WIKINAME=$2
WIKIHOME=$WIKISDIR/$WIKINAME
WIKIDEST=$CATALINA_HOME/webapps/$WIKINAME
WEBLIBDIR=$WIKIDEST/WEB-INF/lib/
if [ ! -d $WIKIHOME ] ; then
  echo "The folder $WIKIHOME does not exist";
  exit 1;
fi
if [ ! -d $WIKIDEST ] ; then
  echo "The folder $WIKIDEST does not exist";
  exit 1;
fi

$BASEDIR/scripts/applypatches.sh

if [ "$3" == "-m" ] ; then
  # Run maven
  cd $SRCDIR
  mvn -Dmaven.test.skip=true package
  cd $BASEDIR
fi

# Deploy jspwiki-commons.js
cp $TARGET/JSPWiki/scripts/jspwiki-common.js $WIKIDEST/scripts/
#cp $SRCDIR/jspwiki-war/src/main/scripts/jspwiki-common.js $WIKIDEST/scripts/

# Deploy JSPWiki-classes.jar
cp $TARGET/JSPWiki-classes.jar $WEBLIBDIR/JSPWiki-classes.jar

echo "Deployed $WIKINAME"
