# **SwiftUI in 100 Days**

------

Video URL:https://www.bilibili.com/video/BV1hZ42127Qu/?spm_id_from=333.788&vd_source=dec0df5946c5a4e7864de4bc96371c49

------

## SwiftUI语法

### Day1：变量、常量、字符串、数字

- 给变量/常量起名要使用驼峰法
- 开发过程中尽量用let创建字符串、常量等，var会不经意间被修改。
- 字符串的长度不限
- 多行字符串需要使用三个双引号"""...."""
- 因为计算机架构是2进制的，所以算0.1+0.2不是等于0.3，而是3.0000000004。这是不可避免的。

```swift
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
SwiftUi language!
It is nice to meet
you here!🧑🏻‍💻
"""

//1.打印字符串有几个字符，这里一个emoji就是一个byte
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
```

### Day2：布尔值、字符串插值、CheckPoint1

- 字符串之间用+拼接时，+两边的类型必须相等

```swift
import Cocoa

//1️⃣ bool的两种取反方式
var isVerified = true
//1. !
print(!isVerified)
//2. .toggle()
print(isVerified.toggle())

//2️⃣ 字符串插值的两种方式
//1. + （两边类型必须相同）
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
//2. \() 类型随意
let name = "Taylor"
let age = 21
let message = "Hello, my name is \(name). I'm \(age) years old."
print(message)

//📋CheckPoint1:摄氏度华氏度的转换
let celsius = 26.0
let fahrenheit = celsius * 9 / 5 + 32
print(celsius)
print(fahrenheit)
```

### Day3：数组、字典、集合、枚举

- 不能将不同类型的数据放进同一个数组内
- 常量数组sorted不会改变原数组，反而会生成下面一行的新数组。

![截屏2024-06-26 22.14.23](/Users/fan/Desktop/SwiftUIIn100Days/note/SwiftUI in 100 Days.assets/截屏2024-06-26 22.14.23.png)

- 常量数组reversed不会改变原数组，swift会记住原来的顺序，并生成一个倒序的新collection。![截屏2024-06-26 22.13.43](/Users/fan/Desktop/SwiftUIIn100Days/note/SwiftUI in 100 Days.assets/截屏2024-06-26 22.13.43.png)

- 集合（set）和数组的区别：1.无序的 2.无重复元素
- 所以集合不是append 而是用insert
- 数组中找值是按照序号一个个找下去的，非常慢。而集合里找值非常快。
- 枚举既能提高写代码的效率，也能提高swift的编译效率

```swift
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
```

### Day4：类型注释、CheckPoint2

- 寻找到适合自己的声明方式

```swift
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
print(usingUI)

let names = ["John", "Terry", "Tom", "Steve", "Elon", "Steve"]
var uniqeNames = Set(names)
print("Name.count = \(names.count) uniqeNames.count = \(uniqeNames.count)")
print(uniqeNames.insert("Steve"))

//空数组、集合、字典
var eArray1 = Array<Int>()
var eArray2 = [String]()
var eArray3: [String] = []

var eSet1 = Set<Int>()
var eSet2: Set<Int> = ([])

var eDictionary:[Int: String] = [:]
```

### Day5：If、switch、三元运算符

- 寻找到适合自己的声明方式
- swift的switch语句不像c那样（即使匹配到对应的case也会跑下去）swift只会跑最终匹配到的case
- 如果希望swift执行下面没匹配到的case，就用fallthrough
- swiftUI中如果频繁使用if else，代码就会一团糟，使用三元运算符就能很好地解决这个问题
- print()里不能使用if else进行选择性打印，但用三元运算符就可以

```swift
import Cocoa

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3 {
    numbers.removeFirst()
}
print(numbers)

var username = ""
if username.isEmpty {
    username = "Unknown User"
}
print(username)

enum TransportOptions{
    case bike
    case car
    case airplane
    case scooter
}

let transport = TransportOptions.scooter

print("Your transport is:")
if transport == .scooter {
    print("Scooter")
} else if transport == .airplane{
    print("Airplane")
} else if transport == .car {
    print("car")
} else if transport == .bike {
    print("bike")
} else {
    print("Null")
}

enum NatrulNum {
    case one
    case two
    case three
}
let number1 = NatrulNum.one
switch number1 {
case .one:
    print("1")
    fallthrough
case .two:
    print("2")
    fallthrough
default:
    print("Null")
}

let timeNow = 14
print(timeNow <= 18 ? "Light Mode on!" : "Dark Mode on!")
```

### Day6：循环、CheckPoint3

- checkpoint3中的逻辑写起来简单 但是重在优化 需要设计出足够优化的代码逻辑

```swift
import Cocoa

//for循环
let platforms = ["macOS", "iOS", "tvOS", "watchOS", "VisionOS"]
for os in platforms {
    print("Swift can run in \(os)")
}

for i in 0...9 {
    for j in 0..<10{
//        print("\(i)\(j)")
    }
}

var lyric = "Haters gonna hate "
for _ in 1..<5 {
    lyric += "hate "
}
print(lyric)

//while循环
var loopNumber = 5
while loopNumber >= 0 {
    if loopNumber != 0 {
        print(loopNumber)
        loopNumber -= 1
    } else {
        print("Time out!")
        break
    }
}

var dices = 0
while dices != 12 {
    print("I rolled \(dices)")
    dices = Int.random(in: 1...12)
}
print("I rolled the max!")

//continue break
var demoArray1 = [Int]()

for i in 1...100_00 {
    if i.isMultiple(of: 1) && i.isMultiple(of: 2) {
        demoArray1.append(i)
        if demoArray1.count == 10 {
            break
        }
    }
}

print(demoArray1)

//Checkpoint3📋
//FizzBuzz案例：从1到100，3的倍数打印Fizz，5的倍数打印Buzz，3和5的倍数打印FizzBuzz，其他的打印真实数字。
for i in 1...100 {
    if i.isMultiple(of: 3) {
        print("Fizz")
        if i.isMultiple(of: 5) {
            print("FizzBuzz")
        }
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
```

