import Foundation

// MARK: - Moomin Character
struct MoominCharacter {
    var name: String
    var health: Int
    var friendship: Int
    var level: Int

    mutating func levelUp() {
        level += 1
        health += 10
        friendship += 5
        print("\(name) leveled up! 🌟 Now at level \(level).")
    }

    var isHealthy: Bool {
        return health > 0
    }

    func stats() {
        print("""
        ----------------------
        \(name)'s Stats:
        💖 Health: \(health)
        🤝 Friendship: \(friendship)
        🧭 Level: \(level)
        ----------------------
        """)
    }
}

// MARK: - CreatureType Enum
enum CreatureType: String {
    case Friendly, Curious, Mysterious
}

// MARK: - Creature
struct Creature {
    let name: String
    var mood: Int    // 1 = Calm, 3 = Hostile
    var patience: Int
    let type: CreatureType

    var isCalm: Bool {
        return patience <= 0
    }

    static func randomEncounter() -> Creature {
        let creatures = [
            ("The Groke", 3, 20, CreatureType.Mysterious),
            ("Hattifattener", 2, 15, CreatureType.Curious),
            ("Stinky", 2, 10, CreatureType.Friendly)
        ]

        let random = creatures.randomElement()!
        return Creature(name: random.0, mood: random.1, patience: random.2, type: random.3)
    }

    func description() {
        print("""
        🌫️ Encounter!
        A wild \(name) appears!
        Mood level: \(mood)
        Patience: \(patience)
        Type: \(type.rawValue)
        """)
    }
}

// MARK: - Items
struct Item {
    let name: String
    let effect: () -> Void
}

// MARK: - Journal
var journal: [String] = []

// MARK: - Game Functions

func talkToCreature(_ creature: inout Creature, with moomin: MoominCharacter) -> Bool {
    creature.patience -= moomin.friendship
    journal.append("\(moomin.name) tried to talk to \(creature.name), reducing patience to \(creature.patience).")
    print("🗣️ You talk to \(creature.name).")
    return creature.isCalm
}

func runAway(from creature: Creature, moomin: inout MoominCharacter) -> Bool {
    if Bool.random() {
        journal.append("\(moomin.name) successfully ran away from \(creature.name).")
        print("🏃 You escaped successfully!")
        return true
    } else {
        moomin.health -= 5
        journal.append("\(moomin.name) failed to escape and got spooked by \(creature.name). Lost 5 health.")
        print("😱 Failed to run! \(creature.name) spooked you. -5 health.")
        return false
    }
}

func handleEncounter(moomin: inout MoominCharacter) -> Bool {
    var creature = Creature.randomEncounter()
    creature.description()

    while moomin.isHealthy && !creature.isCalm {
        moomin.stats()
        print("Choose your action: 1 - Talk 🤝, 2 - Run 🏃")
        guard let choice = readLine(), let action = Int(choice) else {
            print("Invalid input.")
            continue
        }

        switch action {
        case 1:
            let success = talkToCreature(&creature, with: moomin)
            if success {
                print("🎉 \(creature.name) is calm now!")
                moomin.levelUp()
                return true
            } else {
                moomin.health -= creature.mood * 2
                print("😡 \(creature.name) is still agitated! You lost \(creature.mood * 2) health.")
            }
        case 2:
            let escaped = runAway(from: creature, moomin: &moomin)
            if escaped { return true }
        default:
            print("❌ Invalid choice.")
        }
    }

    if !moomin.isHealthy {
        print("💀 \(moomin.name) is too exhausted to continue.")
        return false
    }
    return true
}

// MARK: - Game Setup

var moomin = MoominCharacter(name: "Moomintroll", health: 30, friendship: 10, level: 1)
moomin.stats()

// Day/Night Cycle Toggle
var isDay = true
var turnCounter = 0

// Game Loop
gameLoop: while moomin.isHealthy {
    print("\n=== New Encounter ===")
    print(isDay ? "🌞 It's daytime in Moominvalley." : "🌙 It's nighttime in Moominvalley.")
    
    let survived = handleEncounter(moomin: &moomin)
    if !survived { break gameLoop }

    turnCounter += 1
    if turnCounter % 2 == 0 {
        isDay.toggle()
    }

    print("\nContinue exploring? (y/n)")
    if let response = readLine(), response.lowercased() != "y" {
        break
    }
}

// MARK: - Game Over & Journal
print("\n📓 Moominvalley Journal:")
journal.forEach { print("- \($0)") }

print("\n🎮 Game Over. Thank you for visiting Moominvalley!")
