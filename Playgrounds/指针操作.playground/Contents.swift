//: Playground - noun: a place where people can play

import UIKit

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
