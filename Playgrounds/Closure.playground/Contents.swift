//: Playground - noun: a place where people can play

import UIKit

// Closure
func closureFunc(index: Int, closure: (Int) -> Int) {
    print("index : \(index)")
    print("closure: \(closure(index))")
}

// 常规写法
closureFunc(index: 3, closure: { (index) -> Int in
    index * index
})

// 尾随闭包写法
closureFunc(index: 3) { (index) -> Int in
    index * index
}

closureFunc(index: 3) {
    $0 * 10
}

func anotherClosureFunc(closure: (Int) -> Int) {
    print("anotherClosureFunc")
}

// 常规写法
anotherClosureFunc(closure: { (index) -> Int in
    index * index
})

// 尾随闭包写法
anotherClosureFunc() { (index) -> Int in
    index * index
}

// 如果函数只需要闭包表达式一个参数，使用尾随闭包时，您甚至可以把()省略掉。
anotherClosureFunc { (index) -> Int in
    index * index
}

var myClosure = { (idx:Int) -> Int in
    return 1
}



func sayHello(to name: String) {
    print(name)
}
sayHello(to: "chris")


func closureFunc2(closure: () -> String) {
    closure()
}
closureFunc2 { () -> String in
    return "closureFunc2"
}


let peoples = [
    "a": 10,
    "b": 20,
    "c": 30,
]
let ret1 = peoples.map { (name, age) -> String in
    let ret = "\(name) : \(age + 1)"
    return ret
}
ret1
let ret1_1 = peoples.map {
    return "\($0) : \($1 + 1)"
}
ret1_1

let ret2 = peoples.map { (name, age) -> String in
    if age > 20 {
        return "\(name)"
    }
    return ""
}
ret2


let setBool: (Bool, String) -> Void = UserDefaults.standard.set
let getBool: (String) -> Bool = UserDefaults.standard.bool

setBool(true, "key1")
getBool("key1")

