
import SwiftUI

struct GeocodingView: View {
    @StateObject private var viewModel: GeocodingViewModel
    
    init(city: String, country: String) {
        _viewModel = StateObject(wrappedValue: GeocodingViewModel(city: city, country: country))
    }
    
    var body: some View {
        List(viewModel.locations, id: \.name) { location in
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.title)
                Text("Latitude: \(location.latitude)")
                Text("Longitude: \(location.longitude)")
                Text("Country: \(location.country)")
                Text("State: \(location.state)")
            }
            .padding()
        }
    }
}
struct GeocodingView_Previews: PreviewProvider {
    static var previews: some View {
        GeocodingView(city: "London", country: "England")
    }
}
