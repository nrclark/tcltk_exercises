#!/bin/sh
#\
SCRIPT=$(readlink -f $0) #\
SCRIPTPATH=`dirname $SCRIPT` #\
exec "$SCRIPTPATH/./tclsh" "$0" ${1+"$@"}
puts "This is a test"
puts "This is a test"
puts "This is a test"
puts "This is a test"
