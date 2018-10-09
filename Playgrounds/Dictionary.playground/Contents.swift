//: Playground - noun: a place where people can play

import UIKit

// MARK - Dictionary
var dict = Dictionary<String, String>()
dict["fff"] = "abc"
dict["eee"] = "eee"
dict.updateValue("fff", forKey: "fff")
print(dict)
dict = ["a": "b", "c": "d", "e": "f"]
if let oldValue = dict.updateValue("g", forKey: "h") {
    print(oldValue)
}
dict
if let oldValue = dict.removeValue(forKey: "i") {
    print(oldValue)
} else {
    print("no value for key i")
}
for (key, value) in dict {
    print(key)
    print(value)
}
for (key, value) in dict.enumerated() {
    print(key)
    print(value)
}

Array(dict.keys)
[String](dict.keys)
Array(dict.values)
[String](dict.values)
for key in dict.keys {
    print(key)
}
for value in dict.values {
    print(value)
}

var dictColor = Dictionary<String, UIColor>()
dictColor["red"] = UIColor.red
dictColor

