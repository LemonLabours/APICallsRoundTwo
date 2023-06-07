//
//  DadJokesView.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 31/05/2023.
import SwiftUI
struct DadJokesView: View {
    @ObservedObject var dadJokesViewModel = DadJokesViewModel()

    var body: some View {
        VStack {
            if dadJokesViewModel.dadJokes.isEmpty {
                Text("Loading...")
            } else {
                List(dadJokesViewModel.dadJokes, id: \.joke) { dadJoke in
                    Text(dadJoke.joke)
                        .font(.headline)
                }
            }
        }
        .onAppear {
            dadJokesViewModel.fetchDadJokes()
        }
    }
}

struct DadJokesView_Previews: PreviewProvider {
    static var previews: some View {
        DadJokesView()
    }
}
