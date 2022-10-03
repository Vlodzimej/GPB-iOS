// 1.Функция, принимающая функцию как параметр
func function1(completion: () -> Void) {
    print("Execute completion function")
    completion()
}

function1() {
    print("Function executed")
}

// 2.Функция с несколькими замыканиями
func functionWithClosures(a: () -> Double, b: () -> Double) -> Double {
    let aResult = a()
    let bResult = b()
    return aResult / bResult
}

let result = functionWithClosures(a: { 2 + 3 }, b: { 1 + 1 })

// 3.Функция с autoclosure
var users = ["User1", "User2"]
func userServe(action: @autoclosure () -> Int) {
    print("Total count: ", addUser())
}
print("Total count: ", users)

func addUser() -> Int {
    users.append("User3")
    return users.count
}

userServe(action: addUser())

// 4.Использование внутренних функций
var entities = ["String1", "String2"]
func addNewEntity() {
    let newEntityName = generateName(totalCount: entities.count)
    entities.append(newEntityName)
    
    func generateName(totalCount: Int) -> String {
        let numb = totalCount + 1
        return "String\(numb)"
    }
}

addNewEntity()
print(entities)

// 5.Дженерик-функция с условием
func castToInt<T>(value: T) -> Int? where T: StringProtocol {
    guard let result = Int(value) else { return nil }
    print(result)
    return result
}

castToInt(value: "Test")
castToInt(value: "123")
