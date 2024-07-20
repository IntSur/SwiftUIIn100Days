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
