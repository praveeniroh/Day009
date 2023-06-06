import Cocoa

let names = ["Arya", "Rob", "John", "Sansa", "Eddard"]

let sortedNames = names.sorted { (name1, name2) -> Bool in
    return name1.count > name2.count
}

print(sortedNames)



//Trailing closure
func doSomething(withNumbers numbers: [Int], completion: () -> Void) {
    print("Performing an operation with the numbers: \(numbers)")
    completion()
}

doSomething(withNumbers: [1, 2, 3]) {
    print("Completion closure called")
}

//Multiple trailing clousre
func performOperation(a: Int, b: Int, success: () -> Void, failure: (Error) -> Void) {
    if a + b > 10 {
        success()
    } else {
        let error = NSError(domain: "com.example", code: 0, userInfo: nil)
        failure(error)
    }
}

performOperation(a: 5, b: 7) {
    print("Operation succeeded!")
} failure: { error in
    print("Operation failed with error: \(error)")
}


//shorthand parameter
let numbers = [1, 2, 3, 4, 5]

let doubledNumbers = numbers.map({ $0 * 2 })

print(doubledNumbers)

//function as parameter
func addNumbers(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyNumbers(a: Int, b: Int) -> Int {
    return a * b
}

func performOperation(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let result1 = performOperation(a: 5, b: 3, operation: addNumbers)
print(result1)

let result2 = performOperation(a: 5, b: 3, operation: multiplyNumbers)
print(result2)


//Check point 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
let evenNumber = {(array:[Int])->[Int] in
    return array.filter({$0.isMultiple(of: 2)})
}

let ascendingOrder = {(array:[Int])->[Int] in
    return array.sorted(by: <)
}

let luckyNumberString = {(array:[Int])->Void in
    array.forEach{element in
        print("\(element) is a lucky number")
    }
    
}

//evenNumber(luckyNumbers)
//ascendingOrder(luckyNumbers)
//luckyNumberString(luckyNumbers)


func checkpoint(evenNumberFilter:([Int])->[Int],ascendigOrder:([Int])->[Int],luckyString:([Int])->Void){
    print(evenNumberFilter(luckyNumbers))
    print(ascendigOrder(luckyNumbers))
    luckyString(luckyNumbers)
}

checkpoint{(array:[Int])->[Int] in
    return array.filter({$0.isMultiple(of: 2)})
}ascendigOrder: { (array:[Int])->[Int] in
    return array.sorted(by: <)
}luckyString: { (array:[Int])->Void in
    array.forEach{element in
        print("\(element) is a lucky number")
    }
}
