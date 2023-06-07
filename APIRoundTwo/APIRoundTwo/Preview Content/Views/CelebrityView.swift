import SwiftUI

struct CelebrityView: View {
    @ObservedObject var viewModel = CelebrityViewModel()
    let celebrityName: String
    
    var body: some View {
        VStack {
            if let celebrity = viewModel.celebrity {
                Text("Name: \(celebrity.name)")
                Text("Gender: \(celebrity.gender)")
                Text("Nationality: \(celebrity.nationality)")
                Text("Occupation: \(celebrity.occupation.joined(separator: ", "))")
                Text("Height: \(celebrity.height)")
                Text("Birthday: \(celebrity.birthday)")
                Text("Age: \(celebrity.age)")
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.fetchData(for: celebrityName)
        }
    }
}


struct CelebrityView_Previews: PreviewProvider {
    static var previews: some View {
        CelebrityView(celebrityName: "Michael Jordan")
    }
}
