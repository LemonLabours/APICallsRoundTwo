import SwiftUI

class RandomUserViewModel: ObservableObject {
    @Published var randomUser: RandomUser?
    
    init() {
        fetchRandomUserData()
    }
    
    func fetchRandomUserData() {
        let endpoint = "https://api.api-ninjas.com/v1/randomuser"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (data: RandomUser?, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.randomUser = data
                }
            } else if let error = error {
                print("Error fetching random user data: \(error)")
            }
        }
    }
}
//class RandomUserViewModel: ObservableObject {
//    @Published var randomUser: RandomUser?
//
//    init() {
//        fetchRandomUserData()
//    }
//
//    func fetchRandomUserData() {
//        let url = URL(string: "https://api.api-ninjas.com/v1/randomuser")!
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let randomUser = try decoder.decode(RandomUser.self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.randomUser = randomUser
//                }
//            } catch {
//                print("Error decoding random user data: \(error)")
//            }
//        }
//
//        task.resume()
//    }
//}
