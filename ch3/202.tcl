#!/usr/bin/env tclsh

set Delimiter ","

proc generateTable {lineList} {
    # Proc that prints a table to stdout from a list of lines that is
    # delimited by the 'Delimiter' global.

    global Delimiter
    set numRows [llength $lineList]

    # Calculates the total number of columns in the table
    # and splits up lines based on the input delimiter

    set numCols 0
    for {set r 0} {$r < $numRows} {incr r} {
        set line [lindex $lineList $r]
        set newRow [split [lindex $lineList $r] $Delimiter]
        lset lineList $r $newRow
        set length [llength $newRow]
        if {$length > $numCols} {
            set numCols $length
        }
    }

    # Generates a matrix of element lengths. Empty elements
    # have length 0.

    for {set r 0} {$r < $numRows} {incr r} {
        set length_list ""
        for {set c 0} {$c < $numCols} {incr c} {
            set element [lindex [lindex $lineList $r] $c]
            set length [string length $element]
            lappend length_list $length
        }
        lappend length_matrix $length_list
    }

    # Generates a list of the maximum widths of each column.

    for {set c 0} {$c < $numCols} {incr c} {
        set maxWidth 0
        for {set r 0} {$r < $numRows} {incr r} {
            set elementLength [lindex [lindex $length_matrix $r] $c]
            if {$elementLength > $maxWidth} {
                set maxWidth $elementLength
            }
        }
        lappend maxWidths $maxWidth
    }

    set borderLength [expr [join $maxWidths +]]
    incr borderLength [expr "$numCols+1 + (2*$numCols)"]

    for {set r 0} {$r < $borderLength} {incr r} {
        puts -nonewline "-"
    }
    puts ""

    for {set r 0} {$r < $numRows} {incr r} {
        puts -nonewline "|"
        for {set c 0} {$c < $numCols} {incr c} {
            set width [lindex $maxWidths $c]
            puts -nonewline [format " %-${width}s |" [lindex [lindex $lineList $r] $c]]
        }
        puts ""
    }

    for {set r 0} {$r < $borderLength} {incr r} {
        puts -nonewline "-"
    }
    puts ""
}

proc main {} {
    
    while {[set string [gets stdin]] != ""} {
        lappend inputLines $string
    }

    generateTable $inputLines
}

main

