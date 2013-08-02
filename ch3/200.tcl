#!/usr/bin/env tclsh

proc fib {num} {
    if {$num <= 2} {
        return 1
    }
    return [expr [fib [expr $num - 1]] + [fib [expr $num - 2]]]
}

for {set i 1} {$i < 6} {incr i} {
    puts "number $i is [ fib $i ]"
}
