
import SwiftUI

class CelebrityViewModel: ObservableObject {
    @Published var celebrity: Celebrity?
    
    func fetchData(for name: String) {
        let endpoint = "https://api.api-ninjas.com/v1/celebrity?name=\(name)"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (data: [Celebrity]?, error) in
            if let celebrityData = data?.first {
                DispatchQueue.main.async {
                    self.celebrity = celebrityData
                }
            } else if let error = error {
                print("Error fetching celebrity data: \(error)")
            }
        }
    }
}


//class CelebrityViewModel: ObservableObject {
//    @Published var celebrity: Celebrity?
//
//    func fetchData(for name: String) {
//        let apiKey = "42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV"
//        let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://api.api-ninjas.com/v1/celebrity?name=\(encodedName)"
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
//                    let celebrities = try decoder.decode([Celebrity].self, from: data)
//
//                    DispatchQueue.main.async {
//                        self?.celebrity = celebrities.first
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