### Day7：函数、参数、元组、返回值

- 函数如果只有一行return语句，可以直接省略return关键字
- 元组和字典的区别：字典是不确定的，需要有个default值。元祖不需要，并且可以同时容纳多个值。更像是json键值对。元组常用于函数返回多个值。
- 函数名称相同，但函数参数不同，那依旧是不同的函数。类似于重载。
- 函数参数可以起两个名字，一个给外部调用时使用，一个给内部使用。

```swift
import Cocoa

//比较两个字符串内容是否相等
func compareTwoStrings(String1: String, String2: String) -> Bool {
//    let first = String1.sorted()
//    let second = String2.sorted()
//    if first == second {
//        return true
//    } else {
//        return false
//    }
//    以上代码可以简写成以下方式
//    return String1.sorted() == String2.sorted()
//    只有一行返回值代码时 可以把return省略
    String1.sorted() == String2.sorted()
}

compareTwoStrings(String1: "abcd", String2: "adcb")

func Pythagorean(a: Double,b: Double) -> Double {
//    var input = a * a + b * b
//    return sqrt(input)
    sqrt(a * a + b * b)
}

Pythagorean(a: 3, b: 4)

//元组
//元组全写形式
func tuplePrint1() -> (firstname: String, secondname: String) {
//    (firstname:"Steve", secondname:"Jobs")
//    可以不写元组键
    ("Steve","Jobs")
}
let ceo1 = tuplePrint1()
print("\(ceo1.firstname) \(ceo1.secondname)")
//元组数组模式
func tuplePrint2() -> (String, String) {
    ("Steve","Jobs")
}
let ceo2 = tuplePrint2()
print("\(ceo2.0) \(ceo2.1)")
//元组分裂赋值
func tuplePrint3() -> (firstname:String, secondname:String){
    (firstname:"Steve", secondname:"Jobs")
}
let (firstname1, secondname) = tuplePrint3()
let (firstname2, _) = tuplePrint3()
print("\(firstname1) \(secondname)")
print("I just want firstname:\(firstname1)")

func rollDices(sides: Int, count: Int) -> [Int] {
    var dicePoints = [Int]()
    for _ in 1...count {
        dicePoints.append(Int.random(in: 1...sides))
    }
    return dicePoints
}
print(rollDices(sides: 6, count: 4))

//参数标签和参数名称：函数参数可以起两个名字，一个给外部调用时使用，一个给内部使用。
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}
let string1 = "HELLO,WOLRD!"
print(isUppercase(string1))
```

### Day8：默认值、throw截取错误、CheckPoint4

- 函数参数能给默认值
- 函数能报错抓错：do{}catch{}

```swift
import Cocoa

//函数能给默认值
func rollDices(sides: Int, count: Int = 5) -> [Int] {
    var dicePoints = [Int]()
    for _ in 1...count {
        dicePoints.append(Int.random(in: 1...sides))
    }
    return dicePoints
}
print(rollDices(sides: 6, count: 4))

var demoArray1 = ["1", "2", "3", "4"]
print(demoArray1.count)
//keepingCapacity:清空数组后，是否保存数组原内存空间的开关，默认是关着的。
demoArray1.removeAll(keepingCapacity: true)
print(demoArray1.count)

//对可能发生错误的代码段抓错：do{...}catch{...}
//1.创建出一个error类型的枚举
enum ErrorCodes:Error {
    case short
    case obvious
}
//2.设置抛错条件
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {throw ErrorCodes.short}
    if password == "12345" {throw ErrorCodes.obvious}
    
    if password.count > 5 {
        return "Password length: Normal"
    } else if password.count < 12 {
        return "Password length: Good"
    } else {
        return "Password length: Great"
    }
}

//3.do{}catch{} try是设置抓错的关键词
do {
    let password = "123"
    let result = try checkPassword(password)//try在这里可以写成try!（同时也不用写do了）：用来表示完全确认不会抛错，很少用！
    print(result)
} catch {
    print("Error happend")
}

//4.自定义抛错处理
do {
    let password = "12345"
    let result = try checkPassword(password)
    print(result)
} catch ErrorCodes.short {
    print("Password too short!")
} catch ErrorCodes.obvious {
    print("Password too obvious!")
} catch {
    print(error.localizedDescription)//苹果自带的报错信息
}

//CheckPoint4📋：自己写一个1～10000求平方根的函数
enum ErrorCodeForSqrt:Error {
    case tooLow
    case tooHigh
    case noFound
}

func squareRoot(_ numberToBeSquared:Int) throws -> Int {
    if numberToBeSquared < 1 { throw ErrorCodeForSqrt.tooLow }
    if numberToBeSquared > 10_000 { throw ErrorCodeForSqrt.tooHigh }
    for i in 1...100 {
        if i * i == numberToBeSquared {
            return i
        }
    }
    throw ErrorCodeForSqrt.noFound
}

let number = 10000
do {
    let result = try squareRoot(number)
    print("The root of \(number) is \(result)")
} catch ErrorCodeForSqrt.tooLow {
    print("\(number) is too low.")
} catch ErrorCodeForSqrt.tooHigh {
    print("\(number) is too high.")
} catch ErrorCodeForSqrt.noFound {
    print("Root no found")
} catch {
    print("A problem happend")
}
```

### Day9：闭包、传递函数到函数、CheckPoint5

- 将一个函数复制给另一个函数时，不能加（）
- 简写闭包步骤：
  1. 因为swift已经知道sorted by：会传入两个数组对应的数据类型并丢出一个bool，所以(a: String, b: String) -> Bool in...可以简写成a, b in...
  2. 当调用sorted等函数时，可以用尾随闭包法：删掉(by：...)
  3. swift其实并不关心变量名叫什么，只关心数据类型是什么，有几个，所以变量可以写成$0、$1，同时去掉in关键词。
- 一般三种情况不考虑使用$0 $1的变量简写形式：
  1. 参数在两个以上 $0 $1 $2 $3
  2. 参数使用不止一次
  3. 闭包函数主体很长
