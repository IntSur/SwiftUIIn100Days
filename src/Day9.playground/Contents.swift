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
