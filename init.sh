#!/bin/sh
LAB="Lab 2 of Fuse_EAP course"

#EAP Env
JBOSS_HOME=./target/jboss-eap-6.4
SERVER_DIR=$JBOSS_HOME/standalone/deployments/
SERVER_CONF=$JBOSS_HOME/standalone/configuration
SERVER_BIN=$JBOSS_HOME/bin
SRC_DIR=./installs
PRJ_DIR=./projects
SUPPORT_DIR=./support
EAP=jboss-eap-6.4.0-installer.jar
FUSE_EAP=fuse-eap-installer-6.2.1.redhat-039.jar

FUSE_VERSION=6.2.1
AUTHORS="Red Hat GPTE"
PROJECT="git@github.com/gpe-mw-training/fuse-eap.git"

# wipe screen.
clear

# add executeable in installs
chmod +x installs/*.zip

echo
echo "#################################################################"
echo "##                                                             ##"
echo "##  Setting up the ${LAB}                                     ##"
echo "##                                                             ##"
echo "##                                                             ##"
echo "##                #####  #   #  #####  #####                   ##"
echo "##                #      #   #  #      #                       ##"
echo "##                #####  #   #  #####  ####                    ##"
echo "##                #      #   #      #  #                       ##"
echo "##                #      #####  #####  #####                   ##"
echo "##                                                             ##"
echo "##                                                             ##"
echo "##  brought to you by,                                         ##"
echo "##                    ${AUTHORS}                               ##"
echo "##                                                             ##"
echo "##  ${PROJECT}                                                 ##"
echo "##                                                             ##"
echo "#################################################################"
echo

# double check for maven.
command -v mvn -q >/dev/null 2>&1 || { echo >&2 "Maven is required but not installed yet... aborting."; exit 1; }

#Copy standalon.xml with datasource to destination
echo Copy standalone.xml with datasource to destination
mv $SERVER_CONF/standalone.xml $SERVER_CONF/standalone.xml.demobackup
cp $SUPPORT_DIR/standalone.xml $SERVER_CONF/

#Setup
echo setup currency exchange database
if [ -x ~/h2 ]; then
	rm -rf ~/h2/fuseoneap.h2.db
else
	mkdir ~/h2
fi

cp $SUPPORT_DIR/data/fuseoneap.h2.db ~/h2/
