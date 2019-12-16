
/**
 * vim-v/docs/sample.v
 */

module factorial
import math

// factorial returns the factorial of a number
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
