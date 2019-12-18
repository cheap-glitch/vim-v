
/**
 * docs/sample.v
 *
 * NOTE:
 *   This is not a valid V sourcefile, but a sample of arbitrary
 *   code to test the syntax  hilighting and associated features
 */

// Operators
+
++
+=
-
--
-=
*
*=
/
/=
%
%=
>
>=
<
<=
<<
=
:=
in

// Basic types
bool byte byteptr rune string voidptr
int i8 u8 i16 u16 i32 u32 i64 u64
f32 f64

// Enums
enum Color {
	mauve
	viridian
	steel
}

// Structs
struct Point {
	x int
	y int
	z int
}
point := Point{
	x: 10
	y: 2
	z: -3
}

// Constants
// @TODO

// Strings
// @TODO

// Statements
// @TODO

// Labels
// @TODO

// Functions
// @TODO

// Modules
module mymodule

import os
import gg
import math

// Pre-proc
$if condition {
}
$if debug {
}
$if linux {
}
$else {
}

// Warning
// @TODO

/**
 * Multiline comment
 * TODO   todo mark
 * FIXME  fixme mark
 *
 * "Strings" should be 'ignored' in comments
 */
