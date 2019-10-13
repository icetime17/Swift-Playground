import UIKit

var str = "Hello, playground"

// 两个整数互换：使用异或运算：
func testSwapInt() {
    var a = 10
    var b = 9
    print(a, b)
    
    a = a ^ b
    // 此时a中保存的是原始的a与b的不同的bit
    b = a ^ b
    // 此时计算得出的即为原始的a
    a = a ^ b
    // 此时计算得出的即为原始的b
    
    print(a, b)
}
testSwapInt()


// 计算uint的二进制中1的个数
func countOf_1(num: UInt) -> UInt {
    var count: UInt = 0
    
    var tmp = num
    while tmp != 0 {
        // 每次取出最后一位，看是否是1
        count += tmp & 1
        // 右移一位，继续
        tmp = tmp >> 1
    }
    
    return count
}
//print(countOf_1(num: 0b100101011001)) // 执行12次
print(countOf_1(num: 8)) // 执行4次

// 问题：如果连续的0比较多，则while有些浪费。
// 这里while的次数与数字的实际bit位个数相等。
// 改进：如何做到while次数仅与1的个数相等？

// 思路：通过不断使得tmp的所有位都变为0的方式。从低位开始。
func countOf_1_better(num: UInt) -> UInt {
    var count: UInt = 0
    
    var tmp = num
    while tmp != 0 {
        count += 1
        tmp = tmp & (tmp - 1)
    }
    
    return count
}
//print(countOf_1_better(num: 0b100101011001)) // 仅执行6次
print(countOf_1_better(num: 8)) // 仅执行1次


// 判断是否是2的整数次幂：二进制表示中有且只有一位（最高位）是1，而其他位都是0
func isPowerOf2(num: UInt) -> Bool {
    return (num & (num - 1)) == 0
}
print(isPowerOf2(num: 8))
print(isPowerOf2(num: 9))

// 移除最高位，判断剩下的是否为0即可
//func is2_N_another(num: UInt) -> Bool {
//    return (num << 1) == 0
//}
//print(is2_N_another(num: 8))
//print(is2_N_another(num: 9))
//
//3 << 1
//4 >> 1


// 缺失的数字
// 假定数组中所有元素都有两个，一旦有一个数字丢失，如何找出？
// 利用异或操作
func findLostNum(nums: [Int]) -> Int {
    var lostNum: Int = 0
    for n in nums {
        lostNum = lostNum ^ n
    }
    return lostNum
}
print(findLostNum(nums: [1,2,3,4,3,2,1]))

func find2LostNums(nums: [Int]) -> (Int, Int) {
    var lostNum1: Int = 0
    var lostNum2: Int = 0
    
    var tmp: Int = 0
    for n in nums {
        tmp = tmp ^ n
    }
    // 此时，tmp即为两个消失的数字的异或结果
    
    // 找到tmp中第一个为1的位，即A，B不同的位
    var flag: Int = 1
    while (tmp & flag) == 0 {
        flag = flag << 1
    }
    
    // 将数组分成两组，分别包含其中一个丢失的数字
    // 然后使用findLostNum的算法来求出该丢失的数字
    for n in nums {
        if (n & flag) == 0 {
            lostNum1 = lostNum1 ^ n
        } else {
            lostNum2 = lostNum2 ^ n
        }
    }
    
    return (lostNum1, lostNum2)
}
print(find2LostNums(nums: [1,2,3,4,5,6,4,3,2,1]))

// 使用compctMap过滤空值
let keys: [String?] = ["a", nil, "bb", nil, "ccc"]
let validKeys = keys.compactMap { $0 }
keys
validKeys
let validKeysCount = keys.compactMap { $0?.count}
validKeysCount

// 输入文本，得到所有单词出现的频率
let NON_WORDS: Set = ["the", "and", "of", "to",
                      "a", "i", "it", "in", "or", "is", "as", "so",
                      "but", "be"]
func wordFreqence(words: String) -> [String: Int] {
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    for word in wordList {
        let lowercasedWord = word.lowercased()
        if NON_WORDS.contains(lowercasedWord) { continue }
        if let count = wordDict[lowercasedWord] {
            wordDict[lowercasedWord] = count + 1
        } else {
            wordDict[lowercasedWord] = 1
        }
    }
    return wordDict
}
let words = """
    There are there are moments in life when you miss someone so much
    that you just want to pick them from your dreams and hug them for real.
"""
wordFreqence(words: words)

func wordFreqence2(words: String) -> [String: Int] {
    var wordDict: [String: Int] = [:]
    let wordList = words.split(separator: " ")
    wordList.map { $0.lowercased() }
        .filter { !NON_WORDS.contains($0) }
        .forEach {
            wordDict[$0] = (wordDict[$0] ?? 0) + 1
        }
    return wordDict
}
wordFreqence2(words: words)


// clean names, 过滤掉单字母的名字
let names = ["neal", "s", "stu", "j", "rich", "bob", "aiden", "j", "ethan"]
func cleanNames(names: [String]) -> String {
    var cleanNames = ""
    for name in names {
        if name.count > 1 {
            cleanNames += name.capitalized + ","
        }
    }
    cleanNames.remove(at: cleanNames.index(before: cleanNames.endIndex))
    return cleanNames
}
cleanNames(names: names)

let cleanNames2 = names.filter { $0.count > 1}
                        .map { $0.capitalized }
                        .joined(separator: ",")
cleanNames2

// 此parallelMap非线程安全，会导致丢失结果元素
extension Array where Element: Any {
    func parallelMap<T>(_ transorm: (Element) -> T) -> [T] {
        let n = self.count
        if n == 0 { return [] }
        
        var result = ContiguousArray<T>()
        result.reserveCapacity(n)
        
        DispatchQueue.concurrentPerform(iterations: n) { (i) in
            result.append(transorm(self[i]))
        }
        
        return Array<T>(result)
    }
}

let cleanNamesParallel = names.filter { $0.count > 1}
                                .parallelMap { $0.capitalized }
                                .joined(separator: ",")
cleanNamesParallel
