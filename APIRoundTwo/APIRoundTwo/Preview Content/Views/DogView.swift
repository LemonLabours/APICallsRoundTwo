import SwiftUI

struct DogView: View {
    @ObservedObject var viewModel: DogViewModel

    var body: some View {
        VStack {
            if let dog = viewModel.dog {
                Text(dog.name)
                    .font(.title)
                Text("Shedding: \(dog.shedding)")
                Text("Grooming: \(dog.grooming)")
                Text("Drooling: \(dog.drooling)")
       
                Text("Playfulness: \(dog.playfulness)")
                Text("Protectiveness: \(dog.protectiveness)")
                Text("Trainability: \(dog.trainability)")
                Text("Energy: \(dog.energy)")
                
                Spacer()
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchDogData()
        }
    }
}

struct DogView_Previews: PreviewProvider {
    static var previews: some View {
        DogView(viewModel: DogViewModel())
    }
}
