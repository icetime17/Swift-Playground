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

