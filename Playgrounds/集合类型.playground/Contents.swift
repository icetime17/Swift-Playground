//: Playground - noun: a place where people can play

import UIKit

/*
protocol IteratorProtocol {
    associatedtype Element
    
    mutating func next() -> Element?
}


struct Ones: IteratorProtocol {
    mutating func next() -> Int? {
        return 1
    }
}

var ones = Ones()
print(ones.next()!)
print(ones.next()!)
print(ones.next()!)
print(ones.next()!)
print(ones.next()!)


struct Fibonacci: IteratorProtocol {
    private var state = (0, 1)
    
    mutating func next() -> Int? {
        let nextNumber = state.0
        
        self.state = (state.1, state.0 + state.1)
        
        return nextNumber
    }
}

var fib = Fibonacci()
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
*/


// 这里的IteratorProtocol会对序列本身进行一定的修改。
// 如Fibonacci中的next方法会对其state进行修改。所以必须加mutating。
// 比如var fib_1 = fib则会复制一份新的，但其值不会是最初的，而是已经修改过后的fib。

// 所以，这里要约束IteratorProtocol，让它不要修改序列自身
// 引入SequenceProtocol

//protocol IteratorProtocol {
//    associatedtype Element
//    mutating func next() -> Element?
//}
//
//protocol SequenceProtocol {
//    associatedtype Element
//    associatedtype Iterator: IteratorProtocol where Iterator.Element == Element
//
//    func makeIterator() -> Iterator
//}


struct FibonacciIterator: IteratorProtocol {
    private var state = (0, 1)
    
    mutating func next() -> Int? {
        let nextNumber = state.0
        
        self.state = (state.1, state.0 + state.1)
        
        return nextNumber
    }
}

// swift自带Sequence协议。
//struct Fibonacci: SequenceProtocol {
struct Fibonacci: Sequence {
    typealias Element = Int
    
    func makeIterator() -> FibonacciIterator {
        return FibonacciIterator()
    }
}

var fib = Fibonacci().makeIterator()
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)
print(fib.next()!)


var fib_1 = fib
print(fib.next()!)
print(fib.next()!)

print(fib_1.next()!)
print(fib_1.next()!)
print(fib_1.next()!)
print(fib_1.next()!)
print(fib_1.next()!)
print(fib_1.next()!)
print(fib_1.next()!)
print(fib_1.next()!)

//for n in Fibonacci() {
//    if n <= 5 {
//        print(n)
//    }
//}


var fib_2 = AnyIterator(fib_1)
var fib_3 = fib_2
print(fib_2.next()!)
print(fib_2.next()!)
print(fib_3.next()!)
print(fib_3.next()!)
// 若要使用AnyIterator，则注释掉自己实现的IteratorProtocol和SequenceProtocol。
// 则fib_2和fib_3是共享遍历状态。
// SequenceProtocol，序列是序列，保存的是序列的值而已。
// IteratorProtocol，遍历操作是遍历操作，保存的是迭代的状态。



func sum(input: Int...) -> Int {
    return input.reduce(0, { (r, i) -> Int in
        r+i
    })
}

func price(input: Int..., unit: String) -> String {
    let sum = input.reduce(0, { (r, i) -> Int in
        r+i
    })
    return "\(sum) \(unit)"
}

let s = sum(input: 1,2,3)
print(s)
let p = price(input: 1,2,3, unit: "元")
print(p)



// MARK: - 集合中不能放置不同类型
// 通过这种方式，可以将不同类型的放到一起。
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


// MAKR: - 自己实现reduce
let array = [0,1,2,3,4]
let sum = array.reduce(array[0], +)

func reduce1<U, V>(of sequence: U, _ partial: (V, V) -> V) -> V? where U: Sequence, V == U.Element {
    var iter: U.Iterator = sequence.makeIterator()
    
    guard var accumulated = iter.next() else { return nil }
    
    while let element = iter.next() {
        accumulated = partial(accumulated, element)
    }
    return accumulated
}

let sum1 = reduce1(of: array, +)
let result2 = reduce1(of: array) { (a, b) -> Int in
    return a*a + b*b
}
print(sum1!)
print(result2!)
