//: Playground - noun: a place where people can play

import UIKit

// Switch
var httpStatus = (200, "OK")
switch httpStatus {
case (200, "OK"):
    print(httpStatus)
case (403, "Not Found"):
    print(httpStatus)
default:
    print("unknown status")
}

var twoNumber = (100, 200)
switch twoNumber {
case let (x, y) where x < y:
    print(twoNumber)
case let (x, y) where x > y:
    print(twoNumber)
default:
    print("unknown")
}

// MARK: - switch的特别用法
let str = "password"
switch str {
case "password":
    print("correct password")
default:
    print("incorrect password")
}

// Optional本身就是枚举
var num: Int?
num = 123
switch num {
case nil:
    print("nil 无值")
default:
    print("\(num!)")
}

// case中就是条件语句
let x = 0.5
switch x {
case -1.0...1.0:
    print("范围之内")
default:
    print("范围之外")
}
