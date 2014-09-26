#!/bin/bash

#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CONFIGDIR=$BASEDIR/config
DATADIR=$BASEDIR/data
WIKISDIR=$BASEDIR/wikis
WEBAPPS=$CATALINA_HOME/webapps

#Ensure this script is run as spider
if [ `whoami` != 'spider' ] ; then
        echo "ERROR: This command needs to be run as spider user. You are: `whoami`"
        exit 1;
fi

if [ $# -ne 1 ] ; then
  echo "Usage $0 <wikiname>"
  exit 1;
fi

WIKINAME=$1
EXISTSWIKI=`grep "^$WIKINAME$" $BASEDIR/activewikis.txt | wc -l`
if [ $EXISTSWIKI -ne 1 ] ; then
  echo "There is no wiki called $WIKINAME"
  exit 1;
fi
cat $BASEDIR/activewikis.txt > $BASEDIR/activewikis.txt.~
cat $BASEDIR/activewikis.txt.~ | grep -v "^$WIKINAME$" > $BASEDIR/activewikis.txt

rm -rf $CONFIGDIR/$WIKINAME
rm -rf $DATADIR/$WIKINAME
rm -rf $WIKISDIR/$WIKINAME
