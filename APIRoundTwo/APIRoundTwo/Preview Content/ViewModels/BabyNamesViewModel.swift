import SwiftUI

class BabyNamesViewModel: ObservableObject {
    @Published var babyNames: [String] = []

    func fetchBabyNames() {
        let endpoint = "https://api.api-ninjas.com/v1/babynames?gender=neutral&limit=30"

        APIManager.shared.fetchData(endpoint: endpoint) { (babyNames: [String]?, error) in
            if let babyNames = babyNames {
                DispatchQueue.main.async {
                    self.babyNames = babyNames
                }
            } else if let error = error {
                print("Error fetching baby names: \(error)")
            }
        }
    }
}


//class BabyNamesViewModel: ObservableObject {
//    @Published var babyNames: [String] = []
//
//    func fetchBabyNames() {
//        let gender = "neutral".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        guard let url = URL(string: "https://api.api-ninjas.com/v1/babynames?gender=neutral&limit=30" + (gender ?? "")) else {
//            print("Invalid URL")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        let task = URLSession.shared.dataTask(with: request) { data, _, error in
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let decodedData = try decoder.decode([String].self, from: data)
//                    DispatchQueue.main.async {
//                        self.babyNames = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//        }
//        task.resume()
//    }
//}
