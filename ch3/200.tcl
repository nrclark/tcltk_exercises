#!/usr/bin/env tclsh

proc fib {num} {
    if {$num <= 2} {
        return 1
    }
    return [expr [fib [expr $num - 1]] + [fib [expr $num - 2]]]
}

proc fib_numbers {num} {
    for {set i 1} {$i <= $num} {incr i} {
        lappend answer [fib $i]
    }
    return $answer
}

puts "How many Fibonacci numbers would you like?"
set x [gets stdin]

puts "They are:"
puts [fib_numbers $x]
