#!/usr/bin/env tclsh

# tclsh8.6 [~/src/tcltk_exercises/ch3]binary scan "4123" cccc x1 x2 x3 x4
# 4
# tclsh8.6 [~/src/tcltk_exercises/ch3]format "dddd" x1 x2 x3 x4
# dddd
# tclsh8.6 [~/src/tcltk_exercises/ch3]format "%d%d%d%d" $x1 $x2 $x3 $x4
# 52495051
# tclsh8.6 [~/src/tcltk_exercises/ch3]format "%d%d%d%d" $x1 $x2 $x3 $x4
# 52495051
# tclsh8.6 [~/src/tcltk_exercises/ch3]binary format "cccc" $x1 $x2 $x3 $x4

proc pad {x} {
    # Pads data with null characters to ensure that it will
    # break into 4-character chunks.
    
    set L [string length $x]

    if {[expr $L % 4] == 0} {
        return $x
    }

    set pad_end [expr 3 - ($L % 4)]
    set pad [string range "\0\0\0\0" 0 $pad_end]
    set y "$x$pad"
    return $y
}

proc chunkize {x} {
    # Breaks data up into 4-character chunks. Input data
    # is padded with null character if necessary.

    set x [pad $x]

    for {set k 0} {$k < [string length $x]} {incr k 4} {
        lappend chunks [string range $x $k [expr $k + 3]]
    }

    return $chunks
}

proc unchunkize {x} {
    # Rejoins chunked data back into a string.
    return [join $x ""]
}


proc main {} {
    global argc argv
    if {$argc > 0} {
        set myString $argv
    } else {
        set myString [gets stdin]
    }

    puts $myString

    set chunks [chunkize $myString]
    puts $chunks

    for {set k 0} {$k < [llength $chunks]} {incr k} {
        puts [lindex $chunks $k]
        puts [string length [lindex $chunks $k]]
    }

    puts [unchunkize [chunkize $myString]]
exit 1
}

main
