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
        super.init(isElectric: isElectric) // super相当于调用了父类。当子类需要初始化时，必须将父类的所有成员也初始化。
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
