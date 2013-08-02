#!/usr/bin/env tclsh

set procList [info procs]
puts "-----------Process List-------------"
puts ""
puts $procList
puts ""
foreach myProc $procList {
    puts "Proc: $myProc"
    puts "Args: [info args $myProc]"
    puts ""
}
