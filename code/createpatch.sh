#!/bin/bash

#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CODEDIR=$BASEDIR/code
PATCHDIR=$CODEDIR/patches
STAGEDIR=$CODEDIR/jspwiki-stage

cd $STAGEDIR
svn diff > $PATCHDIR/$1.patch
cd ..

