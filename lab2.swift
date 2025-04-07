import Foundation

print("Functions")

print("Exercises 1")
// Function to return the smaller of two integers
func minValue(_ a: Int, _ b: Int) -> Int {
    return a < b ? a : b
}

// Testing minValue function
print(minValue(10, 20))
print(minValue(5, 3))   
print(minValue(-2, -5))


print("Exercises 2")
// Function to return the last digit of an integer
func lastDigit(_ number: Int) -> Int {
    return abs(number) % 10
}

// Testing lastDigit function
print(lastDigit(1234)) 
print(lastDigit(-9876)) 
print(lastDigit(0))     


print("Exercises 3")
// Function to check if a is divisible by b
func divides(_ a: Int, _ b: Int) -> Bool {
    return a % b == 0
}

// Testing divides function
print(divides(7, 3))
print(divides(8, 4)) 


// Function to count the number of divisors of a number
func countDivisors(_ number: Int) -> Int {
    var count = 0
    for i in 1...number {
        if divides(number, i) {
            count += 1
        }
    }
    return count
}

// Testing countDivisors function
print(countDivisors(1)) 
print(countDivisors(10))
print(countDivisors(12))


// Function to determine if a number is prime
func isPrime(_ number: Int) -> Bool {
    return countDivisors(number) == 2
}

// Testing isPrime function
print(isPrime(3)) 
print(isPrime(8)) 
print(isPrime(13))


print("Closures ")


print("Exercises 1 ")

func smartBart(n: Int, closure: () -> Void) {
    for _ in 1...n {
        closure()
    }
}

// Testing smartBart function
smartBart(n: 3) {
    print("I will pass this course with best mark, because Swift is great!")
}

print("Exercises 2 ")

let numbers = [10, 16, 18, 30, 38, 40, 44, 50]
let multiplesOf4 = numbers.filter { $0 % 4 == 0 }
print("Multiples of 4:", multiplesOf4)

print("Exercises 3 ")

let largestNumber = numbers.reduce(Int.min) { max($0, $1) }
print("Largest number:", largestNumber) 

print("Exercises 4 ")

var strings = ["Gdansk", "University", "of", "Technology"]
let joinedString = strings.reduce("") { $0 + ($0.isEmpty ? "" : " ") + $1 }
print("Joined string:", joinedString) 

print("Exercises 5 ")

let moreNumbers = [1, 2, 3, 4, 5, 6]
let sumOfSquaresOfOdds = moreNumbers
    .filter { $0 % 2 != 0 } // Keep only odd numbers
    .map { $0 * $0 }        // Square each odd number
    .reduce(0, +)           // Sum them up

print("Sum of squares of odd numbers:", sumOfSquaresOfOdds)


print("Tuples ")

print("Exercises 1")

func minmax(_ a: Int, _ b: Int) -> (min: Int, max: Int) {
    return a < b ? (a, b) : (b, a)
}

// Testing minmax function
let result1 = minmax(10, 20)
print("Min:", result1.min, "Max:", result1.max) 

let result2 = minmax(50, -5)
print("Min:", result2.min, "Max:", result2.max)

print("Exercises 2")

var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of", "technology", "technology", "gdansk", "gdansk"]

// Create a dictionary to store the count of each string
var frequencyDict: [String: Int] = [:]

for word in stringsArray {
    frequencyDict[word, default: 0] += 1
}

// Convert dictionary to array of tuples
let countedStrings = frequencyDict.map { ($0.key, $0.value) }

// Sorting for better readability
let sortedCountedStrings = countedStrings.sorted { $0.0 < $1.0 }

print("Counted Strings:", sortedCountedStrings)



print("Enums")

print("Exercises 1")
enum Day: Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    func emojiForDay() -> String {
        switch self {
        case .monday:
            return "😩" 
        case .tuesday:
            return "😌"
        case .wednesday:
            return "😅" 
        case .thursday:
            return "😊" 
        case .friday:
            return "🥳" 
        case .saturday:
            return "😎" 
        case .sunday:
            return "🌞" 
        }
    }
}

let today = Day.tuesday
print("Today is \(today.rawValue) \(today) and the emoji is: \(today.emojiForDay())") 