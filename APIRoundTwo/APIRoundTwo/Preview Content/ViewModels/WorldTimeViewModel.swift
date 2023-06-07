import SwiftUI

class WorldTimeViewModel: ObservableObject {
    @Published var worldTime: WorldTime?
    
    init() {
        fetchWorldTimeData()
    }
    
    func fetchWorldTimeData() {
        let city = "london".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let endpoint = "https://api.api-ninjas.com/v1/worldtime?city=\(city ?? "")"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (data: WorldTime?, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.worldTime = data
                }
            } else if let error = error {
                print("Error fetching world time data: \(error)")
            }
        }
    }
}

//class WorldTimeViewModel: ObservableObject {
//    @Published var worldTime: WorldTime?
//
//    init() {
//        fetchWorldTimeData()
//    }
//
//    func fetchWorldTimeData() {
//        let city = "london".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let url = URL(string: "https://api.api-ninjas.com/v1/worldtime?city=" + (city ?? ""))!
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let worldTime = try decoder.decode(WorldTime.self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.worldTime = worldTime
//                }
//            } catch {
//                print("Error decoding world time data: \(error)")
//            }
//        }
//
//        task.resume()
//    }
//}
