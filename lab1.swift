import Foundation

print("Strings and Text")
let firstName = "Filip"
let lastName = "Pudlak"


let name = "\(firstName) \(lastName)" // "FirstName LastName"


print("Exercise 1")
var int1=5
var int2=10

var sum=int1+int2
print("\(int1) + \(int2) = \(sum)")


print("Exercise 2")

let uczelnia = "Gdansk University of Technology"

let modifiedString = uczelnia.replacingOccurrences(of: "n", with: "⭐️")


print(modifiedString)


print("Exercise 3")
let reversedName = String(name.reversed())

print("\(name) -> \(reversedName)")


print("Control Flow")
print("Exercise 1")

for _ in 1...11 {
  print("I will pass this course with best mark, because Swift is great!")
}
print("Exercise 2")

var n=5
for i in 1..<n+1 {
    print(i*i)
}

print("Exercise 3")
let N = 4

for _ in 1...N {
    for _ in 1...N {
        print("@", terminator: "")
    }
    print() // Move to the next line after each row
}

print("Arrays")

print("Exercise 1")
var numbers = [5, 10, 20, 15, 80, 13]

if let maxNumber = numbers.max() {
    print("The maximum value is \(maxNumber)")
} else {
    print("The array is empty.")
}

print("Exercise 2")
var numbersArr = [5, 10, 20, 15, 80, 13]

// Reverse the array and print the numbers with commas
for (index, number) in numbersArr.reversed().enumerated() {
    if index < numbersArr.count - 1 {
        print("\(number), ", terminator: "")
    } else {
        print(number) // no comma after the last number
    }
}


print("Exercise 3")
var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]

// Create a Set to automatically remove duplicates
let uniqueSet = Set(allNumbers)

// Convert back to Array (if you want)
let uniqueNumbers = Array(uniqueSet)

// Print result
print("unique = \(uniqueNumbers.sorted())")


print("Sets")

print("Exercise 1")
var number = 10
var divisors: Set<Int> = []

for i in 1...number {
    if number % i == 0 {
        divisors.insert(i)
    }
}

// Print the divisors sorted
print("divisors = \(divisors.sorted())")

print("Dictionaries ")

print("Exercise 1")
var flights: [[String: String]] = [
    [
        "flightNumber" : "AA8025",
        "destination" : "Copenhagen"
    ],
    [
        "flightNumber" : "BA1442",
        "destination" : "New York"
    ],
    [
        "flightNumber" : "BD6741",
        "destination" : "Barcelona"
    ]
]

let flightNumbers = flights.map { $0["flightNumber"]! }

print(flightNumbers)

print("Exercise 2")

var names = ["Hommer", "Lisa", "Bart"]

let fullName = names.map { ["firstName": $0, "lastName": "Simpson"] }

print(fullName)








