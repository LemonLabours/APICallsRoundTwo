import SwiftUI

class QuotesViewModel: ObservableObject {
    @Published var quotes: [Quote] = []

    func fetchQuotes() {
        let endpoint = "https://api.api-ninjas.com/v1/quotes?category=learning&limit=50"

        APIManager.shared.fetchData(endpoint: endpoint) { (quotes: [Quote]?, error) in
            if let quotes = quotes {
                DispatchQueue.main.async {
                    self.quotes = quotes
                }
            } else if let error = error {
                print("Error fetching quotes: \(error)")
            }
        }
    }
}

//    class QuotesViewModel: ObservableObject {
//        @Published var quotes: [Quote] = []
//
//        func fetchQuotes() {
//            guard let url = URL(string: "https://api.api-ninjas.com/v1/quotes?category=learning&limit=50") else {
//                print("Invalid URL")
//                return
//            }
//
//            var request = URLRequest(url: url)
//            request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//            URLSession.shared.dataTask(with: request) { data, _, error in
//                if let error = error {
//                    print("Error: \(error)")
//                    return
//                }
//
//                if let data = data {
//                    do {
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        let decodedData = try decoder.decode([Quote].self, from: data)
//                        DispatchQueue.main.async {
//                            self.quotes = decodedData
//                        }
//                    } catch {
//                        print("Error decoding JSON: \(error)")
//                    }
//                }
//            }.resume()
//        }
//    }
