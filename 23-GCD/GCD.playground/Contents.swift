import Foundation

// 1. Исследуйте код ниже и напишите, какие цифры должны вывестись в консоль, обьясните своими словами,
// почему именно такая последовательность по шагам.
func testQueue() {
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

//testQueue()

// Ответ: В первоначальном варианте в консоль будут выведены числа 1 9 2 3, так как в 9-ой строке произойдёт блокировка основного потока

// 2. Создайте свою сериюную очередь и замените в примере ей DispatchQueue.main, создайте свою конкурентную очередь и заменить ей
// DispatchQueue.global(qos: .background). Какой будет результат? Всегда ли будет одинаковым И почему?
func testQueue2() {
    let serialQueue = DispatchQueue(label: "gcdtest.serial-queue")
    let concurrentQueue = DispatchQueue(label: "gcdtest.concurrent-queue", attributes: .concurrent)
    print("1")
    serialQueue.async {
        print("2")
        concurrentQueue.sync {
            print("3")
            serialQueue.sync {
                print("4")
                concurrentQueue.async {
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

//testQueue2()

// Ответ: Вывод цифр 1 и 9 выполняется на главной очереди(main). Последующие цифры выводятся асинхронно в отдельной последовательной очереди(serial Queue).
// В данной реализации порядок вывода цифры после 1 будет непредсказуемый, так как отсуствует синхронизация между main и seriaQueue.

// 3. Какой по номеру надо поменять sync/sync чтобы не возникало дедлока в обоих случаях
func testQueue3() {
    let serialQueue = DispatchQueue(label: "gcdtest.serial-queue")
    let concurrentQueue = DispatchQueue(label: "gcdtest.concurrent-queue", attributes: .concurrent)
    print("1")
    serialQueue.async {
        print("2")
        concurrentQueue.async {
            print("3")
            serialQueue.sync {
                print("4")
                concurrentQueue.sync {
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

//testQueue3()

// Ответ: Для того, что бы избежать блокировки в 65-ой строке достаточно перевести sync -> async. При этом serialQueue.sync не будет вызывать
// блокировку, так как будет запущен из асинхронного фонового потока.

//4. Как можно сделать в примере, чтобы очередь превратилась из конкурентной в серийную, подправте пример не исправляя создания самой очереди
func testQueue4() {
    let serialQueue = DispatchQueue(label: "gcdtest.serial-queue")
    let concurrentQueue = DispatchQueue(label: "gcdtest.concurrent-queue", attributes: .concurrent)
    print("1")
    serialQueue.async {
        print("2")
        concurrentQueue.async {
            print("3")
            serialQueue.sync {
                print("4")
                concurrentQueue.sync {
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

//testQueue4()

//Ответ: В строке 97 concurrentQueue.async заменить на concurrentQueue.sync


