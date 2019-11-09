//: Playground - noun: a place where people can play

import UIKit

var set: Set = ["hello", "world", "!!!"]
for v in set {
    print(v)
}
// Set是无序的
for v in set.sorted() {
    print(v)
}

var set1: Set = ["hello"]
var set2 = set.intersection(set1)
print(set2)
set.sorted()
