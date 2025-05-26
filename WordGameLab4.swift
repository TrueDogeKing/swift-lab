// 198157 Filip Pudlak 5na5
import Foundation

struct WordGuessGame {
    let categories: [String: [String]] = [
        "Cities": ["paris", "london", "berlin", "tokyo"],
        "Movies": ["avatar", "titanic", "inception", "joker"],
        "Books": ["dune", "it", "frankenstein", "dracula"]
    ]
    let levels: [String: Int] = ["Easy": 10, "Medium": 7, "Hard": 5]
    
    var chosenWord: String = ""
    var guessedWord: [Character]
    var attempts: Int
    var selectedCategory: String
    var selectedLevel: String
    
    init() {
        print("Choose a category: Cities, Movies, Books")
        selectedCategory = readLine() ?? "Cities"
        
        if let words = categories[selectedCategory] {
            chosenWord = words.randomElement() ?? "swift"
        } else {
            chosenWord = "swift"
        }
        
        print("Choose a level: Easy, Medium, Hard")
        selectedLevel = readLine() ?? "Easy"
        attempts = levels[selectedLevel] ?? 10
        
        guessedWord = Array(repeating: "_", count: chosenWord.count)
        
        print("\nYou selected category: \(selectedCategory)")
        print("You selected difficulty: \(selectedLevel)")
        
        startGame()
    }
    
    mutating func startGame() {
        while attempts > 0 && guessedWord.contains("_") {
            drawBoard()  // Calling drawBoard here to visualize game state
            print("Enter a letter:")
            
            if let input = readLine(), let letter = input.lowercased().first {
                checkLetter(letter)
            } else {
                print("Invalid input, try again.")
            }
        }
        
        if guessedWord.contains("_") {
            print("\nGame Over! The word was: \(chosenWord)")
        } else {
            print("\nCongratulations! You guessed the word: \(chosenWord)")
        }
    }
    
    mutating func checkLetter(_ letter: Character) {
        var found = false
        for (index, char) in chosenWord.enumerated() {
            if char == letter {
                guessedWord[index] = letter
                found = true
            }
        }
        
        if !found {
            attempts -= 1
            print("Wrong guess!")
        } else {
            print("Good guess!")
        }
    }
    
    // Draw board function to display the current state with spaces between underscores
    mutating func drawBoard() {
        let wordWithSpaces = guessedWord.map { String($0) }.joined(separator: " ") // Adds space between underscores
        print("\nWord to guess: \(wordWithSpaces)")
        print("Attempts left: \(attempts)")
    }
}

var game = WordGuessGame()
