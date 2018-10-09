//: Playground - noun: a place where people can play

import UIKit

// MARK - Tuple

var tp = ("a", "1")

func returnTp() -> (String, Int, String) {
    return ("name", 18, "city")
}
var t = returnTp()
t.0
t.1
t.2

var tp1 = (code: "a", desc: "1")
tp1.0
tp1.1
tp1.code
tp1.desc