- swift中常用isMultiple(of: Int)来判断是不是一个数的倍数或者是否是奇偶数
- for item in result {...} 通常用来循环打印数组 

```swift
import Cocoa

//1️⃣学习闭包
//把一个函数拷贝到另一个函数
func greeting() {
    print("Hello!")
}
greeting()
var greetingCopy1 = greeting
greetingCopy1()

//以上code可以简写为闭包的形式
let greetingCopy2 = {
    print("Hello!")
}
greetingCopy2()

//写一个完整的闭包
let greetingCopy3 = { (name: String) -> String in
    "Hello! \(name)"
}
greetingCopy3("World!")

//将函数拷贝写成类型注释型的闭包
let greetingCopy4: () -> Void = greeting //() -> Void指明函数内的数据类型传递：什么参数传进来，什么数据传出去

//集合以上语法的一个例子
func yearPrint(for year: Int) -> String {
    if year == 1989 {
        return "Taylor Swift"
    } else {
        return "Nil"
    }
}

let year: (Int) -> String = yearPrint
print(year(1989))

//sorted(by:)：by后面可以放一个闭包，该闭包接受两个元素，返回一个Bool。
let someHero = ["Spiderman", "IronMan", "Batman", "Wolfman", "CatWoman"]
print(someHero.sorted())
//普通函数放到sorted(by:)
func pickUpCaptionHero(name1: String, name2: String) -> Bool {
    if name1 == "IronMan" {
        return true
    } else if name2 == "IronMan" {
        return false
    }
    return name1 < name2
}
print(someHero.sorted(by: pickUpCaptionHero))
//闭包放到sorted(by:)
print(someHero.sorted(by: {(a: String, b: String) -> Bool in
    if a == "IronMan" {
        return true
    } else if b == "IronMan" {
        return false
    }
    return a < b
}))

//2️⃣简写闭包
print(someHero.sorted {
    if $0 == "IronMan" {
        return true
    } else if $1 == "IronMan" {
        return false
    }
    return $0 < $1
})

//常用的尾随闭包法
print(someHero.sorted{ $0 > $1 })
print(someHero.filter{ $0.hasPrefix("S") })
print(someHero.map{ $0.uppercased() })

//3️⃣将函数作为函数参数传入函数中
//1.写法一：相对完整
func generator() -> Int {
    Int.random(in: 1...10)
}
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var newArray = [Int]()
    
    for _ in 1...size {
        newArray.append(generator())
    }
    
    return newArray;
}
print(makeArray(size: 5, using: generator))

//2.写法二：相对简单
print(makeArray(size: 6) {
    Int.random(in: 1...6)
})

//投骰子🎲案例
func makeRandomArray(length: Int, using randomNum: () -> Int) -> [Int] {
    var newArray = [Int]()
    for _ in 1...length {
        newArray.append(randomNum())
    }
    return newArray
}

let rollDices = makeRandomArray(length: 6) {
    Int.random(in: 1...6)
}

print(rollDices)

//4️⃣将 空参空返回值的函数 作为 参数 的 函数
func doSomethingImportant(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start first work")
    second()
    print("About to start first work")
    third()
    print("Done")
}

doSomethingImportant {
    print("do first work")
} second: {
    print("do second work")
} third: {
    print("do third work")
}


//CheckPoint5📋
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result = luckyNumbers.filter{ $0.isMultiple(of: 2) == false }.sorted { $0 < $1 }.map{ "\($0) is a lucky number" }
//数组循环打印方式1
for item in result { print(item) }
//数组循环打印方式2
result.forEach{print($0)}

//阅读性更好，可以重复使用的写法
func isOdd(a: Int) -> Bool {
    a.isMultiple(of: 2) == false
}

func translateToMapString(a: Int) -> String {
    "\(a) is a lucky number."
}

func printItems(a: String) {
    print(a)
}

luckyNumbers.filter(isOdd).sorted().map(translateToMapString).forEach(printItems)
```

### Day10：结构体、计算属性、属性观察器

- 结构体会自动初始化各成员。
- 在创建结构体实体时，Employee(name: "intSur", vacationRemaining: 3) = Employee.init(name: "intSur", vacationRemaining: 3),这个init类似于c++的类的构造函数，一般来说不用加init就可以，这是一个语法糖。
- struct一般分为两种属性：
  1. 存储属性
  2. 计算属性
- 结构体的init：自定义初始化属性，类似于c++的类的构造函数

```swift
import Cocoa

//1️⃣初始化一个数据结构
struct Album {
    var album: String
    var artist: String
    var year: Int
    
    func printInfo() {
        print("\(album) (\(year)) \(artist)")
    }
}

let red = Album(album: "Red", artist: "Taylor Swift", year: 2012)
let f1Trillion = Album(album: "F1Trillion", artist: "Post Malone", year: 2024)

red.printInfo()
f1Trillion.printInfo()

//2️⃣mutating关键词让结构体内变量可以被改变
struct Employee {
    let name: String
    var vacationRemaining: Int
    //mutating(可变的) 让数据结构函数里的变量可以被修改
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("\(name) go to vacation!")
            print("\(vacationRemaining) days remains.")
        } else {
            print("Opps, vacationRemaining is not enough.")
        }
    }
}

var intSur = Employee(name: "intSur", vacationRemaining: 3)
intSur.takeVacation(days: 1)

//3️⃣结构体的计算属性：get set
struct Employee2 {
    let name: String
    var vacationAllocate: Int = 14
    var vacationTaken: Int = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocate - vacationTaken
        }
        set {
            vacationAllocate = vacationTaken + newValue //这里的newValue是swift自带的，也是就是计算属性本身被调用时的值。
        }
    }
}

var intSur2 = Employee2(name: "intSur2")
intSur2.vacationTaken = 4
print(intSur2.vacationRemaining)
intSur2.vacationRemaining = 6
print(intSur2.vacationAllocate)

//4️⃣结构体的观察器：willSet didSet
struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is : \(contacts)")
            print("Value will be set to : \(newValue)")
        }
        didSet {
            print("Old value is : \(oldValue)")
            print("Value has been set to : \(contacts)")
        }
    }
}

var app = App()
app.contacts.append("Int Sur")
print("------------")
app.contacts.append("Allen M")

//5️⃣结构体的init：自定义初始化属性
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...100)
    }
}

let player1 = Player(name: "IntSur")
print(player1)
```

