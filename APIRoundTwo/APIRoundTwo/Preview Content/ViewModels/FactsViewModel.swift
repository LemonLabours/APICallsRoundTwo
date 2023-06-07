import SwiftUI

class FactsViewModel: ObservableObject {
    @Published var facts: [Fact] = []

    func fetchData() {
        let endpoint = "https://api.api-ninjas.com/v1/facts?limit=10"
        APIManager.shared.fetchData(endpoint: endpoint) { (data: [Fact]?, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.facts = data
                }
            } else if let error = error {
                print("Error fetching facts: \(error)")
            }
        }
    }
}
//class FactsViewModel: ObservableObject {
//    @Published var facts: [Fact] = []
//
//    func fetchData() {
//        let url = URL(string: "https://api.api-ninjas.com/v1/facts?limit=10")!
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let decodedData = try decoder.decode([Fact].self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.facts = decodedData
//                }
//            } catch {
//                print("Error decoding data: \(error)")
//            }
//        }
//        task.resume()
//    }
//}
