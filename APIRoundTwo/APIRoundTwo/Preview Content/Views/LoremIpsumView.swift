

import SwiftUI

struct LoremIpsumView: View {
    @StateObject private var viewModel: LoremIpsumViewModel
    
    init(paragraphs: Int) {
        _viewModel = StateObject(wrappedValue: LoremIpsumViewModel(paragraphs: paragraphs))
    }
    
    var body: some View {
        ScrollView {
            Text(viewModel.loremIpsumText)
                .padding()
        }
    }
}

struct LoremIpsumView_Previews: PreviewProvider {
    static var previews: some View {
        LoremIpsumView(paragraphs:8)
    }
}
