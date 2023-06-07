
import Foundation
class SentimentViewModel: ObservableObject {
    @Published var sentimentResponse: SentimentResponse?

    func analyzeSentiment(text: String) {
        let endpoint = "https://api.api-ninjas.com/v1/sentiment?text=\(text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"

        APIManager.shared.fetchData(endpoint: endpoint) { (response: SentimentResponse?, error) in
            if let response = response {
                DispatchQueue.main.async {
                    self.sentimentResponse = response
                }
            } else if let error = error {
                print("Error analyzing sentiment: \(error)")
            }
        }
    }
}
