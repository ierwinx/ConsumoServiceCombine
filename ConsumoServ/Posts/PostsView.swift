import SwiftUI

struct PostsView: View {
    
    @StateObject private var postsViewModel = PostsViewModel()
    
    var body: some View {
        NavigationView {
            List(self.postsViewModel.arrPost, id: \.id) { post in
                NavigationLink(destination: Text(post.body)) {
                    Text(post.title)
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Posts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
