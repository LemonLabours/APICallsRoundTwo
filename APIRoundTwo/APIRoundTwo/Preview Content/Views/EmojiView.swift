import SwiftUI

struct EmojiView: View {
    @State private var emojiName = ""
    @ObservedObject private var viewModel = EmojiViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter emoji name", text: $emojiName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Search") {
                viewModel.fetchEmojis(name: emojiName)
            }
            .padding()
            
            List(viewModel.emojis, id: \.code) { emoji in
                VStack(alignment: .leading) {
                    Text("Name: \(emoji.name)")
                    Text("Character: \(emoji.character)")
                    
                    if let imageUrl = URL(string: emoji.image), let imageData = try? Data(contentsOf: imageUrl), let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView()
    }
}
