import Foundation

class APIManager {
    static let shared = APIManager(baseURL: "")
    private let apiKey = "42y2o+xCVKGi3P2U4+WX/Q==dnfvdiCV3VB4yaoV"
    private let baseURL: String
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    private func makeRequest(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            completion(data, error)
        }.resume()
    }
    
    func fetchData<T: Decodable>(endpoint: String, completion: @escaping (T?, Error?) -> Void) {
        let urlString = baseURL + endpoint
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        makeRequest(url: url) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(decodedData, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, NSError(domain: "Empty Data", code: 0, userInfo: nil))
            }
        }
    }
}




