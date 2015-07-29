#!/bin/bash
#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
PLUGINSDIR=$DSDIR/jspwiki-plugins
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

# Deploy all plugins
rm -rf $WEBLIBDIR/MyPlugin-*.jar
cp $PLUGINSDIR/MyPlugin/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/TreePlugin-*.jar
cp $PLUGINSDIR/TreePlugin/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/HitCountPlugin-*.jar
cp $PLUGINSDIR/HitCountPlugin/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/GoComicsPlugin-*.jar
cp $PLUGINSDIR/GoComicsPlugin/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/GoogleMapsPlugin-*.jar
cp $PLUGINSDIR/GoogleMapsPlugin/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/ImageGalleryPlugin-*.jar
cp $PLUGINSDIR/ImageGalleryPlugin/dist/*.jar $WEBLIBDIR/
unzip -q -o $PLUGINSDIR/ImageGalleryPlugin/dist/*.zip -d $WIKIDEST/
rm -rf $WEBLIBDIR/IFramePlugin-*.jar
cp $PLUGINSDIR/IFramePlugin/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/VideoPlugin-*.jar
cp $PLUGINSDIR/VideoPlugin/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/JiraPlugin-*.jar
cp $PLUGINSDIR/JiraPlugin/dist/*.jar $WEBLIBDIR/
unzip -q -o $PLUGINSDIR/JiraPlugin/dist/*.zip -d $WEBLIBDIR/
rm -rf $WEBLIBDIR/PluginListPlugin-*.jar
cp $PLUGINSDIR/PluginListPlugin/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/JDBCPlugin-*.jar
cp $PLUGINSDIR/JDBCPlugin/dist/*.jar $WEBLIBDIR/
cp -rf $PLUGINSDIR/JDBCPlugin/etc/*.jar -d $WEBLIBDIR/
rm -rf $WEBLIBDIR/AutoLinkHtmlFilter-*.jar
cp $PLUGINSDIR/AutoLinkHtmlFilter/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/EmojiFilter-*.jar
cp $PLUGINSDIR/EmojiFilter/dist/*.jar $WEBLIBDIR/
rm -rf $WEBLIBDIR/PanelPlugin-*.jar
cp $PLUGINSDIR/PanelPlugin/dist/*.jar $WEBLIBDIR/
unzip -q -o $PLUGINSDIR/PanelPlugin/dist/*.zip -d $WIKIDEST/

echo "Plugins Deployed to $WIKINAME"