### Day11：访问权限、静态属性和方法、CheckPoint6

- 给结构体的属性方法设置访问权限：

  1. private：外部不能使用结构体内的东西
  2. fileprivate：外部不能使用文件内的东西
  3. public：所有人都能用
  4. private(set)：外部能读取结构体内的东西，但不能写  

- 结构体static：给结构体属性、方法加上static前缀关键词，那该属性、方法就成为静态可共享的成员，该结构体的所有实体都能用到它。同时也不用必须先创建实体，才能再访问到成员。所以不用mutating关键字，结构体内的static属性就能被修改。

- static成员无法访问非static成员，非static成员可以访问static成员![截屏2024-07-14 15.55.01](/Users/fan/Desktop/SwiftUIIn100Days/note/SwiftUI in 100 Days.assets/截屏2024-07-14 15.55.01.png)

  ![截屏2024-07-14 15.54.11](/Users/fan/Desktop/SwiftUIIn100Days/note/SwiftUI in 100 Days.assets/截屏2024-07-14 15.54.11.png)

- 结构体self和Self的区别：self一般用于调用结构体成员的数值，Self一般用于调用结构体成员的数据类型

```swift
import Cocoa

//1️⃣给结构体属性设置访问权限
//1.创建一个银行账户结构体 其中现金fund这个属性 我们希望它只给外部读的权限 不给外部写的权限 那就用private(set)
struct BankAccount {
    private(set) var fund = 0
    mutating func deposit(amount: Int) {
        fund += amount
    }
    
    mutating func withdraw(amount: Int) {
        if fund > amount {
            fund -= amount
        } else {
            print("Fund not enough.")
        }
    }
}

var account = BankAccount()
print(account.fund)
account.deposit(amount: 10)
print(account.fund)
account.withdraw(amount: 5)
print(account.fund)
account.withdraw(amount: 10)
//account.fund = 20 给fund设置private(set)后 就不能从外部修改属性值

//2️⃣static静态成员
struct School {
    static var studentsName = [String]()
    static var studentNumber = 0
    static func add(name: String) {
        studentsName.append(name)
        studentNumber += 1
    }
    
}

print(School.studentsName)
print(School.studentNumber)
School.add(name: "intsur") //无需创建新的School实体 直接用结构体本体就行
print(School.studentsName)
print(School.studentNumber)

//一般两种情况下使用static
//1.用作可全局调用的结构体常量成员
struct AppInfo {
    static let version = "V1.0"
    static let name = "MyFirstApp"
    static let homeURL = "https://www.intsur.com"
}
//2.用作创建 结构体内的一个示例
struct Employee {
    let username: String
    let password: String
    
    static let exmaple = Employee(username: "test", password: "123")
}
print(Employee.exmaple)

//CheckoutPoint6📋
struct ManualCar {
    let model: String
    let seatsNum: Int
    let maxGear: Int
    private(set) var gear = 1
    mutating func changeGear(difference: Int) {
        gear += difference
        if gear < 1 {
            gear = 1
        } else if gear > maxGear {
            gear = maxGear
        }
    }
    func showGearNumber() {
        print("Gear: \(gear) now.")
    }
    func showModel() {
        print("Model: \(model).")
    }
    func showSeats() {
        print("Seats: \(seatsNum)")
    }
}

var SuzukiSwiftMT = ManualCar(model: "Suzuki Swift 1.5L NA MT", seatsNum: 5, maxGear: 5)
SuzukiSwiftMT.showModel()
SuzukiSwiftMT.showSeats()
SuzukiSwiftMT.showGearNumber()
SuzukiSwiftMT.changeGear(difference: +1)
SuzukiSwiftMT.showGearNumber()
SuzukiSwiftMT.changeGear(difference: +5)
SuzukiSwiftMT.showGearNumber()
SuzukiSwiftMT.changeGear(difference: -3)
SuzukiSwiftMT.showGearNumber()
SuzukiSwiftMT.changeGear(difference: -5)
SuzukiSwiftMT.showGearNumber()
```

### Day12：类、继承、CheckPoint7

- 类和结构体有五个区别：

  1. 类可以继承，有子类父类。结构体就不行。
  2. 类不会自动初始化。
  3. 如果复制了一个类的实体，所有复制出来的数据都共享一份资源。
  4. 当所有类的复制实体被销毁时，类允许通过初始化器，重新初始化。
  5. 常量类实体的变量成员可以被改变。

- override：只有在子类和父类方法名、参数返回值类型名称都完全相同的情况下重载才生效。

- final：加在子类名前，意思是该子类不会有子类继承它。

- 因为类的属性成员必须被初始化，所以在子类中，必须用super.init再初始化父类的属性成员。

- Deinitializer：析构器

  1. 析构器不需要用func关键字来声明
  2. 析构器没有参数和返回值
  3. 析构器在类的最后一个实体被销毁时自动启用
  4. 我们从不直接调用析构器
  5. 结构体没有析构

- 有四种情况：类定实体定，类定实体不定，类不定实体定，类不定实体不定。

  其实就是指针常量和常量指针的概念。所以class的特性是用指针去控制一块内存里的数据，而struct是直接控制一块内存里的数据。
  
- assertionFailure( )（断言）：当代码执行到断言，程序就会丢出错误，并终止执行。只在调试模式下生效，发布模式下这些断言会被移除。

