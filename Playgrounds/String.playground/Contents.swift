//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
for i in 0..<str.count-1 {
    let index = str.index(str.startIndex, offsetBy: i)
    print(str[index])
}


str.count
str.insert(contentsOf: "!", at: str.endIndex)
str.count
str.insert(contentsOf: "...", at: str.index(before: str.endIndex))
str[str.startIndex]
//str[str.endIndex]
str.startIndex.encodedOffset
str.endIndex.encodedOffset
str[str.index(before: str.endIndex)]
str[str.index(after: str.startIndex)]
str[str.index(str.startIndex, offsetBy: 5)]

for index in str.indices {
    print(str[index], terminator: " ")
}

print("\nfor-in")
for char in str {
    print(char, terminator: "_")
}


var optionalStr: String? = "Hello"
if let str = optionalStr {
    print(str)
}

var arr = str.components(separatedBy: "Hello")
print(arr.count)
arr[0]
arr[1]


str = "0de5fc94d0ba53fc7a44f0f136e82fbb/6FA6D213-6FD3-460C-A403-885C536DADD0"
str.replacingOccurrences(of: "0de5fc94d0ba53fc7a44f0f136e82fbb/", with: "")


arr = str.components(separatedBy: "0de5fc94d0ba53fc7a44f0f136e82fbb/")
arr[1]

str
var index = str.index(str.startIndex, offsetBy: "Hello".count)
print(index)
print(index.encodedOffset)
str[..<index]
// Just use range to slice String.
// str.substring(to: index)

let s = "Swift"
let i = s.index(s.startIndex, offsetBy: 4)
print(s[i]) // Prints "t\n"

let strlength: Int = str.count - 10

index = str.index(str.startIndex, offsetBy: strlength)
str[..<index]
// str.substring(to: index)
str[index...]
// str.substring(from: index)

let start = str.index(str.startIndex, offsetBy: 5)
let end = str.index(str.endIndex, offsetBy: 0)
let range = start..<end

//str.substring(with: range)
str[range]

//str.range(of: "Hello")
//
//str.index(str.startIndex, offsetBy: 2)



// MARK - String
str = "Hello, playground"
str += " how are you"
print(str)
print("\(str) how are you again")

let age = 20
String(age) + "岁"
"\(age)岁"
"明年：\(age + 1)岁"

str
for index in str {
    print(index)
}





let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MMM dd yyyy HH:mm"
let d = dateFormatter.string(from: Date())



extension String {
    func substring(from: Int?, to: Int?) -> String {
        if let start = from {
            guard start < self.count else {
                return ""
            }
        }
        
        if let end = to {
            guard end >= 0 else {
                return ""
            }
        }
        
        if let start = from, let end = to {
            guard end - start >= 0 else {
                return ""
            }
        }
        
        let startIndex: String.Index
        if let start = from, start >= 0 {
            startIndex = self.index(self.startIndex, offsetBy: start)
        } else {
            startIndex = self.startIndex
        }
        
        let endIndex: String.Index
        if let end = to, end >= 0, end < self.count {
            endIndex = self.index(self.startIndex, offsetBy: end + 1)
        } else {
            endIndex = self.endIndex
        }
        
        return String(self[startIndex ..< endIndex])
    }
    
    func substring(from: Int) -> String {
        return self.substring(from: from, to: nil)
    }
    
    func substring(to: Int) -> String {
        return self.substring(from: nil, to: to)
    }
    
    func substring(from: Int?, length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        
        let end: Int
        if let start = from, start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
        
        return self.substring(from: from, to: end)
    }
    
    func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0, length > 0 else {
            return ""
        }
        
        let start: Int
        if let end = to, end - length > 0 {
            start = end - length + 1
        } else {
            start = 0
        }
        
        return self.substring(from: start, to: to)
    }
}


// 说明...操作符不仅可以作用于Int，Double，也可以作用于Comparable，如String
let test = "Hello,Playground"
let interval = "a"..."z"
for c in test {
    if !interval.contains(String(c)) {
        print("非小写字母 \(c)")
    }
}

let line = "[01:50.87]夕阳在炙热中滑落"
if let idxOfFirstRightBracket = line.firstIndex(of: "]") {
    let beginIdx = line.startIndex
    let endIdx = idxOfFirstRightBracket
    let beginTimeString = line[beginIdx ... endIdx]
    
    let lyric = line[line.index(after: endIdx) ..< line.endIndex]
    
}
