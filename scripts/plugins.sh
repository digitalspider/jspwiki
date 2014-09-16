#!/bin/bash
#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
PLUGINSDIR=$DSDIR/jspwiki-plugins

while read WIKINAME; do
  WIKIHOME=$WIKISDIR/$WIKINAME
  WIKIDEST=$CATALINA_HOME/webapps/$WIKINAME
  WEBLIBDIR=$WIKIDEST/WEB-INF/lib/

  # Deploy all plugins
  cp $PLUGINSDIR/MyPlugin/dist/*.jar $WEBLIBDIR/
  cp $PLUGINSDIR/TreePlugin/dist/*.jar $WEBLIBDIR/
  cp $PLUGINSDIR/HitCountPlugin/dist/*.jar $WEBLIBDIR/
  cp $PLUGINSDIR/GoComicsPlugin/dist/*.jar $WEBLIBDIR/
  unzip -q -o $PLUGINSDIR/ImageGalleryPlugin/dist/*.zip -d $WIKIDEST/
  cp $PLUGINSDIR/ImageGalleryPlugin/dist/*.jar $WEBLIBDIR/
  cp $PLUGINSDIR/VideoPlugin/dist/*.jar $WEBLIBDIR/
  cp $PLUGINSDIR/JiraPlugin/dist/*.jar $WEBLIBDIR/
  unzip -q -o $PLUGINSDIR/JiraPlugin/dist/*.zip -d $WEBLIBDIR/
  cp $PLUGINSDIR/PluginListPlugin/dist/*.jar $WEBLIBDIR/
  cp -rf $PLUGINSDIR/JDBCPlugin/etc/*.jar -d $WEBLIBDIR/
  cp $PLUGINSDIR/JDBCPlugin/dist/*.jar $WEBLIBDIR/
  cp $PLUGINSDIR/AutoLinkHtmlFilter/dist/*.jar $WEBLIBDIR/

  echo "Plugins Deployed to $WIKINAME"
done < $BASEDIR/activewikis.txt

#sudo service tomcat restart
