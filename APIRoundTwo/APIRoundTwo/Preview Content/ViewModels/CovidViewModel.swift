import SwiftUI
class CovidViewModel: ObservableObject {
    @Published var covidData: [CovidData] = []

    func fetchData() {
        let country = "kuwait"
        let endpoint = "https://api.api-ninjas.com/v1/covid19?country=" + country
        APIManager.shared.fetchData(endpoint: endpoint) { (data: [CovidData]?, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.covidData = data
                }
            } else if let error = error {
                print("Error fetching COVID-19 data: \(error)")
            }
        }
    }
}
//class CovidViewModel: ObservableObject {
//    @Published var covidData: [CovidData] = []
//
//    func fetchData() {
//        let country = "kuwait".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let url = URL(string: "https://api.api-ninjas.com/v1/covid19?country=" + country!)!
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
//            guard let data = data else { return }
//
//            do {
//                let decoder = JSONDecoder()
//                let decodedData = try decoder.decode([CovidData].self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.covidData = decodedData
//                }
//            } catch {
//                print("Error decoding data: \(error)")
//            }
//        }
//        task.resume()
//    }
//}
