//: Playground - noun: a place where people can play

import UIKit

// MARK - Func
func funcName1(index: Int) -> String {
    print(index)
    return "number : \(index)"
}
funcName1(index: 11)
funcName1(index: 22)


func funcName2(name: String) -> String {
    func addAge(age: Int) -> Int {
        return age + 2
    }
    
    func addCity(city: String) -> String {
        return "\(city) City"
    }
    
    var age = 0
    var city = ""
    
    if name == "My Name" {
        age = 18
        city = "XM"
    } else {
        age = 19
        city = "SH"
    }
    
    return "Name: \(name). Age: \(addAge(age: age)). City: \(addCity(city: city)))"
}
funcName2(name: "My Name")
funcName2(name: "My Name 2")


// inout
func increaseInt(index: inout Int) -> Int {
    index += 1
    return index
}
var i = 1
increaseInt(index: &i)
i

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    
    var curMin = array[0]
    var curMax = array[0]
    for value in array {
        if value < curMin {
            curMin = value
        } else if value > curMax {
            curMax = value
        }
    }
    return (curMin, curMax)
}
if let min_max = minMax(array: [1,3,5,7,9]) {
    print(min_max)
    print(min_max.min)
    print(min_max.max)
}

func chooseStepFunc(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var value = 10
let movToZero = chooseStepFunc(backward: value > 0)
while value != 0 {
    value = movToZero(value)
    print(value)
}
print(value)



