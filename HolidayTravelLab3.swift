// 5 na 5 pkt Filip Pudlak 198157


import Foundation

// City Model
struct City {
    let id: Int
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    let keywords: [String]
    var locations: [Location]
}

// Location Model
struct Location {
    let id: Int
    let type: String
    let name: String
    let rating: Int
}

// Sample Data
var cities: [City] = [
    City(id: 1, name: "New York", description: "The Big Apple", latitude: 40.7128, longitude: -74.0060, keywords: ["party", "music", "business"], locations: [
        Location(id: 1, type: "restaurant", name: "Five Star Diner", rating: 5),
        Location(id: 21, type: "museum", name: "Metropolitan Museum of Art", rating: 5)
    ]),
    City(id: 2, name: "Los Angeles", description: "City of Angels", latitude: 34.0522, longitude: -118.2437, keywords: ["seaside", "party", "film"], locations: [
        Location(id: 2, type: "museum", name: "LA Art Museum", rating: 4),
        Location(id: 22, type: "restaurant", name: "Hollywood Steakhouse", rating: 5)
    ]),
    City(id: 3, name: "Paris", description: "City of Love", latitude: 48.8566, longitude: 2.3522, keywords: ["romantic", "history", "culture"], locations: [
        Location(id: 3, type: "monument", name: "Eiffel Tower", rating: 5),
        Location(id: 23, type: "restaurant", name: "Le Gourmet", rating: 5),
        Location(id: 30, type: "pub", name: "The Black Lion", rating: 4)
    ]),
    City(id: 4, name: "Tokyo", description: "Tech Capital", latitude: 35.682839, longitude: 139.759455, keywords: ["technology", "food", "culture"], locations: [
        Location(id: 4, type: "restaurant", name: "Sushi Heaven", rating: 5),
        Location(id: 24, type: "museum", name: "Samurai Museum", rating: 4)
    ]),
    City(id: 5, name: "London", description: "The British Capital", latitude: 51.5074, longitude: -0.1278, keywords: ["history", "music", "business"], locations: [
        Location(id: 5, type: "museum", name: "British Museum", rating: 5),
        Location(id: 25, type: "pub", name: "The Red Lion", rating: 1)
    ]),
    City(id: 6, name: "Sydney", description: "Harbor City", latitude: -33.8688, longitude: 151.2093, keywords: ["seaside", "nature", "sport"], locations: [
        Location(id: 6, type: "monument", name: "Sydney Opera House", rating: 2)
    ]),
    City(id: 7, name: "Dubai", description: "Luxury City", latitude: 25.276987, longitude: 55.296249, keywords: ["business", "luxury", "shopping"], locations: [
        Location(id: 7, type: "restaurant", name: "Skyview Lounge", rating: 3),
        Location(id: 26, type: "monument", name: "Burj Khalifa", rating: 1)
    ]),
    City(id: 8, name: "Berlin", description: "City of Culture", latitude: 52.52, longitude: 13.405, keywords: ["history", "music", "art"], locations: [
        Location(id: 8, type: "museum", name: "Berlin Wall Museum", rating: 4),
        Location(id: 27, type: "restaurant", name: "Currywurst Express", rating: 2)
    ]),
    City(id: 9, name: "Rio de Janeiro", description: "Carnival City", latitude: -22.9068, longitude: -43.1729, keywords: ["party", "seaside", "sport"], locations: [
        Location(id: 9, type: "monument", name: "Christ the Redeemer", rating: 2),
        Location(id: 28, type: "restaurant", name: "Samba Grill", rating: 4)
    ]),
    City(id: 10, name: "Rome", description: "The Eternal City", latitude: 41.9028, longitude: 12.4964, keywords: ["history", "culture", "food"], locations: [
        Location(id: 10, type: "monument", name: "Colosseum", rating: 4),
        Location(id: 29, type: "restaurant", name: "Trattoria da Luigi", rating: 5)
    ]),
    City(id: 11, name: "Moscow", description: "Russian Capital", latitude: 55.7558, longitude: 37.6173, keywords: ["history", "business", "culture"], locations: [Location(id: 11, type: "museum", name: "Red Square Museum", rating: 4)]),
    City(id: 12, name: "Toronto", description: "Cultural Melting Pot", latitude: 43.6532, longitude: -79.3832, keywords: ["business", "art", "food"], locations: [Location(id: 12, type: "restaurant", name: "CN Tower Restaurant", rating: 5)]),
    City(id: 13, name: "Beijing", description: "Ancient Meets Modern", latitude: 39.9042, longitude: 116.4074, keywords: ["history", "culture", "business"], locations: [Location(id: 13, type: "monument", name: "Great Wall", rating: 5)]),
    City(id: 14, name: "Singapore", description: "Garden City", latitude: 1.3521, longitude: 103.8198, keywords: ["business", "shopping", "luxury"], locations: [Location(id: 14, type: "restaurant", name: "Marina Bay Sands", rating: 5)]),
    City(id: 15, name: "Istanbul", description: "Bridge Between Continents", latitude: 41.0082, longitude: 28.9784, keywords: ["history", "culture", "food"], locations: [Location(id: 15, type: "museum", name: "Hagia Sophia", rating: 5)]),
    City(id: 16, name: "Bangkok", description: "Street Food Paradise", latitude: 13.7563, longitude: 100.5018, keywords: ["food", "party", "culture"], locations: [Location(id: 16, type: "restaurant", name: "Thai Orchid", rating: 5)]),
    City(id: 17, name: "Barcelona", description: "Architectural Gem", latitude: 41.3851, longitude: 2.1734, keywords: ["seaside", "art", "music"], locations: [Location(id: 17, type: "monument", name: "Sagrada Familia", rating: 5)]),
    City(id: 18, name: "Cape Town", description: "Nature at Its Best", latitude: -33.9249, longitude: 18.4241, keywords: ["nature", "seaside", "adventure"], locations: [Location(id: 18, type: "restaurant", name: "Mountain View Cafe", rating: 5)]),
    City(id: 19, name: "San Francisco", description: "Tech Hub", latitude: 37.7749, longitude: -122.4194, keywords: ["technology", "business", "culture"], locations: [Location(id: 19, type: "monument", name: "Golden Gate Bridge", rating: 5)]),
    City(id: 20, name: "Seoul", description: "K-Pop Capital", latitude: 37.5665, longitude: 126.978, keywords: ["music", "technology", "food"], locations: [Location(id: 20, type: "restaurant", name: "Bibimbap House", rating: 5)])
]

