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
