#!/usr/bin/env tclsh
#

source 300a.tcl
source 300b.tcl

proc lequal {x y} {
    # Checks to see whether two lists are equal to
    # each other. Returns 1 if true, 0 otherwise.
    
    if { [llength $x] != [llength $y] } {
        return 0
    }
    
    set L [llength $x]
    
    for {set k 0} {$k < $L} {incr k} {
        if { [lindex $x $k] != [lindex $y $k] } {
            return 0
        }
    }
    return 1
}

proc main {} {
    puts "Checking now."

    # Test stimulii are generated by taking
    # an initial number, splitting it into a
    # list of digits, and using the list as
    # a test vector to each sorting routine
    # (as well as lsort for a sanity check).
    
    for {set k 0} {$k < 10001} {incr k} {
        set L [split $k {}]

        set ans [lsort $L]
        set r1 [   myRecursive::sortem $L]
        set r2 [myNonRecursive::sortem $L]

        if {[lequal $ans $r1] == 0} {
            puts "Failed: \[$L\] (sortem A)"
            return
        }

        if {[lequal $ans $r2] == 0} {
            puts "Failed: \[$L\] (sortem B)"
            return
        }
    }
    puts "Passed."
}

main
