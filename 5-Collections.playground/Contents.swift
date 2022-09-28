import Foundation

// 1.Есть произвольный массив чисел, найти максимальное и минимальное число и поменять их местами
var numbers = [23, 2, 45, 37, 4, 34, 90]
print(numbers)

var min = 0, max = 0
var minIndex, maxIndex: Int?

for (index, number) in numbers.enumerated() {
    if min == 0 || number < min {
        min = Int(number)
        minIndex = index
    } else if number > max {
        max = Int(number)
        maxIndex = index
    }
}

if let minIndex = minIndex, let maxIndex = maxIndex {
    let tempValue = numbers[minIndex]
    numbers[minIndex] = numbers[maxIndex]
    numbers[maxIndex] = tempValue
}

print(numbers)

// 2.Есть два массива символов - собрать результирующее множество из символов, что повторяются в 2х массивах

let charArray1 = ["a", "b", "c", "d", "e"]
let charArray2 = ["c", "d", "e", "f", "g"]
var newCharArray = [String]()

charArray1.forEach { char in
    if charArray2.contains(char) {
        newCharArray.append(char)
    }
}

print(newCharArray)

// 3.Создать словарь с соотношением имя (ключ) пользователя - пароль (значение), получить из словаря все имена, пароли которых длиннее 10 символов

let passwords = [
    "User 1" : "somepass",
    "User 2" : "pass2",
    "User 3" : "longpassword",
    "User 4" : "difficultpassword",
    "User 5" : "12345678901",
    "User 6" : "verylongpassword",
    "User 7" : "1234567890",
    "User 8" : "lastpass"
]

let result = passwords.filter({ $0.value.count > 10 }).map({ $0.key })
print(result)
