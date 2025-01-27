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
enum ErrorCodes: Error {
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
enum ErrorCodeForSqrt: Error {
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
