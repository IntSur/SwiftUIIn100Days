import Cocoa

//1️⃣创建一个协议基类
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
