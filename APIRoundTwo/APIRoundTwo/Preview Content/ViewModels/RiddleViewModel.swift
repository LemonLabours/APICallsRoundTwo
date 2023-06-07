
import SwiftUI


class RiddleViewModel: ObservableObject {
    @Published var riddles: [Riddle] = []
    
    init() {
        fetchRiddles()
    }
    
    func fetchRiddles() {
        let endpoint = "https://api.api-ninjas.com/v1/riddles"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (data: [Riddle]?, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.riddles = data
                }
            } else if let error = error {
                print("Error fetching riddles data: \(error)")
            }
        }
    }
}


//class RiddleViewModel: ObservableObject {
//    @Published var riddles: [Riddle] = []
//
//    init() {
//        fetchRiddles()
//    }
//
//    func fetchRiddles() {
//        let url = URL(string: "https://api.api-ninjas.com/v1/riddles")!
//        var request = URLRequest(url: url)
//        request.setValue("YOUR_API_KEY", forHTTPHeaderField: "X-Api-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let riddles = try decoder.decode([Riddle].self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.riddles = riddles
//                }
//            } catch {
//                print("Error decoding riddles data: \(error)")
//            }
//        }
//
//        task.resume()
//    }
//}
