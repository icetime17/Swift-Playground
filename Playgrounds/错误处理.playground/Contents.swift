//: Playground - noun: a place where people can play

import UIKit

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case noFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
    return "Job sent"
}

//do {
//    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
//    print(printerResponse)
//} catch {
//    print(error)
//}

//do {
//    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
//    print(printerResponse)
//} catch PrinterError.noFire {
//    print(error)
//} catch let printerError as PrinterError {
//    print(printerError)
//} catch {
//    print(error)
//}

let printerSuccess = try? send(job: 1040, toPrinter: "hello world")


typealias UsernameAndPassword = [String: String]

var users = UsernameAndPassword()
users = ["123":"123", "abc":"abc"]

enum LoginError: Error {
    case UserNotFound, UserPasswordNotMatch, UsernameEmpty
    
    var localizedDescription: String {
        return "\(self)"
    }
}


func login(user: String, password: String) throws {
    if user.isEmpty {
        throw LoginError.UsernameEmpty
    }

    if !users.keys.contains(user) {
        throw LoginError.UserNotFound
    }
    
    if users[user] != password {
        throw LoginError.UserPasswordNotMatch
    }
    
    print("Login successfully.")
}

do {
    try login(user: "123", password: "123")
} catch LoginError.UserNotFound {
    print("UserNotFound")
} catch LoginError.UserPasswordNotMatch {
    print("UserPasswordNotMatch")
} catch let err where err is LoginError {
    (err as? LoginError)?.localizedDescription
}


do {
    try login(user: "userNotFound", password: "passwd")
} catch LoginError.UserNotFound {
    print("UserNotFound")
} catch LoginError.UserPasswordNotMatch {
    print("UserPasswordNotMatch")
} catch let err where err is LoginError {
    (err as? LoginError)?.localizedDescription
}


do {
    try login(user: "abc", password: "123")
} catch LoginError.UserNotFound {
    print("UserNotFound")
} catch LoginError.UserPasswordNotMatch {
    print("UserPasswordNotMatch")
} catch let err where err is LoginError {
    (err as? LoginError)?.localizedDescription
}


struct Item {
    var price: Int
    var count: Int
}
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