```swift
import Cocoa

//1️⃣初始化一个类
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func work() {
        print("I works \(hours) hours a day.")
    }
    
    func fightWord() {
        print("I like working!")
    }
}

//2️⃣创建两个子类
final class Developer: Employee {
    func develop() {
        print("I develop apps \(hours) hours a day.")
    }
    
    override func fightWord() {
        print("I like developing!")
    }
}

final class Manager: Employee {
    func manage() {
        print("I manage company \(hours) hours a day.")
    }
    
    override func fightWord() {
        print("I like managing!")
    }
}

let Intsur = Developer(hours: 16)
Intsur.develop()
Intsur.fightWord()

let Steve = Manager(hours: 8)
Steve.manage()
Steve.fightWord()

//3️⃣子类的初始化
class Vehicle {
    var isElectric: Bool
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    var isTwoDoor: Bool
    init(isElectric: Bool, isTwoDoor: Bool) {
        self.isTwoDoor = isTwoDoor
        super.init(isElectric: isElectric) // super相当于调用了父类。当子类需要初始化时，必须将父类的所有属性也初始化。
    }
}

let ModelY = Car(isElectric: true, isTwoDoor: false)

//4️⃣类的所有实例共享同一份数据
class User {
    var username: String
    
    init(username: String) {
        self.username = username
    }
    
    func copy() -> User {
        var user = User(username: "nil")
        user.username = username
        return user
    }
}

let user1 = User(username: "nil")
let user2 = user1
user2.username = "Taylor"
//原nil值被改成了Taylor
print(user1.username)
print(user2.username)

//也可以自建一个copy函数，专门用来做拷贝
let user3 = User(username: "nil")
let user4 = user3.copy()
user4.username = "Taylor"
print(user3.username)
print(user4.username)

//5️⃣析构器Deinit
class Users {
    init() {
        print("User init.")
    }
    deinit {
        print("User delete.")
    }
}

//每一个作用域的结束 就会触发到析构器
for _ in 1...3 {
    let user = Users()
    print("User is using.")
}
//类的实例如果是存在数组里 那么在数组元素被销毁时 析构器才触发
var users = [Users]()
for _ in 1...3 {
    let user = Users()
    users.append(user)
    print("User appended.")
}
users.removeAll()

//6️⃣常量类和常量类成员
class Student {
    var name = "nil"
}

let intsur = Student()
print(intsur.name)
intsur.name = "IntSur" // 虽然实体是let的，但实体的成员依旧可以改变，因为成员是var的。
print(intsur.name)

//有四种情况：类定实体定，类定实体不定，类不定实体定，类不定实体不定。
//其实就是指针常量和常量指针的概念。所以class的特性是用指针去控制一块内存里的数据，而struct是直接控制一块内存里的数据。
 
//CheckPoint7📋
class Animal {
    let leg: Int
    init(leg: Int) {
        self.leg = leg
    }
    
    func speak() {
        assertionFailure("This should nerver be called.")//断言：当代码执行到这一行，程序就会丢出错误，并终止执行。只在调试模式下生效，发布模式下这些断言会被移除。
    }
}

class Dog: Animal {
    override func speak() {
        print("Barking...")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corgi barking")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Poodle barking")
    }
}

class Cat: Animal {
    var isTame: Bool
    init(leg: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(leg: leg)
    }
    
    override func speak() {
        print("Meowing...")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian meowing")
    }
}

class Lion: Cat {
    override func speak() {
        print("Lion roaring")
    }
}
```

### Day13：协议、拓展、CheckPoint8

- protocol：协议。类似于基类的概念，但与基类不同的是，**协议的子结构体必须包含协议里的所有成员，而子类不用**。
- 协议的方法不需要写全函数，只需给出入参和返回值即可。
- 协议作为参数传入函数，作用：可以让协议派生出的子结构体们无缝使用该函数。
- 协议不支持直接声明存储属性，必须指明计算属性{ get } { get set }
- 一个结构体可以同时继承多个协议
- Opaque return types：不透明返回类型。因为有了协议，所以多种自定义的结构体之间具有共性，当函数返回值需要返回这些自定义结构体类型时，就可以用不透明返回类型进行模糊地返回一些类型，这样比较有灵活性。
- 用extentions拓展的好处：
  1. 代码完整度：在结构体后面点一下，就能调用拓展的方法。
  2. 代码整洁性：如果不用拓展，那全局函数就会堆得到处都是。  
  3. 内部访问权限：因为是直接加在原数据结构里的，所以可以直接调用结构体里的数据。可以写出类似于sort和sorted这类可改动原字符串，不改动原字符串的方法。
- 拓展中不能新增存储属性，但可以新增计算属性。
- 拓展能实现：即拥有完全自定义的初始化器，又能使用swift自带的聪明的初始化器。
- 拓展需要放在代码顶部
- set、array、dictionary在swift中都属于一个名为“Collection”的协议
- 拓展+协议能实现：让自定义结构体的方法也能和类方法一样，有默认值，也能重写方法。

