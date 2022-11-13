import Foundation

func testQueue(){
    print("1")
    DispatchQueue.main.async {
        print("2")
        DispatchQueue.global(qos: .background).sync {
            print("3")
            DispatchQueue.main.sync {
                print("4")
                DispatchQueue.global(qos: .background).async {
                    print("5")
                }
                print("6")
            }
            print("7")
        }
        print("8")
    }
    print("9")
}


testQueue()

// В первоначальном варианте в консоль будут выведены числа 1 9 2 3, так как в 9-ой строке произойдёт блокировка основного потока

func testQueue2(){
    print("1")
    DispatchQueue.main.async {
        print("2")
        DispatchQueue.global(qos: .background).async {
            print("3")
            DispatchQueue.main.sync {
                print("4")
                DispatchQueue.global(qos: .background).sync {
                    print("5")
                }
                print("6")
            }
            print("7")
        }
        print("8")
    }
    print("9")
}

testQueue2()

// Для того, что бы измежать блокировки в 32-ой строке достаточно перевести sync -> async. При этом DispatchQueue.main.sync не будет блокировать основной поток, так как будет запущен из асинхронного фонового потока. При этом, в строке 36 можно async заменить на sync, в зависимости от необходимости порядка вывода чисел в консоль.
 
