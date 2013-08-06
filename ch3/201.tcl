#!/usr/bin/env tclsh
#
proc count {myString} {
    # Counts the frequency of word occurance
    # in its input string, and returns a dict
    # with entries of the form word => wordcount.
    #
    foreach x $myString {
        dict incr myDict $x
    }
    return $myDict
}

proc make_plot {myDict} {
    # Makes a horizontal histogram plot from 
    # a dict. The input dict must have all
    # entries in the form of string => integer.
    #
    set maxWidth 0
    dict for {word wordcount} $myDict {
        set x [string length $word]
        if {$x > $maxWidth} {
            set maxWidth $x
        }
    }
    incr maxWidth 1
    
    dict for {word wordcount} $myDict {
        puts -nonewline [format "%-${maxWidth}s" $word]
        puts -nonewline ":"
        for {set x 0} {$x < $wordcount} {incr x} {
            puts -nonewline "o"
        }
        puts ""
    }
}

proc main {} {
    # Main routine. Plots the histogram of
    # an input string which can be supplied on
    # the command line or entered interactively.
    #
    global argc argv
    if {$argc > 0} {
        make_plot [count $argv]
        exit 0
    } else {
        set myString [gets stdin]
        make_plot [count $myString]
        exit 0
    }
    exit 1
}

main
