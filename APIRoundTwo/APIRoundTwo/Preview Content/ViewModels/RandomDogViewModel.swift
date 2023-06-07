import Foundation
class RandomDogViewModel: ObservableObject {
    @Published var imageUrl: String = ""
    
    func fetchRandomDogImage() {
        guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(RandomDogImage.self, from: data)
                
                DispatchQueue.main.async {
                    self.imageUrl = decodedData.message
                }
            } catch {
                print("Error decoding random dog image: \(error)")
            }
        }.resume()
    }
}
