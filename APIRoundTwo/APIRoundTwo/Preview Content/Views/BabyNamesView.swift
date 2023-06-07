import SwiftUI

struct BabyNamesView: View {
    @ObservedObject var babyNamesViewModel = BabyNamesViewModel()

    var body: some View {
        VStack {
            if babyNamesViewModel.babyNames.isEmpty {
                Text("Loading...")
            } else {
                List(babyNamesViewModel.babyNames, id: \.self) { name in
                    Text(name)
                }
            }
        }
        .onAppear {
            babyNamesViewModel.fetchBabyNames()
        }
    }
}

struct BabyNamesView_Previews: PreviewProvider {
    static var previews: some View {
        BabyNamesView()
    }
}
