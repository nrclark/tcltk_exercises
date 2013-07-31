#!/usr/bin/env tclsh
#
set a 1
puts "$a"

set a 1
puts {$a}

set a 1
puts [expr $a + 1]

set a b
set $a 2
puts "$b"

set a 1
puts "\$$a"
