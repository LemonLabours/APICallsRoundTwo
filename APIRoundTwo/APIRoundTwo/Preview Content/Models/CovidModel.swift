

import SwiftUI
struct CovidData: Codable {
    let country: String
    let region: String
    let cases: [String: CovidCase]
}

struct CovidCase: Codable {
    let total: Int
    let new: Int
}
