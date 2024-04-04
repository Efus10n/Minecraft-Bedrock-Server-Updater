#!/bin/bash

MCDIR=/home/rjohn/minecraft_bedrock

rm -r $MCDIR/backup
echo backup erased

mv $MCDIR/current $MCDIR/backup
echo created new backup

mkdir $MCDIR/current
unzip $MCDIR/updater/bedrock-server* -d $MCDIR/current > /dev/null
rm $MCDIR/updater/bedrock-server*
echo new server unzipped

cp -r $MCDIR/backup/worlds/ $MCDIR/current
echo world migrated

cp $MCDIR/backup/allowlist.json $MCDIR/current
cp $MCDIR/backup/server.properties $MCDIR/current
echo server setting migrated
