//: Playground - noun: a place where people can play

import UIKit


"B" > "A"
"A" > "B"


// MARK - Other
var btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
btn.setTitle("Button", for: .normal)
btn.setTitleColor(UIColor.red, for: .normal)
btn.layer.borderColor = UIColor.blue.cgColor
btn.layer.borderWidth = 2.0
btn.layer.cornerRadius = 10.0
btn
print(btn is UIButton)
print(btn is UILabel)


UIColor.red
URL(string: "https://www.dianping.com")
if let url = URL(string: "https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=4201714548,3253979110&fm=80") {
    do {
        let data = try Data(contentsOf: url)
        if let image = UIImage(data: data) {
            print(image.size)
        }
    } catch {
        print(error)
    }
}

// 标签
var total = 0
outsideLoop: for i in 0..<20 {
    insideLoop: for j in 0..<20 {
        total += i + j
        if total > 3 {
            break outsideLoop
        }
    }
}


// typealias
typealias MyString = String
let str: MyString = "str"


typealias User = (name: String, age: Int)

func sayUser(_ user: User) {
    print("username : \(user.name)")
    print("age : \(user.age)")
}
let user: User = (name: "my name", age: 18)
sayUser(user)



NotificationCenter.default.addObserver(forName: Notification.Name("MyNotificationName"), object: nil, queue: nil) { (_) in
    
}

/// 对NSNotification.name 进行extension
extension Notification.Name {
    static var MyNotificationName: Notification.Name {
        return Notification.Name("MyNotificationName")
    }
}

NotificationCenter.default.addObserver(forName: .MyNotificationName, object: nil, queue: nil) { _ in
}



let a = "Hello"
switch a {
case "hello", "Hello":
    print("world")
default:
    print("others")
}

let point = (0, 2)
switch point {
// 值的匹配
case let (x, y) where x == y:
    print("equal line")
case (let x, 0):
    print("\(x), 0")
case (0, let y):
    print("0, \(y)")
    // 贯穿
    fallthrough
default:
    print("invalid")
}


//if #available(iOS 10, *) {
//    print("iOS 10")
//} else {
//    print("other platforms")
//}

// for meter
extension Double {
    var km: Double { return self / 1_000.0 }
    var cm: Double { return self * 100.0}
    var mm: Double { return self * 1_000.0}
}
print(2000.0.km)
print(2.0.cm)
print(2.0.mm)

// subscript
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return self / decimalBase % 10
    }
}
1234567890[0]
1234567890[1]
1234567890[2]
1234567890[8]

class ClassA {}
class ClassB: ClassA {}

let objA: AnyObject = ClassA()
let objB: AnyObject = ClassB()
if objA is ClassA {
    print("objA is ClassA")
}
if objA is ClassB {
    print("objA is ClassB")
}
if objB is ClassA {
    print("objB is ClassA")
}
if objB is ClassB {
    print("objB is ClassB")
}
// 而OC中
// isKindOfClass判断是否是类或其子类的实例对象，Kind。
// isMemberOfClass严格判断是否是类的实例对象，Member。




//@propertyWrapper
//struct UserDefault<T> {
//
//}
