#!/usr/bin/env tclsh

package provide myLib 1.0

namespace eval ::myLib {
    # Export commands
    namespace export basic_adder
}

proc ::myLib::basic_adder {x} {
    return [expr $x + 10]
}
