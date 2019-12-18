
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
const (
	pi    = 3.14
	world = '世界'
)

// Strings
'simple string'
"simple string"
r'raw string'
r"raw string"
'mutli
 line
 strings'
"mutli
 line
 strings"
'double quotes should be ignored here: """"'
"simple quotes should be ignored here: ''''"
'escape sequences: \n \r \t \' \$ \\'
"escape sequences: \n \r \t \" \$ \\"
'tricky escape sequence #1: \\'
"tricky escape sequence #1: \\"
'tricky escape sequence #2: \\\''
"tricky escape sequence #2: \\\""
'simple interpolation: $var'
"simple interpolation: $var"
'escaped interpolation: \$var'
"escaped interpolation: \$var"
'complex interpolation #1: ${var}'
"complex interpolation #1: ${var}"
'complex interpolation #2: ${foo() > 2}'
"complex interpolation #2: ${foo() > 2}"
'complex interpolation #3: ${if time == true { time.now() } else { "time is an illusion!" }}'
"complex interpolation #3: ${if time == true { time.now() } else { "time is an illusion!" }}"

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
