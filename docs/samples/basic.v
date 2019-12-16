
/**
 * vim-v/samples/factorial.v
 *
 * @TODO: this is a todo item
 */

module factorial

pub fun factorial(n int) {
	mut f := 0

	$if debug {
		println('Argument is: $n')
	}

	for i:=1; i<=n; i++ {
		f *= i;
	}

	return f
}
