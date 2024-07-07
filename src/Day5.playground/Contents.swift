import Cocoa

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3 {
    numbers.removeFirst()
}
print(numbers)

var username = ""
if username.isEmpty {
    username = "Unknown User"
}
print(username)

enum TransportOptions{
    case bike
    case car
    case airplane
    case scooter
}

let transport = TransportOptions.scooter

print("Your transport is:")
if transport == .scooter {
    print("Scooter")
} else if transport == .airplane{
    print("Airplane")
} else if transport == .car {
    print("car")
} else if transport == .bike {
    print("bike")
} else {
    print("Null")
}

enum NatrulNum {
    case one
    case two
    case three
}
let number1 = NatrulNum.one
switch number1 {
case .one:
    print("1")
    fallthrough
case .two:
    print("2")
    fallthrough
default:
    print("Null")
}

let timeNow = 14
print(timeNow <= 18 ? "Light Mode on!" : "Dark Mode on!")
