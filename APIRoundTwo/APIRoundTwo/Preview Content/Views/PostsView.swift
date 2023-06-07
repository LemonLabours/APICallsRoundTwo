import SwiftUI

struct PostsView: View {
    @ObservedObject var viewModel = PostsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts, id: \.id) { post in
                VStack(alignment: .leading) {
                    Text("Post ID: \(post.id)")
                        .font(.headline)
                    Text("Title: \(post.title)")
                    Text("Body: \(post.body)")
                }
            }
            .navigationTitle("Posts")
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
