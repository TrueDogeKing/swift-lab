
import Foundation

class Player {
    var name: String
    var symbol: String
    var isAI: Bool
    
    init(name: String, symbol: String, isAI: Bool = false) {
        self.name = name
        self.symbol = symbol
        self.isAI = isAI
    }
}

enum Difficulty {
    case easy, medium
}

class TicTacToe {
    var board: [String] = Array(repeating: " ", count: 9)
    var currentPlayer: Player
    var otherPlayer: Player
    var difficulty: Difficulty
    
    init(player1: Player, player2: Player, difficulty: Difficulty = .easy) {
        self.currentPlayer = player1
        self.otherPlayer = player2
        self.difficulty = difficulty
    }

    func drawBoard() {
        print("""
              \(board[0]) | \(board[1]) | \(board[2])
              ---------
              \(board[3]) | \(board[4]) | \(board[5])
              ---------
              \(board[6]) | \(board[7]) | \(board[8])
              """)
    }

    func play() {
        while true {
            drawBoard()
            if currentPlayer.isAI {
                print("AI (\(currentPlayer.symbol)) is making a move...")
                aiMove(for: currentPlayer)
            } else {
                print("\(currentPlayer.name)'s turn (\(currentPlayer.symbol)). Choose position (0-8):")
                if let input = readLine(), let pos = Int(input), pos >= 0, pos < 9, board[pos] == " " {
                    board[pos] = currentPlayer.symbol
                } else {
                    print("Invalid move, try again.")
                    continue
                }
            }

            if checkWin(for: currentPlayer.symbol) {
                drawBoard()
                print("\(currentPlayer.name) wins!")
                break
            }

            if !board.contains(" ") {
                drawBoard()
                print("It's a draw!")
                break
            }

            swapPlayers()
        }
    }

    func checkWin(for symbol: String) -> Bool {
        let winPatterns = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]
        ]
        return winPatterns.contains { $0.allSatisfy { board[$0] == symbol } }
    }

    func swapPlayers() {
        (currentPlayer, otherPlayer) = (otherPlayer, currentPlayer)
    }

    func reset() {
        board = Array(repeating: " ", count: 9)
    }

    func aiMove(for player: Player) {
        switch difficulty {
        case .easy:
            let available = board.enumerated().filter { $0.element == " " }.map { $0.offset }
            if let move = available.randomElement() {
                board[move] = player.symbol
            }
        case .medium:
            if let winMove = findWinningMove(for: player.symbol) {
                board[winMove] = player.symbol
            } else if let blockMove = findWinningMove(for: otherPlayer.symbol) {
                board[blockMove] = player.symbol
            } else {
                let available = board.enumerated().filter { $0.element == " " }.map { $0.offset }
                if let move = available.randomElement() {
                    board[move] = player.symbol
                }
            }
        }
    }

    func findWinningMove(for symbol: String) -> Int? {
        let winPatterns = [
            [0,1,2], [3,4,5], [6,7,8],
            [0,3,6], [1,4,7], [2,5,8],
            [0,4,8], [2,4,6]
        ]
        for pattern in winPatterns {
            let values = pattern.map { board[$0] }
            if values.filter({ $0 == symbol }).count == 2 && values.contains(" ") {
                if let emptyIndex = pattern.first(where: { board[$0] == " " }) {
                    return emptyIndex
                }
            }
        }
        return nil
    }
}

// MARK: - Game Menu

func startGame() {
    print("Welcome to Tic Tac Toe in Swift Playground!")
    print("Choose difficulty: (1) Easy, (2) Medium")
    
    let diffInput = readLine()
    let difficulty: Difficulty = (diffInput == "2") ? .medium : .easy

    let human = Player(name: "You", symbol: "X")
    let ai = Player(name: "AI", symbol: "O", isAI: true)

    let game = TicTacToe(player1: human, player2: ai, difficulty: difficulty)

    var playAgain = "y"
    while playAgain.lowercased() == "y" {
        game.reset()
        game.play()
        print("Play again? (y/n):")
        playAgain = readLine() ?? "n"
    }

    print("Thanks for playing!")
}

// Start the game
startGame()
