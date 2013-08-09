#!/usr/bin/env tclsh
#

namespace eval ::myNonRecursive:: {
 
    proc sortem {x} {
        # Performs an in-place bubble sort using
        # loops instead of recursion.

        set N [llength $x]
        incr N -1

        set swap 1
        while {$swap} {
            set swap 0
            for {set k 0} {$k < $N} {incr k} {
                if {[lindex $x $k] > [lindex $x [expr $k+1]]} {
                    set temp [lindex $x $k]
                    lset x $k [lindex $x [expr $k + 1]]
                    lset x [expr $k + 1] $temp
                    set swap 1
                }
            }
        }
        return $x
    }

}
#i
#proc main {} {
#    puts [sortem {1 3 2 3 6 4 5 1}]
#}
#
#main