```swift
import Cocoa

//1️⃣创建一个协议
protocol Vehicle {
    var name: String { get }// 协议的属性必须指明{ get } { get set }
    var seats: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol Electric {
    var isElectric: Bool { get }
}

struct Car: Vehicle, Electric {//一个结构体可以同时继承多个协议
    let name = "Car"
    var seats = 5
    let isElectric = false
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance) kms.")
    }
    func openRoof() {
        print("It's a good day.")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var seats = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I'm driving \(distance) kms.")
    }
}

func commute(distance: Int, vehicle: Vehicle) {// 协议作为参数传入函数，作用：可以让协议派生出的子结构体们无缝使用该函数。
    if vehicle.estimateTime(for: distance) > 100 {
        print("\(vehicle.name) is too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimateTime(vehicles: [Vehicle], distance: Int) -> [Int] {
    var estimateTimes = [Int]()
    for vehicle in vehicles {
        estimateTimes.append(vehicle.estimateTime(for: distance))
    }
    return estimateTimes
}

let car = Car()
commute(distance: 100, vehicle: car)

let bicycle = Bicycle()
commute(distance: 100, vehicle: bicycle)

var times = getTravelEstimateTime(vehicles: [car, bicycle], distance: 100)
print(times)

//2️⃣不透明返回值some Equatable
//为了在面对很复杂的结构体数据类型时，能更灵活得返回出同一协议的值，不透明返回值起了作用。
func getRandomNum() -> some Equatable {
    Int.random(in: 1...6)// 此处，以后想把Int改成Double，直接改函数内容就行，不需要再修改函数返回值。
}

print(getRandomNum() == getRandomNum())

//3️⃣拓展
var quote = "  Stay hungry Stay foolish.   "
extension String {
    //会返回值
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    //不会返回值
    mutating func trim() {
        self = self.trimmed()
    }
    //拓展里不能新增存储属性，但能新增计算属性。以下将分解出的组件字符串直接放入数组内
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
print(quote.trimmed())
print(quote) // trimmed不改变原字符串
print(quote.trim())
print(quote)// trim改变原字符串

let somewords = """
Line1
Line2
Line3
Line4
Line5
"""
print(somewords.lines)
print(somewords.lines.count)

//拓展能实现：即拥有完全自定义的初始化器，又能使用swift自带的聪明的初始化器。
struct Book {
    let bookName: String
    let pages: Int
    var readHours: Int
}

extension Book {//把初始化器放到拓展里
    init(bookName: String, pages: Int) {
        self.bookName = bookName
        self.pages = pages
        self.readHours = pages / 50
    }
}

//即拥有完全自定义的初始化器
let book1 = Book(bookName: "Steve Jobs", pages: 200)
//又能使用swift自带的聪明的初始化器
let book2 = Book(bookName: "Elon Musk", pages:100, readHours: 25)
print(book1)
print(book2)

//4️⃣协议+拓展
extension Collection { //set、array、dictionary在swift中都属于一个名为“Collection”的协议
    var isNotEmpty: Bool{
        isEmpty == false
    }
}

let array1 = [1, 2, 3]
if array1.isNotEmpty {
    print("Array's length is \(array1.count)")
}

protocol Person {
    var name: String { get set }
    func sayHello()//结构体里的空函数
}

extension Person {
    func sayHello() {//设定空函数的默认值,写法类似于上面即可以用自定义的初始化器，又可以用swift的初始化器
        print("Hi, I'm \(name)")
    }
}

//新建的结构体可以不写该函数
struct Creator: Person {
    var name: String
}
let Elon = Creator(name: "Elon Musk")
Elon.sayHello()

struct Designer: Person {
    var name: String
    func sayHello() {
        print("Less is more.")
    }
}
let Steve = Designer(name: "Steve Jobs")
Steve.sayHello()

//CheckPoint8📋
protocol Building {
    var type: String { get }
    var rooms: Int { get }
    var cost: Int { get }
    var estateAgent: String { get }
}

extension Building {
    func salesSummary() {
        print("Contact to \(estateAgent) to buy \(type).")
    }
}

struct House: Building {
    let type = "House"
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

struct Office: Building {
    let type = "Office"
    var rooms: Int
    var cost: Int
    var estateAgent: String
}

let house1 = House(rooms: 10, cost: 100_000, estateAgent: "HengDa")
house1.salesSummary()

let office1 = Office(rooms: 100, cost: 100_000_000, estateAgent: "Wanda")
office1.salesSummary()

//协议拓展是一个swifty的语法，甚至有面向协议编程，所以以下是进阶内容
//1.返回自身类型
extension Numeric {
    func square() -> Self { //这么写：所有的算数类型都能用这个拓展
        self * self
    }
}

//2.Equatable、Comparable协议
struct User: Equatable, Comparable {// 这行也可以直接写成struct User: Comparable,因为Comparable就已经包含了Equatable
    let name: String
    static func <(lsh: User, rsh: User) -> Bool {
        lsh.name < rsh.name
    }
}

let user1 = User(name: "Steve")
let user2 = User(name: "Elon")

print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)
```

### Day14：可选项、空合并、可选链、CheckPoint9

- 可选项允许我们使用可能缺失真实值的数据 

- 所有数据类型都可以是可选的：Int？String？...

- if let ：可选项有真实值时，跑if let里的代码。

  guard let：可选项没有真实值时，跑guard let里的代码。其中，return是必须的。

```swift
import Cocoa

//1️⃣初始化可选类型，什么数据类型都有对应的可选类型
var username: String? = nil
if let unwrappedName = username {
    print("username: \(unwrappedName)")
} else {
    print("unwrappedName is empty")
}

//以字典为例，使用可选类型
let opposites = ["Player1": "Luke", "Player2": "Link"]
if let playerOpposites = opposites["Player3"] {
    print(opposites["Player3", default: "nil"])
}

//可选项类型的跟踪技术：
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let number = number { //判断可选类型是否存在值，这种用法被称为跟踪。只有在有值的时候，跟踪内的代码才会执行，执行完成这些代码后，number又变回了  nil。这非常安全。
    print(square(number: number))
}

//2️⃣在函数中使用 guard...else{...return}
func printSquare(of number: Int?) {
    guard let number = number else {
        print("number is nil")
        return
    }
    print("\(number) * \(number) = \(number * number)")
}

printSquare(of: number)
printSquare(of: 10)

//3️⃣空合并：nil coalescing
let captains = [
    "OnePiece": "Luffy"
]
//字典的传统防止nil值的写法
let captain1 = captains["Anoums", default: "N/A"]
//通用的空合并写法，除了字典，其他数据类型都能用
let captain = captains["Anoums"] ?? "N/A"

print(captain)
print(captain1)

let tvShows = ["Shameless", "Bark Matter"]
let show = tvShows.randomElement() ?? "N/A"

struct Book {
    let bookName: String?
    let author: String?
}

let SteveJobs = Book(bookName: "Steve Jobs", author: nil)
let SteveAuthor = SteveJobs.author ?? "N/A"
print(SteveAuthor)
//空合并用于检错并纠正
let input = ""
let unwrappedInput = Int(input) ?? 0 //空字符串不能被转换成整形，所以返回nil
print(unwrappedInput)

//4️⃣可选链
let emptyBook: Book? = nil
let bookName = emptyBook?.bookName?.first?.uppercased() ?? "Unkown" //这个可选链的意思：emptyBook这个Book类型的实体有没有真实值？如果有的话，它的bookName属性有没有真实值？如果有的话，bookName存在第一个字符吗？如果有的话，那就大写，赋值给bookName。只要这条链路上有一个非真实值，那么就执行空合并。

//5️⃣当不在乎报错类型的时候，可以使用try？，这样那么返回nil，要么返回成功的值。
enum UserErrorCode: Error {
    case Network_Failed
    case UserID_Outloop
}

func getUserID(id userID: Int) throws -> String{
    if userID >= 100 { throw UserErrorCode.UserID_Outloop }
    return "getUserID success."
}

//do catch常规写法
do {
    try getUserID(id: 11)
} catch UserErrorCode.UserID_Outloop{
    print("UserID out of loop now!")
} catch UserErrorCode.Network_Failed{
    print("Network failed now!")
} catch {
    print("Unkown error!")
}
//try?写法
let result = (try? getUserID(id: 100)) ?? "getUserID failed!"
print(result)// 忽略了具体是什么报错，只关心返回是否成功。

//CheckPoint9📋
func randomPickArray(of array: [Int]?) {
    array?.randomElement() ?? Int.random(in: 1...100 )
}
//CheckPoint9拓展：如果传入的array连数组元素类型也不确认，该如何处理？Ans：双重空合并
func randomPickArray(of array: [Int?]?) {
//    let randomIn100 = Int.random(in: 1...100) 这样写会有问题：如果数组元素确实是nil，那这个randomIn100常量就白创建了，会浪费资源。这时候可以用lazy关键字，让randomIn100只有在被调用的时候，再进行生成随机数。
    lazy var randomIn100 = Int.random(in: 1...100)
    (array?.randomElement() ?? randomIn100) ?? randomIn100
}
```

