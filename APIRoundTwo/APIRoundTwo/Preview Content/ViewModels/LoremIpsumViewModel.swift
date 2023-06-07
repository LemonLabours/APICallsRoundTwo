

import SwiftUI


class LoremIpsumViewModel: ObservableObject {
    @Published var loremIpsumText: String = ""
    
    init(paragraphs: Int) {
        fetchLoremIpsumData(paragraphs: paragraphs)
    }
    
    func fetchLoremIpsumData(paragraphs: Int) {
        let paragraphsString = "\(paragraphs)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let endpoint = "https://api.api-ninjas.com/v1/loremipsum?paragraphs=\(paragraphsString)"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (data: LoremIpsumResponse?, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.loremIpsumText = data.text
                }
            } else if let error = error {
                print("Error fetching Lorem Ipsum data: \(error)")
            }
        }
    }
}


//class LoremIpsumViewModel: ObservableObject {
//    @Published var loremIpsumText: String = ""
//
//    init(paragraphs: Int) {
//        fetchLoremIpsumData(paragraphs: paragraphs)
//    }
//
//    func fetchLoremIpsumData(paragraphs: Int) {
//        let paragraphsString = "\(paragraphs)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let urlString = "https://api.api-ninjas.com/v1/loremipsum?paragraphs=\(paragraphsString!)"
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
//                let response = try decoder.decode(LoremIpsumResponse.self, from: data)
//
//                DispatchQueue.main.async {
//                    self?.loremIpsumText = response.text
//                }
//            } catch {
//                print("Error decoding Lorem Ipsum data: \(error)")
//            }
//        }
//
//        task.resume()
//    }
//}
