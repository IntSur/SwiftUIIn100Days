import Cocoa

//for循环
let platforms = ["macOS", "iOS", "tvOS", "watchOS", "VisionOS"]
for os in platforms {
    print("Swift can run in \(os)")
}

for i in 0...9 {
    for j in 0..<10{
//        print("\(i)\(j)")
    }
}

var lyric = "Haters gonna hate "
for _ in 1..<5 {
    lyric += "hate "
}
print(lyric)

//while循环
var loopNumber = 5
while loopNumber >= 0 {
    if loopNumber != 0 {
        print(loopNumber)
        loopNumber -= 1
    } else {
        print("Time out!")
        break
    }
}

var dices = 0
while dices != 12 {
    print("I rolled \(dices)")
    dices = Int.random(in: 1...12)
}
print("I rolled the max!")

//continue break
var demoArray1 = [Int]()

for i in 1...100_00 {
    if i.isMultiple(of: 1) && i.isMultiple(of: 2) {
        demoArray1.append(i)
        if demoArray1.count == 10 {
            break
        }
    }
}

print(demoArray1)

//Checkpoint3📋
//FizzBuzz案例：从1到100，3的倍数打印Fizz，5的倍数打印Buzz，3和5的倍数打印FizzBuzz，其他的打印真实数字。
for i in 1...100 {
    if i.isMultiple(of: 3) {
        print("Fizz")
        if i.isMultiple(of: 5) {
            print("FizzBuzz")
        }
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
