import Cocoa

//1️⃣ 变量 常量
var greeting = "Hello, playground👨🏻‍💻"

var numberOfPeople = 10
var nameOfMan = "Smith"
let nameOfBook = "《SwiftUi Programme》"
print(nameOfBook)

let quote = "He tapped a sign \"Hello!\" and go ahead."

let wordsToYou = """
Welcome to study
Swift language!
It is nice to meet
you here!🧑🏻‍💻
"""

//1.打印字符串有几个字符，这里一个emoji = 1 byte
print(greeting.count)

//2.小写字符转换为大写
print(greeting.uppercased())

//3.判断字符串开头是不是以“Welcome开头”
print(wordsToYou.hasPrefix("Welcome"))

//4.判断字符串结尾是不是以“here!”结尾
print(wordsToYou.hasSuffix("here!🧑🏻‍💻"))

//2️⃣ 运算符
let normalNumber = 10
//_会被swift忽略 _一般用于分割数 让多位的大数字更易读
let bigNumber = 10_000_000

//判断120是不是3的倍数
print(bigNumber.isMultiple(of: 10))
print(120.isMultiple(of: 10))

//3️⃣ 浮点数
let number = 0.1 + 0.2
//swift自动判定所有小数为double类型，所以结果并不是0.3
print(number)

let a = 0.1
let b = 1.2
let c = Double(a) + b
print(c)
