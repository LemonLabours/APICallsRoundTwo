import Foundation

class EmojiViewModel: ObservableObject {
    @Published var emojis: [Emoji] = []
    
    func fetchEmojis(name: String) {
        let nameQuery = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let endpoint = "https://api.api-ninjas.com/v1/emoji?name=\(nameQuery)"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (response: [Emoji]?, error) in
            if let response = response {
                DispatchQueue.main.async {
                    self.emojis = response
                }
            } else if let error = error {
                print("Error fetching emojis: \(error)")
            }
        }
    }
}