// Search functions
func searchCityByName(_ name: String) -> [City] {
    return cities.filter { $0.name.lowercased().contains(name.lowercased()) }
}

func searchCityByKeyword(_ keyword: String) -> [City] {
    return cities.filter { city in
        city.keywords.contains { $0.caseInsensitiveCompare(keyword) == .orderedSame }
    }
}

// Distance Calculation
func calculateDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
    let radius = 6371.0 // Earth radius in km
    let dLat = (lat2 - lat1) * .pi / 180.0
    let dLon = (lon2 - lon1) * .pi / 180.0
    let a = sin(dLat/2) * sin(dLat/2) + cos(lat1 * .pi / 180.0) * cos(lat2 * .pi / 180.0) * sin(dLon/2) * sin(dLon/2)
    let c = 2 * atan2(sqrt(a), sqrt(1-a))
    return radius * c
}

func findClosestAndFarthestCity(userLat: Double, userLon: Double) {
    guard let closestCity = cities.min(by: { calculateDistance(lat1: userLat, lon1: userLon, lat2: $0.latitude, lon2: $0.longitude) < calculateDistance(lat1: userLat, lon1: userLon, lat2: $1.latitude, lon2: $1.longitude) }) else { return }
    
    guard let farthestCity = cities.max(by: { calculateDistance(lat1: userLat, lon1: userLon, lat2: $0.latitude, lon2: $0.longitude) < calculateDistance(lat1: userLat, lon1: userLon, lat2: $1.latitude, lon2: $1.longitude) }) else { return }
    
    print("Closest city: \(closestCity.name)")
    print("Farthest city: \(farthestCity.name)")
}

func findTwoFarthestCities() {
    var maxDistance = 0.0
    var cityPair: (City, City)?
    
    for i in 0..<cities.count {
        for j in i+1..<cities.count {
            let distance = calculateDistance(lat1: cities[i].latitude, lon1: cities[i].longitude, lat2: cities[j].latitude, lon2: cities[j].longitude)
            if distance > maxDistance {
                maxDistance = distance
                cityPair = (cities[i], cities[j])
            }
        }
    }
    
    if let pair = cityPair {
        print("Two farthest cities: \(pair.0.name) and \(pair.1.name) with distance: \(maxDistance) km")
    }
}

// Advanced Search
func citiesWithFiveStarRestaurants() {
    let filteredCities = cities.filter { city in
        city.locations.contains { $0.type == "restaurant" && $0.rating == 5 }
    }
    
    print("\nCities with 5-star restaurants:")
    for city in filteredCities {
        let fiveStarRestaurants = city.locations.filter { $0.type == "restaurant" && $0.rating == 5 }
        print("\n- \(city.name):")
        for restaurant in fiveStarRestaurants {
            print("  * \(restaurant.name) - Rating: \(restaurant.rating)")
        }
    }
}

func locationsInCitySortedByRating(cityName: String) {
    if let city = cities.first(where: { $0.name.lowercased() == cityName.lowercased() }) {
        let sortedLocations = city.locations.sorted { $0.rating > $1.rating }
        print("Locations in \(city.name) sorted by rating:")
        for location in sortedLocations {
            print("- \(location.name) (\(location.type)) - Rating: \(location.rating)")
        }
    } else {
        print("City not found.")
    }
}

func citiesWithFiveStarLocations() {
    for city in cities {
        let fiveStarLocations = city.locations.filter { $0.rating == 5 }
        if !fiveStarLocations.isEmpty {
            print("City: \(city.name) has \(fiveStarLocations.count) five-star locations: \(fiveStarLocations.map { $0.name }.joined(separator: ", "))")
        }
    }
}

// Example usage
print(searchCityByName("New"))
print(searchCityByKeyword("party"))
findClosestAndFarthestCity(userLat: 51.5074, userLon: -0.1278) // London coordinates
findTwoFarthestCities()
print(citiesWithFiveStarRestaurants())
print(locationsInCitySortedByRating(cityName: "Paris")) // Should print locations sorted by rating for Paris

citiesWithFiveStarLocations()
