#!/usr/bin/env tclsh

set if [open tstStruct r]
set d [read $if]
close $if

binary scan $d "i f2 a*" i f s

set 0pos [string first [binary format c 0x00] $s]
incr 0pos -1
set s [string range $s 0 $0pos]

puts $i
puts $f
puts $s

