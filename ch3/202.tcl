#!/usr/bin/env tclsh

set Delimiter " "

while {[set string [gets stdin]] != ""} {
    lappend line_list $string
}

# Calculates the total number of rows in the table
set numRows [llength $line_list]

# Calculates the total number of columns in the table
set numCols 0
foreach line $line_list {
    set length [llength [split $line $Delimiter]]
    if {$length > $numCols} {
        set numCols $length
    }
}

# Generates a matrix of element lengths. Empty elements
# have length 0.

for {set r 0} {$r < $numRows} {incr r} {
    set length_list ""
    for {set c 0} {$c < $numCols} {incr c} {
        set element [lindex [lindex $line_list $r] $c]
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
        puts -nonewline [format " %-${width}s |" [lindex [lindex $line_list $r] $c]]
    }
    puts ""
}

for {set r 0} {$r < $borderLength} {incr r} {
    puts -nonewline "-"
}
puts ""
