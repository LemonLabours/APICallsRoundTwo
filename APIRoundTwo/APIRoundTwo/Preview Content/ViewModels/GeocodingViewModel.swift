import SwiftUI

class GeocodingViewModel: ObservableObject {
    @Published var locations: [GeocodingResponse] = []
    
    init(city: String, country: String) {
        fetchGeocodingData(city: city, country: country)
    }
    
    func fetchGeocodingData(city: String, country: String) {
        let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let encodedCountry = country.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let endpoint = "https://api.api-ninjas.com/v1/geocoding?city=\(encodedCity)&country=\(encodedCountry)"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (data: [GeocodingResponse]?, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.locations = data
                }
            } else if let error = error {
                print("Error fetching geocoding data: \(error)")
            }
        }
    }
}


//class GeocodingViewModel: ObservableObject {
//    @Published var locations: [GeocodingResponse] = []
//
//    init(city: String, country: String) {
//        fetchGeocodingData(city: city, country: country)
//    }
//
//    func fetchGeocodingData(city: String, country: String) {
//        let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let encodedCountry = country.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let urlString = "https://api.api-ninjas.com/v1/geocoding?city=\(encodedCity)&country=\(encodedCountry)"
//
//        guard let url = URL(string: urlString) else { return }
//
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let response = try decoder.decode([GeocodingResponse].self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.locations = response
//                }
//            } catch {
//                print("Error decoding Geocoding data: \(error)")
//            }
//        }
//
//        task.resume()
//    }
//}
