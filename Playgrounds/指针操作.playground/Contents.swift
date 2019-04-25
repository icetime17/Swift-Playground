//: Playground - noun: a place where people can play

import UIKit


// MARK: - UnsafePointer
// 接收参数：一个指针
func memory_int(ptr: UnsafePointer<CInt>) {
    // 获取指针指向的内容
    print(ptr.pointee)
}
var c: CInt = 123
// 传递一个指针，指向c
memory_int(ptr: &c)


class MyClass {
    var a = 1
    deinit {
        print("deinit")
    }
}

// 声明一个指针对象ptr
var ptr: UnsafeMutablePointer<MyClass>!
// 分配一块内存地址，大小为MyClass需要的
ptr = UnsafeMutablePointer<MyClass>.allocate(capacity: 1)
// 初始化该指针指向的内存地址
ptr.initialize(to: MyClass())
ptr.pointee.a

//ptr = nil
// 仅将ptr置为nil，不能正确释放ptr所指向的内容，MyClass的deinit不会调用
// 原因在于UnsafeMutablePointer不会自动进行内存管理，所以ptr指向的内容是不会自动释放和回收的。
// 需要手动进行。
// 所以，对于非ARC的对象，内存管理都是成对出现的。allocate/deallocate, initialize/deinitialize。缺一不可。
// 先释放ptr指向的内容
ptr.deinitialize(count: 1)
// 再释放ptr自身
ptr.deallocate()
ptr = nil


// MARK: - MemoryLayout
struct Point {
    var x: Float
    var y: Float
    var z: Float
}
// Float占了4个byte
let p = Point(x: 1, y: 1, z: 1)

// 实际占用的内存size
MemoryLayout<Point>.size
MemoryLayout<Point>.size(ofValue: p)
// 因为内存对齐，每个元素实际消耗的内存空间为stride。
// 内存对齐导致浪费的空间即为stride - size
MemoryLayout<Point>.stride
MemoryLayout<Point>.stride(ofValue: p)
// 内存对齐方式
MemoryLayout<Point>.alignment
MemoryLayout<Point>.alignment(ofValue: p)

MemoryLayout<Point>.offset(of: \Point.x) // 内存偏移量为0
MemoryLayout<Point>.offset(of: \Point.y) // 内存偏移量为4个byte
MemoryLayout<Point>.offset(of: \Point.z) // 内存偏移量为8个byte

// unsafePointer
/*
UnsafePointer<T> 等同于 const T *
UnsafeMutablePointer<T> 等同于 T *
UnsafeRawPointer 等同于 const void *
UnsafeMutableRawPointer 等同于 void *
*/

