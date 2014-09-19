#!/bin/bash
#CATALINA_HOME=/opt/tomcat/tomcat
DSDIR=/opt/digitalspider
BASEDIR=$DSDIR/jspwiki
CODEDIR=$BASEDIR/code
SRCDIR=$CODEDIR/jspwiki-dev
TARGET=$SRCDIR/jspwiki-war/target
WIKISDIR=$BASEDIR/wikis

cd $SRCDIR
# Revert patches
svn revert -R .
# Apply patches
patchfiles="$CODEDIR/patches/*.patch"
for PATCH in $patchfiles
do
   echo "### Applying $PATCH START ###"
   patch -p0 < $PATCH
   echo "### Applying $PATCH DONE ###"
done