### Day15：一小时超快复习

## SwiftUI项目

### Day16：WeSplit项目第一部分

#### 项目文件目录简介：

- 显示文件格式：偏好设置→通用

- 项目主函数文件：main主函数，起了个线程，一直会跑。![](./SwiftUI in 100 Days.assets/截屏2024-07-22 22.09.52.png)
- 资产文件：存放所有用到的图片资源![截屏2024-07-22 22.12.45](./SwiftUI in 100 Days.assets/截屏2024-07-22 22.12.45.png)
- Preview Content:预览数据信息

#### ContentView初始化代码解析：

![截屏2024-07-22 22.45.42](./SwiftUI in 100 Days.assets/截屏2024-07-22 22.45.42.png)

```swift
import SwiftUI

struct ContentView: View {//从View协议中创建ContentView
    var body: some View {//创建名为body的计算属性，返回不透明返回类型。
        VStack {//一个垂直堆叠视图容器，它将子视图垂直排列。
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)//设置图像的前景色为当前视图的色调（tint color）
            Text("Hello, world!")
        }
        .padding()//为 VStack 视图添加默认的内边距，使其内容与视图边界之间有一些空间。
    }
}
//#后的代码不会被上传，仅用于在画布（canvas）上预览app使用
#Preview {
    ContentView()
}
```

#### 表单案例：

![截屏2024-07-22 23.17.32](./SwiftUI in 100 Days.assets/截屏2024-07-22 23.17.32.png)

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {//导航栏视图
            Form {//表单视图
                Section {//章节视图
                    Text("Hello World!🌍")
                }
                
                Section {
                    Text("Hello World!🌍")
                    Text("Hello World!🌍")
                }
                
                Text("Hello World!🌍")
                Text("Hello World!🌍")
                Text("Hello World!🌍")
                Text("Hello World!🌍")
            }
            .navigationTitle("SwiftUI")//导航栏标题
            .navigationBarTitleDisplayMode(.automatic)//导航栏标题显示模式
        }
    }
}

#Preview {
    ContentView()
}
```

#### 点按钮次数案例：

![截屏2024-07-22 23.32.38](./SwiftUI in 100 Days.assets/截屏2024-07-22 23.32.38.png)

```swift
import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0//@State：属性包装器（property wrapper），它用于声明一个可以被视图重新渲染时改变的可变状态。属性包装器允许计算属性中的闭包方法更改这个值，Apple官方推荐加上private以增加数据安全性。
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
```

#### 输入框绑定变量案例：

![截屏2024-07-23 19.17.36](./SwiftUI in 100 Days.assets/截屏2024-07-23 19.17.36.png)

```swift
import SwiftUI

struct ContentView: View {
    @State private var name = ""//存储用户输入的变量
    var body: some View {
        Form {
            TextField("Enter your username:", text: $name)//TextField必须有一个与之绑定的变量名，在这里是name，前面的$是指双向绑定：此TextField可以同时读取和修改name。
            Text("Hello \(name)")//这里只读，所以没有$
        }
    }
}

#Preview {
    ContentView()
}
```

#### 选择框绑定变量案例：

![截屏2024-07-23 20.16.04](./SwiftUI in 100 Days.assets/截屏2024-07-23 20.16.04.png)

```swift
import SwiftUI

struct ContentView: View {
    let students = ["harry", "Hermione", "Ron"]
    @State private var name = ""
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student:", selection: $name) {//创建一个选择器，选择到的数据会被同步进双向绑定的name中
                    ForEach(students, id: \.self) { //用循环创建出一个数组的text视图，并将循环到的所有text视图放入picker中。其中id: \.self，\ 引入了关键路径，. 表示当前元素，self 表示该元素本身。
                      	Text($0)
                    }
                }
            }
            .navigationTitle("Select your student")
        }
    }
}

