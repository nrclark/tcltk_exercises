#!/usr/bin/env tclsh
#

namespace eval ::myRecursive:: {

    proc sortem {x {index 0} {swap 1}} {
        # Performs an in-place recursive bubble-sort
        # of list $x. Don't pass variables to $index or
        # $swap, or you might break the recursion.

        if { [expr $index + 1] == [llength $x] } {
            if {$swap == 0} {
                return $x
            }
            return [sortem $x 0 0]
        }

        if { [lindex $x $index] > [lindex $x [expr $index + 1]] } {
            set temp [lindex $x $index]
            lset x $index [lindex $x [expr $index + 1]]
            lset x [expr $index + 1] $temp
            return [sortem $x [expr $index + 1] 1]
        }
        
        return [sortem $x [expr $index + 1] $swap]
    }
}

#proc main {} {
#    puts [sortem {1 3 2 3 6 4 5 1}]
#}
#
#main
