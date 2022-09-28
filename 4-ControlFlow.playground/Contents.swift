import Foundation

// Размер массива случайных значений
let count = 10
// Массив случайных значений
let numbers = (1...count).map { _ in arc4random_uniform(100) }
print(numbers)

/// Поиск индекса первого повторяющегося числа в массиве
func findFirstDuplicateIndex(in numbers: [UInt32]) -> Int {
    var tempArray = [UInt32]()
    for number in numbers {
        if let index = tempArray.firstIndex(of: number) {
            return index
        } else {
            tempArray.append(number)
        }
    }
    return -1
}

let result = findFirstDuplicateIndex(in: numbers)

if result > -1 {
    print("Индекс первого повторяющегося числа в массиве равен ", result)
} else {
    print("Повторяющееся число не найдено")
}
