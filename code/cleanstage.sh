#!/bin/bash

#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CODEDIR=$DSDIR/code
PATCHDIR=$CODEDIR/patches
STAGEDIR=$CODEDIR/jspwiki-stage

cd $STAGEDIR
svn revert -R .
cd ..

