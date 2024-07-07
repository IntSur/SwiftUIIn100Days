import Cocoa

var arrayDemo1: [String] = ["apple", "microsoft"]
var setDemo1: Set<String> = ([
    "One",
    "Two",
    "Three",
])
var dictionaryDemo1: [String: Int] = [
    "one": 1,
    "two": 2,
    "three": 3
]

enum systemUI{
    case light
    case dark
    case system
}
var usingUI = systemUI.light
print(usingUI )

let names = ["John", "Terry", "Tom", "Steve", "Elon", "Steve"]
var uniqeNames = Set(names)
print("Name.count = \(names.count) uniqeNames.count = \(uniqeNames.count)")
print(uniqeNames.insert("Steve"))

//空数组、集合、字典
var eArray1 = Array<Int>()
var eArray2 = [String]()
var eArray3: [String] = []

var eSet1 = Set<Int>()
var eSet2: Set<Int> = ([1,2,3])

var eDictionary:[Int: String] = [:]
