import SwiftUI

struct CarView: View {
    @ObservedObject var carViewModel = CarViewModel()

    var body: some View {
        VStack {
            if carViewModel.cars.isEmpty {
                Text("Loading...")
            } else {
                List(carViewModel.cars, id: \.model) { car in
                    VStack(alignment: .leading) {
                        Text("Class: \(car.carClass)")
                            .font(.headline)
                    
            
                        Text("Model: \(car.model)")
                            .font(.subheadline)
                    }
                }
            }
        }
        .onAppear {
            carViewModel.fetchCars()
        }
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView()
    }
}
