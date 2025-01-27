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

//5️⃣当不在乎报错类型的时候，可以使用try？，这样要么返回??后面的值，要么返回成功的值。
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
//CheckPoint9拓展：如果传入的array连数组元素类型也不确认，该如何处理？Answer：双重空合并
func randomPickArray(of array: [Int?]?) {
//    let randomIn100 = Int.random(in: 1...100) 这样写会有问题：如果数组元素确实是nil，那这个randomIn100常量就白创建了，会浪费资源。这时候可以用lazy关键字，让randomIn100只有在被调用的时候，再进行生成随机数。
    lazy var randomIn100 = Int.random(in: 1...100)
    (array?.randomElement() ?? randomIn100) ?? randomIn100
}


