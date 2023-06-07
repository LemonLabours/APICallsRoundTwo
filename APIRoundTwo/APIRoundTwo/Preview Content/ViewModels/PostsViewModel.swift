
import Foundation

class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([Post].self, from: data)
                
                DispatchQueue.main.async {
                    self.posts = decodedData
                }
            } catch {
                print("Error decoding posts: \(error)")
            }
        }.resume()
    }
}
