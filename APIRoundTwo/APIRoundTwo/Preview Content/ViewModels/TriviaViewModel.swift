import SwiftUI

class TriviaViewModel: ObservableObject {
    @Published var triviaItems: [TriviaItem] = []
    
    func fetchData() {
        let endpoint = "https://api.api-ninjas.com/v1/trivia?category=toysgames"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (data: [TriviaItem]?, error) in
            if let triviaItems = data {
                DispatchQueue.main.async {
                    self.triviaItems = triviaItems
                }
            } else if let error = error {
                print("Error fetching trivia data: \(error)")
            }
        }
    }
}

//class TriviaViewModel: ObservableObject {
//    @Published var triviaItems: [TriviaItem] = []
//
//    func fetchData() {
//        let apiKey = "42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV" // Replace with your actual API key
//        let urlString = "https://api.api-ninjas.com/v1/trivia?category=toysgames"
//
//        if let url = URL(string: urlString) {
//            var request = URLRequest(url: url)
//            request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
//
//            let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//                guard let data = data else { return }
//
//                do {
//                    let decoder = JSONDecoder()
//                    let triviaItems = try decoder.decode([TriviaItem].self, from: data)
//
//                    DispatchQueue.main.async {
//                        self?.triviaItems = triviaItems
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//
//            task.resume()
//        }
//    }
//}
