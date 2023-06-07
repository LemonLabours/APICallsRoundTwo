import SwiftUI
struct FactsView: View {
    @ObservedObject var viewModel: FactsViewModel

    var body: some View {
        List(viewModel.facts, id: \.fact) { fact in
            Text(fact.fact)
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}
struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView(viewModel: FactsViewModel())
    }
}
