//
//  TriviaView.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 31/05/2023.
//

import SwiftUI

struct TriviaView: View {
    @ObservedObject var viewModel = TriviaViewModel()
    
    var body: some View {
        List(viewModel.triviaItems, id: \.question) { triviaItem in
            VStack(alignment: .leading) {
                Text("Category: \(triviaItem.category)")
                Text("Question: \(triviaItem.question)")
                Text("Answer: \(triviaItem.answer)")
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}
struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
