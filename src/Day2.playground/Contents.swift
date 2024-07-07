import Cocoa

//1️⃣ bool的两种取反方式
var isVerified = true
//1. !
print(!isVerified)
//2. .toggle()
print(isVerified.toggle())

//2️⃣ 字符串插值的两种方式
//1. + （两边类型必须相同）
let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
//2. \() 类型随意
let name = "Taylor"
let age = 21
let message = "Hello, my name is \(name). I'm \(age) years old."
print(message)

//📋CheckPoint1:摄氏度华氏度的转换
let celsius = 26.0
let fahrenheit = celsius * 9 / 5 + 32
print(celsius)
print(fahrenheit)
