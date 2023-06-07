
import SwiftUI

struct SentimentResponse: Codable {
    let score: Double
    let text: String
    let sentiment: String
}
