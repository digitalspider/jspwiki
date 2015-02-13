#!/bin/bash
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

# Create classes directories
mkdir -p $WIKIHOME/webapp/WEB-INF/classes

# Setup jspwiki-custom.properties
cp -f $WIKIHOME/conf/jspwiki-custom-linux.properties $WIKIHOME/webapp/WEB-INF/classes/jspwiki-custom.properties

# Setup jspwiki-custom.policy
cp -f $WIKIHOME/data/jspwiki-custom.policy $WIKIHOME/webapp/WEB-INF/jspwiki-custom.policy

# Setup jspwiki-filters.xml
#cp -f $WIKIHOME/data/jspwiki-filters.xml $WIKIHOME/webapp/WEB-INF/classes/filters.xml

# Deploy to live
if [ ! -d "$WIKIDEST" ] ; then
    unzip $WIKIDEST.war -d $WIKIDEST
fi

cp -rf $WIKIHOME/webapp/* $WIKIDEST/

# Output
echo "Published $WIKINAME"
