#!/bin/bash

#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CONFIGDIR=$BASEDIR/config
DATADIR=$BASEDIR/data
WIKISDIR=$BASEDIR/wikis
WEBAPPS=$CATALINA_HOME/webapps

if [ $# -ne 1 ] ; then
  echo "Usage $0 <wikiname>"
  exit 1;
fi

WIKINAME=$1
EXISTSWIKI=`grep "^$WIKINAME$" $BASEDIR/activewikis.txt | wc -l`
if [ $EXISTSWIKI -ge 1 ] ; then 
  echo "A wiki with the name $WIKINAME is already taken"
  exit 1;
fi
echo "$WIKINAME" >> $BASEDIR/activewikis.txt

mkdir -p $CONFIGDIR/$WIKINAME
mkdir -p $DATADIR/$WIKINAME
mkdir -p $WIKISDIR/$WIKINAME

echo "$WIKINAME wiki created"

