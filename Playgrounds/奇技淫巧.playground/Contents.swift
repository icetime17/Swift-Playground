//: Playground - noun: a place where people can play

import UIKit

import PlaygroundSupport


/// 使得Playground具备延时运行
let url = URL(string: "https://www.bing.com")
let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    print(data)
    print(response)
    print(error)
}.resume()
/// 默认会在代码运行最后一句30s后停止
PlaygroundPage.current.needsIndefiniteExecution = true


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
