
import SwiftUI

struct GeocodingResponse: Codable, Hashable {
    let name: String
    let latitude: Double
    let longitude: Double
    let country: String
    let state: String
}
