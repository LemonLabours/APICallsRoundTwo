
import SwiftUI

struct AirportView: View {
    @ObservedObject private var viewModel = AirportViewModel()
    
    var body: some View {
        VStack {
            Text("London Heathrow")
                .font(.title)
                .padding()
            
            List(viewModel.airports, id: \.icao) { airport in
                VStack(alignment: .leading) {
                    Text("Name: \(airport.name)")
                    Text("City: \(airport.city)")
                    Text("Region: \(airport.region)")
                    Text("Country: \(airport.country)")
                    Text("ICAO: \(airport.icao)")
                    Text("IATA: \(airport.iata)")
                    Text("Latitude: \(airport.latitude)")
                    Text("Longitude: \(airport.longitude)")
                    Text("Timezone: \(airport.timezone)")
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchAirports(name: "London Heathrow")
        }
        .padding()
    }
}

struct AirportView_Previews: PreviewProvider {
    static var previews: some View {
        AirportView()
    }
}
