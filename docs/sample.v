
/**
 * vim-v/docs/sample.vim
 */

module main

import time
import automaton

// @TODO: add system info
$if debug { println("program started at: ${time.now()}") }

/**
 * Print a grid representing
 * the current state of the automaton
 */
pub fn print_automaton(a &automaton.Automaton) {
	for y := 1; y<a.field.maxy; y++ {
		mut s := '    '
		for x := 1; x<a.field.maxx; x++ {
			cell := a.field.get(x,y)
			s += if cell == 1 { '@' } else { '.' }
		}
		println(s)
	}
	println('')
}

fn main() {
	mut a := automaton.gun()
	for {
		a.update()
		print_automaton(a)
		time.sleep_ms(100)
	}
}

/**
 * Return the factorial of a number
 */
pub fn factorial(n int) {
	mut f := 0

	$if debug {
		println('Argument is: $n')
	}

	if n = 0 {
		return 0
	}

	// @TODO: this is a todo item
	for i:=1; i<=n; i++ {
		f *= i
	}

	return f
}
