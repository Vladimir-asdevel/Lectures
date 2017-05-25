//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func changeSign(operand: Double) -> Double {
    return -operand
}

let i = 27

var f: (Double) -> Double

f = cos
let `defer` = f(Double.pi)
let defer2 = `defer` + 5

print(`defer`, defer2)
debugPrint(`defer`, defer2)

f = changeSign
let x = f(81)

let decimalInt     = 17
let octalInt       = 0o21
let binaryInt      = 0b10001
let hexadecimalInt = 0x11

1.25e2
1.25e-2

0xFp2
0xFp-2

let decimalDouble     = 12.1875
let exponentDouble    = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion   = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
let badTwoMillions = 200_0000

/// Ну что ж, попробуем сравнить кортежи с булевыми значениями 😎
/// Cначала нормальные сравниваемые кортежи
(1, "zebra") < (2, "apple")
(3, "apple") < (4, "bird")
(4, "dog") == (4, "dog")
/// А теперь кортежи с булевыми значениями
(true, 1) == (false, 1)
(true, 2) == (true, 2)
(false, 3) == (false, 3)
(false, 4) == (false, 5)
(true, 6) == (true, 7)

//(true, 1) <= (false, 1)
//(true, 2) >= (true, 2)
//(false, 3) < (false, 3)
(false, 4) != (false, 5)
//(true, 6) > (true, 7)




