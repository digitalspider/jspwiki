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

USEHADDOCK='#'
if [ "$WIKINAME" == "testwiki" ] ; then
  unset USEHADDOCK;
fi

# Add new wiki
echo "$WIKINAME" >> $BASEDIR/$WIKIFILE

mkdir -p $WIKIHOME/data
mkdir -p $WIKIHOME/webapp
cp -r $WIKISDIR/wikitemplate/data/* $WIKIHOME/data/
cp -r $WIKISDIR/wikitemplate/webapp/* $WIKIHOME/webapp/
cat $WIKISDIR/wikitemplate/conf/jspwiki-custom-linux.properties | sed s/@WIKINAME@/$WIKINAME/g | sed s/@TOMCATURL@/$TOMCATURL/g | sed s/@USEHADDOCK@/$USEHADDOCK/g > $WIKIHOME/conf/jspwiki-custom-linux.properties
cat $WIKISDIR/wikitemplate/conf/jspwiki-custom-windows.properties | sed s/@WIKINAME@/$WIKINAME/g | sed s/@TOMCATURL@/$TOMCATURL/g | sed s/@USEHADDOCK@/$USEHADDOCK/g > $WIKIHOME/conf/jspwiki-custom-windows.properties
if [ "$WIKINAME" == "testwiki" ] ; then
  cp -f $WIKISDIR/wikitemplate/conf/jspwiki-custom-free.policy $WIKIHOME/conf/jspwiki-custom.policy
elif [ "$WIKINAME" == "mywiki" ] ; then
  cp -f $WIKISDIR/wikitemplate/conf/jspwiki-custom-locked.policy $WIKIHOME/conf/jspwiki-custom.policy
else
  cp -f $WIKISDIR/wikitemplate/conf/jspwiki-custom-default.policy $WIKIHOME/conf/jspwiki-custom.policy
fi

ln -s $DSDIR/dscore/downloads/jspwiki/2.10.2-svn28/JSPWiki.war $WIKIDEST.war

echo "$WIKINAME wiki configured"
sleep 10;
$BASEDIR/scripts/publish.sh $1 $2
$BASEDIR/scripts/plugins.sh $1 $2
#$BASEDIR/scripts/deploy.sh $1 $2

echo "$WIKINAME wiki created"

