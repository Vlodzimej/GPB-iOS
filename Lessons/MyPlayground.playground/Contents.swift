import UIKit

var greeting = "Hello, playground"

var array = [1,2,3,4,5,6,7,8,9,10]


let test = 1...10

let array2 = array.enumerated().map { (index, item) in
    print(index)
    item * 10
}

array.enumerated().forEach { (index, item) in
    if item == 5 {
        array[index] = 50
    }
}

for (index, item) in array.enumerated() {
    if item == 5 {
        array[index] = 50
    }
}

print(array)

func testFunc(a: Int) -> Int {
    return a * 10
}


let str = ""

if str.isEmpty {
    print("IS EMPTY")
}

