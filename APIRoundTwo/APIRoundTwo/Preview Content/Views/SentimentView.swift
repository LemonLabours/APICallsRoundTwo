import SwiftUI

struct SentimentView: View {
    @State private var inputText = ""
    @ObservedObject private var viewModel = SentimentViewModel()

    var body: some View {
        VStack {
            TextField("Enter text", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Analyze Sentiment") {
                viewModel.analyzeSentiment(text: inputText)
            }
            .padding()

            if let response = viewModel.sentimentResponse {
                Text("Score: \(response.score)")
                Text("Text: \(response.text)")
                Text("Sentiment: \(response.sentiment)")
            }
        }
        .padding()
    }
}

struct SentimentView_Previews: PreviewProvider {
    static var previews: some View {
        SentimentView()
    }
}
