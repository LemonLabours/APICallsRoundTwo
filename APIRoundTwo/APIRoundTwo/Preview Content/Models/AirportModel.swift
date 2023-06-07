import SwiftUI

struct Airport: Codable {
    let icao: String
    let iata: String
    let name: String
    let city: String
    let region: String
    let country: String
    let latitude: String
    let longitude: String
    let timezone: String
}
