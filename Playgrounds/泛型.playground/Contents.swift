//: Playground - noun: a place where people can play

import UIKit

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return -1
}

let a = [1,2,3]
findIndex(of: 2, in: a)

let b = ["a","b","c"]
findIndex(of: "c", in: b)

/// 协议中的关联类型，可理解为协议中的泛型
/// 泛型的类型约束，使用where子句
//func allItemsMatch<C1: Container, C2: Container>
//    (_ someContainer: C1, _ anotherContainer: C2) -> Bool
//    where C1.item == C2.Item, C1.Item: Equatable {
//        return true
//}

/// 泛型思维：面向过程->面向对象(面向对象无法对类型进行抽象)->面向泛型(将类型进行抽象)
/// C++中的模板，Template
/// 泛型是面向算法的多态技术，允许一个值为不同的数据类型。
