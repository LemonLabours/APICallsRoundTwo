import SwiftUI

class BucketListViewModel: ObservableObject {
    @Published var bucketListItem: BucketListItem?

    func fetchBucketListItem() {
        let endpoint = "https://api.api-ninjas.com/v1/bucketlist"
        
        APIManager.shared.fetchData(endpoint: endpoint) { (bucketListItem: BucketListItem?, error) in
            if let bucketListItem = bucketListItem {
                DispatchQueue.main.async {
                    self.bucketListItem = bucketListItem
                }
            } else if let error = error {
                print("Error fetching bucket list item: \(error)")
            }
        }
    }
}
//class BucketListViewModel: ObservableObject {
//    @Published var bucketListItem: BucketListItem?
//
//    func fetchBucketListItem() {
//        guard let url = URL(string: "https://api.api-ninjas.com/v1/bucketlist") else {
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
//                    let decodedData = try decoder.decode(BucketListItem.self, from: data)
//                    DispatchQueue.main.async {
//                        self.bucketListItem = decodedData
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error)")
//                }
//            }
//        }
//        task.resume()
//    }
//}
//
