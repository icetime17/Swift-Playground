//: Playground - noun: a place where people can play

import UIKit

// Enum
enum EnumName {
    case EA
    case EB
    case EC

    static var name = "name"

    static func enumFunc() {
        print("static enum func")
    }
}
EnumName.name
EnumName.enumFunc()

var enumName = EnumName.EA
enumName = .EC
switch enumName {
case .EA:
    print(enumName)
case .EB:
    print(enumName)
case .EC:
    print(enumName)
}



enum NetworkResponseResult {
    case status(Int, String)
    case error(Error)
}

var code200 = NetworkResponseResult.status(200, "ok")
var code404 = NetworkResponseResult.status(404, "Not Found")
print(code200)
print(code404)

switch code200 {
case let .status(code, desc):
    print(code, desc)
case let .error(error):
    print(error)
}

if case let NetworkResponseResult.status(code, status) = code200 {
    print(code, status)
}

if case let NetworkResponseResult.status(code, status) = code404 {
    print(code, status)
    // return
}

if case let NetworkResponseResult.error(error) = code404 {
    print(error)
    // return
} else {
    print("go on")
}
// if case let可用在不同枚举关联值的场景。
// 如果不用 if case let，就只能使用switch了。


// MARK: - 通过这种方式，可以将不同类型的放到一起。
enum IntOrStringOrBool {
    case IntValue(Int)
    case StringValue(String)
    case BoolValue(Bool)
}

let mixed = [IntOrStringOrBool.IntValue(1),
             IntOrStringOrBool.StringValue("str"),
             IntOrStringOrBool.BoolValue(true)]
print(mixed)
mixed.forEach { (v) in
    switch v {
    case let .IntValue(i):
        print("\(i) 元")
    case let .StringValue(s):
        print(s.capitalized)
    case let .BoolValue(b):
        print(b)
    }
}

if case let IntOrStringOrBool.IntValue(Int) = mixed[0] {
    print("IntValue")
}
if case let IntOrStringOrBool.StringValue(String) = mixed[1] {
    print("StringValue")
}
if case let IntOrStringOrBool.BoolValue(boolValue) = mixed[2] {
    print("BoolValue")
}


// 递归枚举
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
evaluate(product)


// 枚举的mutating，可用于类似拍摄比例，触屏拍摄，点击切换的场景
enum RatioType {
    case r1v1, r3v4, r9v16, full
    mutating func next() {
        switch self {
        case .r1v1:
            self = .r3v4
        case .r3v4:
            self = .r9v16
        case .r9v16:
            self = .full
        case .full:
            self = .r1v1
        }
    }
    
    var strValue: String {
        switch self {
        case .r1v1:
            return "1V1"
        case .r3v4:
            return "3V4"
        case .r9v16:
            return "9V16"
        case .full:
            return "FULL"
        }
    }
    
    var imgName: String {
        switch self {
        case .r1v1:
            return "1V1"
        case .r3v4:
            return "3V4"
        case .r9v16:
            return "9V16"
        case .full:
            return "FULL"
        }
    }
}
var curRatioType = RatioType.r1v1
curRatioType.next()
curRatioType.next()
curRatioType.next()
curRatioType.next()
curRatioType.strValue
curRatioType.imgName
