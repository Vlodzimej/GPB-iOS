import MapKit

//В Playground реализуйте некоторый базовый класс из выбранной вами области описания (тематики).
//Добавьте в него свойства и методы, а также несколько инициализаторов. Класс должен содержать свойства и методы разной области видимости (private, fileprivate, internal или public)
//Создайте несколько классов-наследников. Переопределите при необходимости свойства и методы родителя. А также добавьте свои.
//В основном пространстве Playground создайте функцию для демонстрации полиморфизма.

// Базовый класс
class BaseObject {

    private let startDate: Date
    
    fileprivate var requestCount: Int = 0
    
    internal let subname: String?
    
    let name: String
    let location: CLLocation?
    
    init(name: String, location: CLLocation?, startDate: Date, subname: String? = nil) {
        self.name = name
        self.location = location
        self.startDate = startDate
        self.subname = subname
    }
    
    internal func increaseRequestCount() {
        requestCount += 1
    }
    
    func getStringDate() -> String {
        increaseRequestCount()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: startDate)
    }
}

// Наследник
class Building: BaseObject {
    
    private let buildDate: Date
    
    let address: String
    
    init(name: String, location: CLLocation?, startDate: Date, buildDate: Date, address: String) {
        self.buildDate = buildDate
        self.address = address
        super.init(name: name, location: location, startDate: startDate)
    }
    
    override func getStringDate() -> String {
        increaseRequestCount()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: buildDate)
    }
}

// Второй наследник
class House: Building {
    var ownerName: String {
        didSet {
            print("\(ownerName) bought the house on the \(address)")
        }
    }
    
    init(location: CLLocation?, address: String, ownerName: String) {
        self.ownerName = ownerName
        super.init(name: "House info", location: location, startDate: Date.distantPast, buildDate: Date.now, address: address)
    }

    convenience init(address: String, ownerName: String) {
        self.init(location: nil, address: address, ownerName: ownerName)
    }
    
    func changeOwnerName(newOwnerName: String) {
        ownerName = newOwnerName
    }
}

// Полиморфизм
func getConstructionDate(of baseObject: BaseObject) -> String {
    return baseObject.getStringDate()
}

let newHouse: House = .init(address: "18744 BALTIC PL AURORA CO 80013-7980", ownerName: "John")
let constructionDate = getConstructionDate(of: newHouse)

print("Date:", constructionDate)
print("Request count:", newHouse.requestCount)
