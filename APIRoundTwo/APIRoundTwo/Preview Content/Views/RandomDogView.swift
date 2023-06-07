import SwiftUI

struct RandomDogView: View {
    @ObservedObject var viewModel = RandomDogViewModel()
    
    var body: some View {
        VStack {
            if let url = URL(string: viewModel.imageUrl),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.fetchRandomDogImage()
        }
    }
}

struct RandomDogView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDogView()
    }
}
