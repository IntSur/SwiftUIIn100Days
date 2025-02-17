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
//元组常用于函数返回多个值。
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
