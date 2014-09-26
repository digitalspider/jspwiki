#!/bin/bash

#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
WIKISDIR=$BASEDIR/wikis

#Ensure this script is run as spider
if [ `whoami` != 'spider' ] ; then
        echo "ERROR: This command needs to be run as spider user. You are: `whoami`"
        exit 1;
fi

if [ $# -ne 2 ] ; then
  echo "Usage $0 <tomcat> <wikiname>"
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

TOMCATENV=`echo $1 | cut -d '-' -f 2`
WIKIFILE=wikis-$TOMCATENV.txt

EXISTSWIKI=`grep "^$WIKINAME$" $BASEDIR/$WIKIFILE | wc -l`
if [ $EXISTSWIKI -ne 1 ] ; then
  echo "There is no wiki called $WIKINAME in $BASEDIR/$WIKIFILE"
  exit 1;
fi

cat $BASEDIR/$WIKIFILE > $BASEDIR/$WIKIFILE.~
cat $BASEDIR/$WIKIFILE.~ | grep -v "^$WIKINAME$" > $BASEDIR/$WIKIFILE

#mv $WIKIHOME $WIKISDIR/archive/ # no not get rid of content yet
rm -rf $WIKIDEST*

echo "$WIKINAME wiki deleted"
