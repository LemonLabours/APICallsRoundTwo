

import SwiftUI

struct RandomUserView: View {
    @StateObject private var viewModel = RandomUserViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            if let randomUser = viewModel.randomUser {
                Text("Username: \(randomUser.username)")
                Text("Sex: \(randomUser.sex)")
                Text("Address: \(randomUser.address)")
                Text("Name: \(randomUser.name)")
                Text("Email: \(randomUser.email)")
                Text("Birthday: \(randomUser.birthday)")
            } else {
                Text("Fetching random user data...")
            }
        }
        .padding()
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView()
    }
}
