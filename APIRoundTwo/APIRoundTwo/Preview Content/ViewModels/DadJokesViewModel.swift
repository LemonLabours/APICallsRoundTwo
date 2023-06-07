import SwiftUI

class DadJokesViewModel: ObservableObject {
    @Published var dadJokes: [DadJoke] = []

    func fetchDadJokes() {
        let endpoint = "https://api.api-ninjas.com/v1/dadjokes?limit=10"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (dadJokes: [DadJoke]?, error) in
            if let dadJokes = dadJokes {
                DispatchQueue.main.async {
                    self.dadJokes = dadJokes
                }
            } else if let error = error {
                print("Error fetching dad jokes: \(error)")
            }
        }
    }
}

//class DadJokesViewModel: ObservableObject {
//    @Published var dadJokes: [DadJoke] = []
//
//    func fetchDadJokes() {
//        guard let url = URL(string: "https://api.api-ninjas.com/v1/dadjokes?limit=10") else {
//            print("Invalid URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        URLSession.shared.dataTask(with: request) { data, _, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let decodedData = try decoder.decode([DadJoke].self, from: data)
//                    DispatchQueue.main.async {
//                        self.dadJokes = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//        }.resume()
//    }
//}
