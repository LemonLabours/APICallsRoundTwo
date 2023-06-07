import SwiftUI

struct QuotesView: View {
    @ObservedObject var quotesViewModel = QuotesViewModel()

    var body: some View {
        VStack {
            if quotesViewModel.quotes.isEmpty {
                Text("Loading...")
            } else {
                List(quotesViewModel.quotes, id: \.quote) { quote in
                    VStack(alignment: .leading) {
                        Text(quote.quote)
                            .font(.headline)
                        Text("- \(quote.author)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .onAppear {
            quotesViewModel.fetchQuotes()
        }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }
}
