import Cocoa

//1️⃣初始化数组
//1.完整的初始化空数组
var numbers = Array<Int>()
var singers = Array<String>()

//2.简短的初始化空数组
var ints = [Int]()
var doubles = [Double]()
var albums = [String]()

//3.swift自行隐式判断出什么类型
let temperatures = [26.2, 28.1, 22.9]
let names = ["Steve", "Tim", "Jovi"]
let warroirs = ["Steph", "Klay", "Draymond"]

//数组的常用方法
//1.在数组末尾增加元素
numbers.append(10)
numbers.append(11)
numbers.append(12)
print(numbers)

//2.查看数组元素个数
print(numbers.count)

//3.删除指定下标的元素、删除所有元素
numbers.remove(at: 0)
print(numbers)
numbers.removeAll()
print(numbers)

//4.检查数组是否包含值为“Steve”的元素
print(names.contains("Steve"))

//5.排序元素
//Tips:常量数组只能用sorted，sorted不会改变原数组，反而会生成下面一行的新数组。
print(temperatures)
print(temperatures.sorted())

//6.反转数组
//Tips:常量数组只能用reversed，reversed不会改变原数组，swift会记住原来的顺序，并生成一个倒序的新collection。
print(warroirs.reversed())

//2️⃣字典
//1.初始化字典
var players = [Int: String]()
let company = [
    "Steve Jobs": "Apple",
    "Elon Musk": "Tesla",
    "Zach": "Meta"
]

//2.查看字典固定键值
//Tips：这是一个可选值，必须指定未匹配到键时的常规值
print(company["Steve Jobs", default: "Undefined"])

//3.往空字典里加元素键值对
players[30] = "Curry"
players[11] = "Tompson"
print(players[30, default: "Nobody"])
print(players[11, default: "Nobody"])
print(players[81, default: "Nobody"])

//4.修改字典里的元素键值对
players[11] = "player"
print(players[11, default: "Nobody"])

//3️⃣集合
//1.初始化集合
var books = Set<String>()
var people = Set([1, 2, 3, 4, 5, 6, 7, 8, 8])
//set是无序 不重复的
print(people)

//2.往空数组中新增元素
books.insert("C语言教程")
books.insert("C++秘籍")
books.insert("Swift0基础教学")
print(books)

//3.查元素数量
books.count
print(books)

//4.排序
print(books.sorted())

//5.删除
books.remove("Swift0基础教学")
print(books)

//4️⃣枚举
//1.初始化枚举
enum Weekday{
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}
//简写
enum Weekend{
    case Saturday, Sunday
}

var day = Weekday.Monday
day = Weekday.Tuesday
//简写
day = .Tuesday
day = .Wednesday
print(day)

