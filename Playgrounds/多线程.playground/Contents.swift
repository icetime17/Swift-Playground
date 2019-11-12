//: Playground - noun: a place where people can play

import UIKit

import PlaygroundSupport
/// 默认会在代码运行最后一句30s后停止
PlaygroundPage.current.needsIndefiniteExecution = true

var seconds = 10
let gcdTimer: DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
gcdTimer.schedule(deadline: .now(), repeating: 1.0)
gcdTimer.setEventHandler {
    seconds -= 1
    if seconds < 0 {
        gcdTimer.cancel()
    } else {
        print(seconds)
    }
}
gcdTimer.resume()

print(gcdTimer)

/// Array是值类型，写时赋值，即若对其进行修改的时候会copy一份出来。
/// 但对同一个Array修改则不是线程安全的？原因在于？
let queue = DispatchQueue.global()
var animals = ["dog", "cat", "pig"]
if (false) {
//    let queryAnimals = animals
//    queue.async {
//        let count = queryAnimals.count
//        for i in 0..<count {
//            print(queryAnimals[i])
//            Thread.sleep(forTimeInterval: 1)
//        }
//    }
//    queue.async {
//        Thread.sleep(forTimeInterval: 0.5)
//        animals.remove(at: 0)
//    }
    
    /// crash
    queue.async {
        let count = animals.count
        for i in 0..<count {
            print(animals[i])
            Thread.sleep(forTimeInterval: 1)
        }
    }
    queue.async {
        Thread.sleep(forTimeInterval: 0.5)
        animals.remove(at: 0)
    }
} else {
/// 此时会crash，数组越界！！！因此值类型的Array在多线程读写的情况下并非线程安全。
/// 如下方式则是线程安全的，因为新开的线程中，animals是一份新的copy，因Array是值类型。
    queue.async { [animals] in
        // 此时的animals是copy出来的一份。
        let count = animals.count
        for i in 0..<count {
            print(animals[i])
            Thread.sleep(forTimeInterval: 1)
        }
    }
    queue.async {
        Thread.sleep(forTimeInterval: 0.5)
        animals.remove(at: 0)
    }
}
animals
