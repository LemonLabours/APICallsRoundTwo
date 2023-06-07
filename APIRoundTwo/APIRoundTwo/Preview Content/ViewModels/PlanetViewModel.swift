import SwiftUI

class PlanetViewModel: ObservableObject {
    @Published var planet: Planet?
    
    init() {
        fetchPlanetData()
    }
    
    func fetchPlanetData() {
        let endpoint = "https://api.api-ninjas.com/v1/planets?name=Neptune"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (data: [Planet]?, error) in
            if let planetData = data?.first {
                DispatchQueue.main.async {
                    self.planet = planetData
                }
            } else if let error = error {
                print("Error fetching planet data: \(error)")
            }
        }
    }
}
//class PlanetViewModel: ObservableObject {
//    @Published var planet: Planet?
//
//    init() {
//        fetchPlanetData()
//    }
//
//    func fetchPlanetData() {
//        let url = URL(string: "https://api.api-ninjas.com/v1/planets?name=Neptune")!
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let planetData = try decoder.decode([Planet].self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.planet = planetData.first
//                }
//            } catch {
//                print("Error decoding planet data: \(error)")
//            }
//        }
//
//        task.resume()
//    }
//}
