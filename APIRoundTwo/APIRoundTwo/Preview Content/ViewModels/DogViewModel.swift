import SwiftUI


class DogViewModel: ObservableObject {
    @Published var dog: Dog?

    func fetchDogData() {
        guard let url = URL(string: "https://api.api-ninjas.com/v1/dogs?name=golden%20retriever") else {
            return
        }

        var request = URLRequest(url: url)
        request.setValue("42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV", forHTTPHeaderField: "X-Api-Key")

        URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                do {
                    let dogs = try decoder.decode([Dog].self, from: data)
                    if let dog = dogs.first {
                        DispatchQueue.main.async {
                            self.dog = dog
                        }
                    }
                } catch {
                    print("Error decoding dog data: \(error)")
                }
            }
        }.resume()
    }
}
