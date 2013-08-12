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

proc encode {} {
    # Command routine that encodes data and
    # displays it.
    global argc argv
    if {$argc > 1} {
        set myString [join [lrange $argv 1 end]]
    } else {
        set myString [read stdin]
    }

    set chunks [chunkize $myString]

    for {set k 0} {$k < [llength $chunks]} {incr k} {
        binary scan [lindex $chunks $k] I x
        puts $x
    }
}

proc decode {} {
    # Command routine that decodes data and displays
    # it.
    #
    global argc argv
    if {$argc > 1} {
        set myChunks [lrange $argv 1 end]
    } else {
        set x [read stdin]
        set myChunks [split $x]
    }

    for {set k 0} {$k < [llength $myChunks]} {incr k} {
        set hexVal [join [lindex $myChunks $k]]
        if {$hexVal != ""} {
            puts -nonewline [binary format I $hexVal] 
        }
    }
    puts ""
}

proc main {} {
    global argc argv
    if {[lindex $argv 0] == "encode"} {
        encode
    } else {
        decode
    }
}

main
