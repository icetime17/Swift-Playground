//: Playground - noun: a place where people can play

import UIKit

/// 使得Playground具备延时运行等作用
import PlaygroundSupport
/// 默认会在代码运行最后一句30s后停止
PlaygroundPage.current.needsIndefiniteExecution = true


// 10个打印顺序未知
for i in 0..<10 {
    Thread.detachNewThread {
        print(i)
    }
}

class ObjectThread {
    func threadTest() {
        let thread = Thread(target:self, selector: #selector(threadWorker), object: nil)
        thread.start()
    }
    @objc func threadWorker() {
        print("threadWorker")
    }
}
let obj = ObjectThread()
obj.threadTest()


DispatchQueue.global().async {
    print("DispatchQueue.global.async")
}



let url = URL(string: "https://www.bing.com")
let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    print(data)
    print(response)
    print(error)
}.resume()


/// UI界面
class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "UITableViewCell \(indexPath)"
        return cell
    }
}

PlaygroundPage.current.liveView = ViewController().view
