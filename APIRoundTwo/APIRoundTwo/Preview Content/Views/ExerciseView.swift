//
//  ExerciseView.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 31/05/2023.
//

import SwiftUI


struct ExerciseView: View {
    @ObservedObject var viewModel = ExerciseViewModel()
    
    var body: some View {
        List(viewModel.exercises, id: \.name) { exercise in
            VStack(alignment: .leading) {
                Text(exercise.name)
                    .font(.headline)
                Text("Type: \(exercise.type)")
                Text("Equipment: \(exercise.equipment)")
                Text("Difficulty: \(exercise.difficulty)")
                Text(exercise.instructions)
                    .padding(.top, 4)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
            }
        }
        .onAppear {
            viewModel.fetchExercises()
        }
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
