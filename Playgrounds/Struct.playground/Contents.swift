//: Playground - noun: a place where people can play

import UIKit

// Struct
struct MyStruct {
    var name = "name"

    static var structName = "struct name"

    func myFunc() {
        print(name)
        print("myFunc")
    }

    // 值类型的属性默认不能在其实例方法中修改。
    mutating func changeName(name: String) {
        self.name = name
    }

    static func structFunc() {
        print("structFunc")
    }
}
MyStruct.structName
MyStruct.structFunc()

var mystruct = MyStruct()
mystruct.name
mystruct.myFunc()
mystruct.changeName(name: "newName")
mystruct.myFunc()

let constStruct = MyStruct(name: "Const Struct")
// 不能对值类型的常量调用可变方法，因值类型的常量实例的属性不能被修改
// constStruct.name = "newName"




struct PersonStruct {
    let name: String
    let age: Int
    var city: String
}
// struct如果没有自定义init，则只有一个默认的成员初始化器(将所有属性全部初始化)。一旦有自定义的，默认的就不能用了。
// 而class默认的初始化器仅仅是init(),属性是声明的时候即指定的初始值。
PersonStruct(name: "name", age: 18, city: "city")



class PersonClass {
    var name: String = ""
    var age: Int = 0
    init(name: String) {
        self.name = name
    }
    init(age: Int) {
        self.age = age
    }
}
PersonClass(name: "cc")
PersonClass(age: 18)



struct Question {
    var number = 0
    let view: UIView?
    init(view: UIView?) {
        self.view = view
    }
}
let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
let view = UIView(frame: frame)
var aQuestion = Question(view: view)
var bQuestion = aQuestion
print(aQuestion)
print(bQuestion)
bQuestion.number = 100
bQuestion.view?.frame.origin.y = 200
bQuestion.view?.frame.size.height = 200
print(aQuestion)
print(bQuestion)



struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }

    func isIndexValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

    // 使用下标做一些自定义的操作
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(isIndexValid(row: row, column: column), "Index out of range")
            return grid[row * columns + column]
        }
        set {
            assert(isIndexValid(row: row, column: column), "Index out of range")
            grid[row * columns + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1
matrix[1, 1] = 2
matrix[1, 1]
// matrix[2, 2]


struct NetworkError {
    let notFound = "Not Found"
    let success = "Success"

    // 使用下标做一些自定义的操作
    subscript(code: Int) -> (Int, String) {
        get {
            var desc = ""
            switch code {
            case 200:
                desc = success
            case 404:
                desc = notFound
            default:
                desc = "Unkonwn"
            }
            return (code, desc)
        }
    }
}
var httpResponse = NetworkError()
httpResponse[200]
httpResponse[404]


// Matrix使用subscript比较合适
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func isIndexValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(isIndexValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(isIndexValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 3)
matrix[0, 0]
matrix[1, 1] = 1.0
matrix[1, 1]
matrix[1, 2] = 2.0
matrix[1, 2]

