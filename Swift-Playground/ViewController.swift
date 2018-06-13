//
//  ViewController.swift
//  Swift-Playground
//
//  Created by Chris Hu on 17/2/28.
//  Copyright © 2017年 com.icetime17. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var array1: Array<Int> = [1,2,3,4,5]
        var array2: Array<Int> = array1
        print("copy")
        print(NSString(format: "%p", array1))
        print(NSString(format: "%p", array2))
        array1.append(6)
        array2.append(6)
        print("write")
        print(NSString(format: "%p", array1))
        print(NSString(format: "%p", array2))
        print("done")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomPointInRectangle(rectangle:CGRect) -> CGPoint {
        // return CGPoint(x: randomInt(rectangle.size.width), y: randomInt(rectangle.size.height))
        return CGPoint(x: 10, y: 10)
        
        // compiler error is now:
        // Cannot invoke 'init' with an argument list of type '(x: IntegerLiteralConvertible, y: IntegerLiteralConvertible)'
    }
        
}

