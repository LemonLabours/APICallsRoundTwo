import SwiftUI

struct CovidView: View {
    @ObservedObject var viewModel: CovidViewModel

    var body: some View {
        List(viewModel.covidData, id: \.country) { data in
            VStack(alignment: .leading) {
                Text("Country: \(data.country)")
                Text("Region: \(data.region)")
                ForEach(Array(data.cases.keys).sorted(), id: \.self) { key in
                    if let covidCase = data.cases[key] {
                        Text("Date: \(key)")
                        Text("Total Cases: \(covidCase.total)")
                        Text("New Cases: \(covidCase.new)")
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}
struct CovidView_Previews: PreviewProvider {
    static var previews: some View {
        CovidView(viewModel: CovidViewModel())
    }
}
