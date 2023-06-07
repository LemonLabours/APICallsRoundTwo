

import SwiftUI

struct RandomWordView: View {
    @ObservedObject var randomWordViewModel = RandomWordViewModel()

    var body: some View {
        VStack {
            if let randomWord = randomWordViewModel.randomWord {
                Text(randomWord.word)
                    .font(.largeTitle)
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            randomWordViewModel.fetchRandomWord()
        }
    }
}

struct RandomWordView_Previews: PreviewProvider {
    static var previews: some View {
        RandomWordView()
    }
}
