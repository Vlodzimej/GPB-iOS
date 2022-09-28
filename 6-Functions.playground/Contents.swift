// 1.Функция складывает две целочисленных переменных - отдает на выходе сумму
func addition(a: Int, b: Int) -> Int {
    a + b
}

let result = addition(a: 2, b: 3)
print(result)

// 2.Функция принимает кортеж из числа и строки приводит число к строке и ввыводит в консоль резуультат
func castToInt(value: (Int, String)) -> Int? {
    let a = value.0
    let b = Int(value.1)
    guard let b = b else { return nil }
    let result = a + b
    print(result)
    return result
}

castToInt(value: (10, "1"))

// 3.Функция принимает на вход опциональное замыкание и целое число, выполняет замыкание только. в случае если число больше 0
func process(closure: (() -> Void)?, value: Int) {
    guard value > 0, let closure = closure else { return }
    closure()
}

process(closure: { print("Test 1") }, value: 0)
process(closure: { print("Test 2") }, value: 1)

// 4.Функция принимает число на вход (год), проверить високосный ли он
func checkYear(year: Int) {
    if (year % 4) == 0 && (year % 100) != 0 || (year % 400) == 0 {
        print("Год \(year) високосный")
        return
    }
    print("Год \(year) не високосный")
}

checkYear(year: 2005)
