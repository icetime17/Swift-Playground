//: Playground - noun: a place where people can play

import UIKit

// MARK - Class

class MyClass {
    var name = ""
    var nameOptional1: String?
    var nameOptional2: String!
    var age: Int?
    
    func myFunc() {
        print("myFunc")
    }
    
    static var className = "className"
    static func classFunc() {
        print(className)
        print("classFunc")
    }
    // 允许子类重写父类的方法实现
    class func classFunc2() {
        print(className)
        print("classFunc")
    }
}
MyClass.className
MyClass.classFunc()
MyClass.classFunc2()

var myClass = MyClass()
myClass.myFunc()
myClass.name = "name"
myClass.name.capitalized
myClass.nameOptional1 = "nameOptional1"
myClass.nameOptional1
myClass.nameOptional1?.capitalized

myClass.nameOptional2 = "nameOptional2"
myClass.nameOptional2
myClass.nameOptional2.capitalized


class MyClass1 {
    var name = "MyClass1"
    
    fileprivate var fileprivateName = "fileprivateName"
    private var privateName = "privateName"
    
}
var myClass1 = MyClass1()
myClass1.name
myClass1.fileprivateName
//myClass1.privateName

class MyClassCollection {
    var classes = Array<String>()
    subscript(index: Int) -> String {
        get {
            return classes[index]
        }
        set {
            if index < classes.count {
                classes[index] = newValue
            } else {
                classes.append(newValue)
            }
        }
    }
}

var myClass3 = MyClassCollection()
myClass3.classes = ["a", "b", "c"]
myClass3.classes
myClass3.classes[0]
myClass3.classes[0] = "A"
//myClass3.classes[3] = "d"
//myClass3.classes
// 通过subscript来指定下标
myClass3[0]
myClass3[2]


class Bank {
    static var coinsInBank = 10000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var player: Player? = Player(coins: 100)
Bank.coinsInBank
player!.coinsInPurse
player!.win(coins: 100)
Bank.coinsInBank
player!.coinsInPurse
player = nil
Bank.coinsInBank


class MovieItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MovieItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
    var description: String {
        return "Movie description: \(name), \(director)"
    }
}
class Song: MovieItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("movieCount : \(movieCount)")
print("songCount : \(songCount)")
for item in library {
    if let movie = item as? Movie {
        print(movie.description)
        print("Movie: \(movie.name), \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), \(song.artist)")
    }
}


var anys = [Any]()
anys.append(0)
anys.append(0.0)
anys.append(10)
anys.append(3.1415926)
anys.append("hello")
anys.append((200, "success"))
anys.append(Movie(name: "movie", director: "director"))
anys.append({ (name: String) -> String in "Hello, \(name)" })

for thing in anys {
    switch thing {
    case let function as (String) -> String:
        print(function("Chris"))
    default:
        print("others")
    }
}

let item: MovieItem = Movie(name: "Casablanca", director: "Michael Curtiz")
print(item)
type(of: item)
MovieItem.self
