/**
 * Operators
 * -----------------------------------------------------------------------------
 */

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

/**
 * Basic types
 * -----------------------------------------------------------------------------
 */

bool byte byteptr rune string voidptr
int i8 u8 i16 u16 i32 u32 i64 u64
f32 f64

/**
 * Enums
 * -----------------------------------------------------------------------------
 */

enum Color {
	mauve
	viridian
	steel
}

/**
 * Structs
 * -----------------------------------------------------------------------------
 */

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

/**
 * Constants
 * -----------------------------------------------------------------------------
 */

`a`
3.14
true
false
const (
	pi    = 3.14
	world = '世界'
)

/**
 * Strings
 * -----------------------------------------------------------------------------
 */

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

/**
 * Statements
 * -----------------------------------------------------------------------------
 */

mut bar    := map[string]int
mut foo123 := `?`

if baz >= foo("text") {
}
else if foobar {
}
else {
}

for nb in [1, 2, 3] {
	break
	continue
}

/**
 * Labels
 * -----------------------------------------------------------------------------
 */

mut numbers := {
	one: 1
	two: 2
}

match music {
	.rock    { println(rune(`🎸`))) }
	.metal   { println(`🤘`)        }
	.classic { println("🎻")        }
}

/**
 * Functions
 * -----------------------------------------------------------------------------
 */

fn nope() {}

pub fn hello() string {
	return 'hello $world'
}

fn (t Type) method(param int) {
}

pub fn (t Type) evil() int {
	return 666
}

foo()
nope()
method(12)

/**
 * Generics
 * -----------------------------------------------------------------------------
 */

struct Repo<T> {
	db DB
}

fn new_repo<T>(db DB) Repo<T> {
	return Repo<T>{db: db}
}

fn (r Repo<T>) find_by_id(id int) ?T {
	table_name := T.name
	return r.db.query_one<T>('select * from $table_name where id = ?', id)
}

/**
 * Inferfaces
 * -----------------------------------------------------------------------------
 */

struct Dog {}
struct Cat {}

fn (d Dog) speak() string {
    return 'woof'
}

fn (c Cat) speak() string {
    return 'meow'
}

interface Speaker {
    speak() string
}

/**
 * Sum types
 * -----------------------------------------------------------------------------
 */

type Expr = BinaryExpr | UnaryExpr | IfExpr

struct BinaryExpr{}
struct UnaryExpr{}
struct IfExpr{}

struct CallExpr {
	args []Expr
}

fn (p mut Parser) expr(precedence int) Expr {
	match p.tok {
		.key_if { return IfExpr{} }
		else    { return BinaryExpr{} }
	}
}

/**
 * Modules
 * -----------------------------------------------------------------------------
 */

module mymodule

import os
import gg
import math
import sld.ttf as ttf

/**
 * Special labels
 * -----------------------------------------------------------------------------
 */

[live]
fn print_message() {
}

[inline]
fn inline_func() {
}

/**
 * Pre-proc
 * -----------------------------------------------------------------------------
 */

$if condition {
}
$if debug {
}
$if linux {
}
$else {
}

/**
 * C-style pre-proc
 * -----------------------------------------------------------------------------
 */

#flag    -lsqlite3
#include <file.h>
#include "file.h"
#define  CONST
#ifdef   CONST
#ifndef  CONS
#endif

/**
 * Warnings
 * -----------------------------------------------------------------------------
 */

mut var := 'No semicolons at the end of statements!';
if true { mut var := 'No semicolons at the end of statements!'; }

if (true) {
	eprint('No parentheses around conditions!')
}

/**
 * Comments
 * -----------------------------------------------------------------------------
 */

// Single-line comment
// "Strings" should be 'ignored' in comments

/**
 * Multiline comment
 * TODO   todo mark
 * FIXME  fixme mark
 *
 * "Strings" should be 'ignored' in comments
 */
