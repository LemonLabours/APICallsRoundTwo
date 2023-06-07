
import SwiftUI

struct RiddleView: View {
    @StateObject private var viewModel = RiddleViewModel()
    
    var body: some View {
        List(viewModel.riddles, id: \.title) { riddle in
            VStack(alignment: .leading) {
                Text(riddle.title)
                    .font(.title)
                    .bold()
                Text("Question: \(riddle.question)")
                Text("Answer: \(riddle.answer)")
            }
            .padding()
        }
        .padding()
    }
}

struct RiddleView_Previews: PreviewProvider {
    static var previews: some View {
        RiddleView()
    }
}
