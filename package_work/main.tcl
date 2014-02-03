#!/usr/bin/env tclsh

lappend auto_path .
package require myLib 1.0


set y 12
puts [::myLib::basic_adder $y]
