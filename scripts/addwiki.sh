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
if [ -d $WIKIDEST ] ; then
  echo "The folder $WIKIDEST already exists";
  exit 1;
fi

TOMCATENV=`echo $1 | cut -d '-' -f 2`
WIKIFILE=wikis-$TOMCATENV.txt
TOMCATURL=$TOMCATENV.
if [ "$TOMCATENV" == "live" ] ; then
  unset TOMCATURL
fi

EXISTSWIKI=`grep "^$WIKINAME$" $BASEDIR/$WIKIFILE | wc -l`
if [ $EXISTSWIKI -ge 1 ] ; then 
  echo "A wiki with the name $WIKINAME is already exists in $BASEDIR/$WIKIFILE"
  exit 1;
fi

# Add new wiki
echo "$WIKINAME" >> $BASEDIR/$WIKIFILE

mkdir -p $WIKIHOME
cp -r $WIKISDIR/wikitemplate/* $WIKIHOME
cat $WIKISDIR/wikitemplate/conf/jspwiki-custom-linux.properties | sed s/@WIKINAME@/$WIKINAME/g | sed s/@TOMCATURL@/$TOMCATURL/g > $WIKIHOME/conf/jspwiki-custom-linux.properties
cat $WIKISDIR/wikitemplate/conf/jspwiki-custom-windows.properties | sed s/@WIKINAME@/$WIKINAME/g | sed s/@TOMCATURL@/$TOMCATURL/g > $WIKIHOME/conf/jspwiki-custom-windows.properties
ln -s $DSDIR/dscore/downloads/jspwiki/2.10.1/JSPWiki.war $WIKIDEST.war

echo "$WIKINAME wiki configured"
sleep 10;
$BASEDIR/scripts/publish.sh $1 $2
$BASEDIR/scripts/plugins.sh $1 $2
#$BASEDIR/scripts/deploy.sh $1 $2

echo "$WIKINAME wiki created"

