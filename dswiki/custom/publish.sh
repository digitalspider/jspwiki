WIKIDIR=$CATALINA_HOME/webapps/JSPWiki

# Setup jspwiki-custom.properties
cp -f ./jspwiki-custom-linux.properties ./WEB-INF/classes/jspwiki-custom.properties

# Copy the WEB-INF directory
cp -rf ./WEB-INF/* ${WIKIDIR}/WEB-INF/
