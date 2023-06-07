import SwiftUI

class ExerciseViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    
    func fetchExercises() {
        let muscle = "biceps".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let endpoint = "https://api.api-ninjas.com/v1/exercises?muscle=\(muscle ?? "")"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (exercises: [Exercise]?, error) in
            if let exercises = exercises {
                DispatchQueue.main.async {
                    self.exercises = exercises
                }
            } else if let error = error {
                print("Error fetching exercise data: \(error)")
            }
        }
    }
}
//class ExerciseViewModel: ObservableObject {
//    @Published var exercises: [Exercise] = []
//
//    func fetchExercises() {
//        let muscle = "biceps".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=\(muscle ?? "")")!
//        var request = URLRequest(url: url)
//        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            guard let data = data else {
//                print("Data is empty")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let exercises = try decoder.decode([Exercise].self, from: data)
//                DispatchQueue.main.async {
//                    self.exercises = exercises
//                }
//            } catch {
//                print("Error decoding JSON: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//}
