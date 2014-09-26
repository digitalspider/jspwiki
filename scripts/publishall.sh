#!/bin/bash
#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
PLUGINSDIR=$DSDIR/jspwiki-plugins

#Ensure this script is run as spider
if [ `whoami` != 'spider' ] ; then
        echo "ERROR: This command needs to be run as spider user. You are: `whoami`"
        exit 1;
fi

if [ $# -ne 1 ] ; then
  echo "Usage $0 <tomcat>"
  exit 1;
fi

CATALINA_HOME=/opt/tomcat/$1
if [ ! -d $CATALINA_HOME ] ; then
  echo "Tomcat $1 does not exist";
  exit 1;
fi

TOMCATENV=`echo $1 | cut -d '-' -f 2`
WIKIFILE=wikis-$TOMCATENV.txt

while read WIKINAME; do
  $BASEDIR/scripts/publish.sh $1 $WIKINAME
done < $BASEDIR/activewikis.txt

#sudo service tomcat restart
