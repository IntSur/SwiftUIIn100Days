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
