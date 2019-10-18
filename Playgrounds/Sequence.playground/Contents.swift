//: Playground - noun: a place where people can play

import UIKit

/// Sequence协议需要一个Iterator
struct FibsSequence: Sequence {
    let number: Int
    init(_ number: Int) {
        self.number = number
    }
    typealias Iterator = FibsIterator
    func makeIterator() -> FibsSequence.Iterator {
        return FibsIterator(number)
    }
}

/// Iterator协议需要next()方法
struct FibsIterator: IteratorProtocol {
    let number: Int
    var index: Int = 0
    init(_ number: Int) {
        self.number = number
    }
    
    var state = (0, 1)
    
    typealias Element = Int
    mutating func next() -> Int? {
        if index >= number {
            return nil
        }
        index += 1
        
        let fibNumber = state.0
        state = (state.1, state.0 + state.1)
        return fibNumber
    }
}

let fibs = FibsSequence(10)
for f in fibs {
    print(f)
}
