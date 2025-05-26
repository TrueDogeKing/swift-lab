import Foundation


enum Genre: String, Codable {
    case pop = "pop"
    case rock = "rock"
    case rap = "rap"
    case jazz = "jazz"
    case electronic = "electronic"
    
    // Custom initializer to handle case insensitivity during decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let genreString = try container.decode(String.self).lowercased()
        switch genreString {
        case "pop": self = .pop
        case "rock": self = .rock
        case "rap": self = .rap
        case "jazz": self = .jazz
        case "electronic": self = .electronic
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid genre value")
        }
    }
}

// MARK: - Structs
struct UserProfile: Codable {
    let id: Int
    let name: String
}

struct SpotifyFeedItem: Codable {
    let id: Int
    let user: UserProfile
    let timestamp: Date
    var likes: Int
    var views: Int
    var releaseDate: Date
    let genre: Genre
    let duration: Int  // Duration in seconds
    let artists: [String] // Array of artists
    let album: String  // New property for album name
    
    // Helper method for displaying feed info
    func displayFeedInfo() {
        print("🎵  Song ID: \(id)")
        print("🎙️  Artists: \(artists.joined(separator: ", "))")
        print("💿  Album: \(album)")  
        print("⏱️  Duration: \(formattedDuration(duration))")
        print("📅  Release Date: \(formattedDate(releaseDate))")
        print("🎸  Genre: \(genre.rawValue.capitalized)")
        print("👀  Views: \(formattedNumber(views))")
        print("❤️  Likes: \(formattedNumber(likes))\n")
        print(" ") // Extra blank line
    }
    
    // Format seconds to "mm:ss"
    private func formattedDuration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%d:%02d", minutes, remainingSeconds)
    }
    
    // Format date
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
    
    // Format numbers with "k" or "M"
    private func formattedNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1
        
        if number >= 1_000_000 {
            let formatted = numberFormatter.string(from: NSNumber(value: Double(number) / 1_000_000.0)) ?? ""
            return "\(formatted)M"
        } else if number >= 1000 {
            let formatted = numberFormatter.string(from: NSNumber(value: Double(number) / 1000.0)) ?? ""
            return "\(formatted)k"
        }
        return "\(number)"
    }
}

// MARK: - JSON Fallback Data
let fallbackJSONData = """
[
    {
        "id": 201,
        "user": { "id": 2, "name": "Spotify" },
        "timestamp": "2024-03-30T12:00:00Z",
        "likes": 7400000,
        "views": 13400000,
        "releaseDate": "2023-11-20T00:00:00Z",
        "genre": "pop",
        "duration": 182,
        "artists": ["Luna Ray", "Neon Echo"],
        "album": "Midnight Dreams"
    },
    {
        "id": 202,
        "user": { "id": 2, "name": "Spotify" },
        "timestamp": "2024-03-30T12:00:00Z",
        "likes": 5300000,
        "views": 9100000,
        "releaseDate": "2022-08-15T00:00:00Z",
        "genre": "rap",
        "duration": 205,
        "artists": ["MC Thunder", "Lil Nova"],
        "album": "Street Poetry"
    },
    {
        "id": 203,
        "user": { "id": 2, "name": "Spotify" },
        "timestamp": "2024-03-30T12:00:00Z",
        "likes": 9600000,
        "views": 17800000,
        "releaseDate": "2024-01-10T00:00:00Z",
        "genre": "rock",
        "duration": 225,
        "artists": ["The Wild Shadows"],
        "album": "Echoes of the Past"
    },
    {
        "id": 204,
        "user": { "id": 2, "name": "Spotify" },
        "timestamp": "2024-03-30T12:00:00Z",
        "likes": 4200000,
        "views": 7300000,
        "releaseDate": "2023-05-27T00:00:00Z",
        "genre": "jazz",
        "duration": 190,
        "artists": ["Ella Blue", "Sax Malone"],
        "album": "Moonlight Serenade"
    },
    {
        "id": 205,
        "user": { "id": 2, "name": "Spotify" },
        "timestamp": "2024-03-30T12:00:00Z",
        "likes": 5100000,
        "views": 9200000,
        "releaseDate": "2023-09-03T00:00:00Z",
        "genre": "electronic",
        "duration": 212,
        "artists": ["DJ Pulse", "Synthwave Voyager"],
        "album": "Neon Horizons"
    }
]

""".data(using: .utf8)!

// MARK: - Read JSON from File
func loadJSONFromFile(filename: String) -> Data {
    let fileManager = FileManager.default
    let currentPath = fileManager.currentDirectoryPath
    let fileURL = URL(fileURLWithPath: currentPath).appendingPathComponent(filename)
    
    do {
        return try Data(contentsOf: fileURL)
    } catch {
        print("⚠️ JSON file not found or unreadable, using fallback data.")
        return fallbackJSONData
    }
}

// MARK: - Decode and Display Data
let jsonData = loadJSONFromFile(filename: "songs.json")

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601

do {
    let songs = try decoder.decode([SpotifyFeedItem].self, from: jsonData)
    for song in songs {
        song.displayFeedInfo()
    }
} catch {
    print("❌ Failed to decode JSON: \(error)")
}

