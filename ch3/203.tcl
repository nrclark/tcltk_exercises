#!/usr/bin/env tclsh

proc checkPalindrome {input} {
    puts $input
    set input [regsub -all {[^a-zA-Z]} $input ""]
    set reverse [string reverse $input]

    if {[string compare -nocase $input $reverse]} {
        return 0
    }
    return 1
}

proc main {} {
    gets stdin myInput
    puts [checkPalindrome $myInput]
}

main