#Preview {
    ContentView()
}
```

### Day17：WeSplit项目第二部分

#### 完成基础框架：

![截屏2024-07-24 20.49.21](./SwiftUI in 100 Days.assets/截屏2024-07-24 20.49.21.png)

```swift
import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 10
    @FocusState private var amountIsFocused: Bool//@FocusState专门用于绑定Focus
    
    let tipPercentages = [0, 10, 15, 20]
    
    var totalPerPerson: Double {//用于计算每个人平摊费用的计算属性
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))// 如果双绑定数据类型（$checkAmount）是数字，那就用value；如果是字符串，那要用text。format设置了货币类型。
                        .keyboardType(.decimalPad)// 输入键盘使用数字键盘
                        .focused($amountIsFocused)// 设置输入框focusflag，以供关闭键盘
                    Picker("Select number of people", selection: $numberOfPeople) {// 选择器双向绑定的是numberOfPeople
                        ForEach(2..<98) {// 用循环生成2～98个人的全部视图，传给选择器进行显示。这里只能用开区间，不能用闭区间。
                            Text("\($0)")
                        }
                    }// .pickerStyle(.navigationLink) //navigationLink：点击选择器后会跳入新界面中供用户选择，这很好，但并不喜欢这个效果，所以把它注释掉了。
                }
                
                Section("How much tip do you want to leave?") {//章节文本显示
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)//选择器样式为滑块
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("Tonight's bill 🥗")//为什么navigationTitle要写在NavigationStack里？因为相当于新增了一个标题进NavigationStack，在标题后再进行显示表单等视图元素。
            .toolbar {//修饰符toolbar()让我们可以指定视图的工具栏项。这些工具栏项可能出现在屏幕上的各个位置 - 顶部的导航栏中、底部的特殊工具栏区域等。
                if amountIsFocused {//如果输入框被选中
                    Button("Done") {//在右上角生成Done的按钮
                        amountIsFocused = false//将输入框flag关闭
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

```

### Day18：WeSplit项目优化

#### 代码优化：

```swift
    var userCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var grandTotal: Double {
        let tipAmount = checkAmount / 100 * Double(tipPercentage)
        return checkAmount + tipAmount
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 1)
        return grandTotal / peopleCount
    }
```

### Day19：距离转换器Convertor案例

#### 原始写法：

```swift
import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @FocusState private var focusFlag: Bool
    
    let units = ["Meters", "KiloMeters", "Yards", "Feet", "Miles"]
    
    var result: String {
        let inputToMetersMultiplier: Double
        let outputToMetersMultiplier: Double
        
        switch inputUnit {
        case "KiloMeters":
            inputToMetersMultiplier = 1000.0
        case "Yards":
            inputToMetersMultiplier = 0.9144
        case "Feet":
            inputToMetersMultiplier = 0.3048
        case "Miles":
            inputToMetersMultiplier = 1609.34
        default:
            inputToMetersMultiplier = 1.0
        }
        
        switch outputUnit {
        case "KiloMeters":
            outputToMetersMultiplier = 0.001
        case "Yards":
            outputToMetersMultiplier = 1.09361
        case "Feet":
            outputToMetersMultiplier = 3.28084
        case "Miles":
            outputToMetersMultiplier = 0.000621371`
        default:
            outputToMetersMultiplier = 1.0
        }
        
        return "\((inputValue * inputToMetersMultiplier * outputToMetersMultiplier).formatted()) \(outputUnit.lowercased())"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Input value:", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($focusFlag)
                }
                
                Picker("Select input unit:", selection: $inputUnit) {
                    ForEach(units, id:\.self) {
                        Text($0)
                    }
                }.pickerStyle(.menu)
                
                Picker("Select output unit:", selection: $outputUnit) {
                    ForEach(units, id:\.self) {
                        Text($0)
                    }
                }.pickerStyle(.menu)
                
                Section("Output Value:") {
                    Text(result)
                }
            }
            .navigationTitle("Convertor📏")
            .toolbar {
                if focusFlag {
                    Button("Done") {
                        focusFlag = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
```

优化写法：

1. 无需自己写转换逻辑，调用Apple自带的测量和基础API（MeasurementFormatter和Measurement）即可完成聪明的翻译+本地化转换（根据用户所在地和使用语言选择合适爹转换单位）
2. 不仅仅可以换算距离，还可以换算质量，温度，时间

```swift
import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit: Dimension = UnitLength.meters// 类级关系：Dimension → UnitLength → meters
    @State private var outputUnit: Dimension = UnitLength.millimeters// 类级关系：Dimension → UnitLength → meters
    @State private var selectedUnit = 0
    @FocusState private var focusFlag: Bool
    
    let conversions = ["Distance", "Mass", "Temperature", "Time"]// 转换单位的种类：距离，质量，温度，时间
    let units = [
        [UnitLength.meters, UnitLength.kilometers, UnitLength.yards, UnitLength.feet, UnitLength.miles],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.milliseconds, UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours]
    ]// 创建二维数组，以对应inputUnit和outputUnit
    
    let formatter: MeasurementFormatter// MeasurementFormatter 是 Swift 中用于格式化度量单位的类
    
    var result: String {
        let inputMeasurement = Measurement(value: inputValue, unit: inputUnit)//设定输入值和单位
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)//转换到输出单位
        return formatter.string(from: outputMeasurement).capitalized//用formatter器输出对应输出值的字符串值，并且首字母大写。
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Input value:", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($focusFlag)
                }
                
                Section {
                    Picker("Select conversion type:", selection: $selectedUnit) {
                        ForEach(0..<4) { index in
                            Text(conversions[index])
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Picker("Select input unit:", selection: $inputUnit) {
                    ForEach(units[selectedUnit], id:\.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Picker("Select output unit:", selection: $outputUnit) {
                    ForEach(units[selectedUnit], id:\.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Section("Output Value:") {
                    Text(result)
                }
            }
            .navigationTitle("Convertor📏")
            .toolbar {
                if focusFlag {
                    Button("Done") {
                        focusFlag = false
                    }
                }
            }
            .onChange(of: selectedUnit) {// 每当选中单位类型发生变化，输入和输出单位都要对应变化
                inputUnit = units[selectedUnit][0]
                outputUnit = units[selectedUnit][1]
            }
        }
    }
    
    init() {// 以下代码写init里 是因为没法写在ContentView的开头
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit// 让swift使用我们提供出的单位，不让swift使用自己从用户地区默认读出来的单位
        formatter.unitStyle = .long// 显示的单位风格
    }
}

#Preview {
    ContentView()
}
```



#### 
