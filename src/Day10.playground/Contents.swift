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

//3️⃣计算属性：get set
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

//4️⃣观察器：willSet didSet
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
