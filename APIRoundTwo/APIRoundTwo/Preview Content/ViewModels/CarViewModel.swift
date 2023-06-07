import SwiftUI

class CarViewModel: ObservableObject {
    @Published var cars: [Car] = []

    func fetchCars() {
        let endpoint = "https://api.api-ninjas.com/v1/cars?model=camry"

        APIManager.shared.fetchData(endpoint: endpoint) { (cars: [Car]?, error) in
            if let cars = cars {
                DispatchQueue.main.async {
                    self.cars = cars
                }
            } else if let error = error {
                print("Error fetching cars: \(error)")
            }
        }
    }
}


//class CarViewModel: ObservableObject {
//    @Published var cars: [Car] = []
//
//    func fetchCars() {
//        guard let url = URL(string: "https://api.api-ninjas.com/v1/cars?model=camry") else {
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
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    let decodedData = try decoder.decode([Car].self, from: data)
//                    DispatchQueue.main.async {
//                        self.cars = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//        }.resume()
//    }
//}
