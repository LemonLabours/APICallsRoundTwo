import SwiftUI

class CanadaMuslimHolidaysViewModel: ObservableObject {
    @Published var holidays: [Holiday] = []

    func fetchHolidays() {
        let endpoint = "https://api.api-ninjas.com/v1/holidays?country=CA&year=2021&type=muslim"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (holidays: [Holiday]?, error) in
            if let holidays = holidays {
                DispatchQueue.main.async {
                    self.holidays = holidays
                }
            } else if let error = error {
                print("Error fetching holidays: \(error)")
            }
        }
    }
}


//class CanadaMuslimHolidaysViewModel: ObservableObject {
//    @Published var holidays: [Holiday] = []
//
//    func fetchHolidays() {
//        guard let url = URL(string: "https://api.api-ninjas.com/v1/holidays?country=CA&year=2021&type=muslim") else {
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
//                    let decodedData = try decoder.decode([Holiday].self, from: data)
//                    DispatchQueue.main.async {
//                        self.holidays = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//        }.resume()
//    }
//}
