
import SwiftUI
class RandomWordViewModel: ObservableObject {
    @Published var randomWord: RandomWord?

    func fetchRandomWord() {
        let endpoint = "https://api.api-ninjas.com/v1/randomword"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (randomWord: RandomWord?, error) in
            if let randomWord = randomWord {
                DispatchQueue.main.async {
                    self.randomWord = randomWord
                }
            } else if let error = error {
                print("Error fetching random word: \(error)")
            }
        }
    }
}
//class RandomWordViewModel: ObservableObject {
//    @Published var randomWord: RandomWord?
//
//    func fetchRandomWord() {
//        guard let url = URL(string: "https://api.api-ninjas.com/v1/randomword") else {
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
//                    let decodedData = try decoder.decode(RandomWord.self, from: data)
//                    DispatchQueue.main.async {
//                        self.randomWord = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//        }
//        task.resume()
//    }
//}
