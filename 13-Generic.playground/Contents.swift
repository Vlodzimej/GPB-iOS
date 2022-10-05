class Stack<T> {
    private var items = [T]()
    
    var isEmpty: Bool {
        get {
            items.count == 0
        }
    }
    
    var size: Int {
        get {
            items.count
        }
    }
    
    func peek() -> T? {
        guard let topElement = items.first else { return nil }
        return topElement
    }
    
    func pop() -> T {
        return items.removeFirst()
    }
  
    func push(_ element: T) {
        items.insert(element, at: 0)
    }
}

var stack = Stack<String>()

print("Initial isEmpty value: ", stack.isEmpty)

stack.push("Test A")
stack.push("Test B")
stack.push("Test C")

var peekResult = stack.peek()
print("Peek result: ", peekResult)

stack.pop()
var popResult = stack.pop()
print("After 2 times pop: ", popResult)

print("Result stack size: ", stack.size)
print("Result isEmpty value", stack.isEmpty)
