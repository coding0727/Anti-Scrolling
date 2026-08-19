import SwiftUI

struct FeedView: View {
    @State private var posts: [Post] = []
    @State private var toast: ToastMessage?
    private let pageSize = 20

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(posts) { post in
                        PostCardView(post: post) { message in
                            toast = ToastMessage(text: message)
                        }
                        .onAppear {
                            if post.id == posts.last?.id {
                                loadMore()
                            }
                        }
                    }
                }
                .padding()
            }
            .background(Color.groupedBackground)
            .navigationTitle("Feed")
            .onAppear {
                if posts.isEmpty { loadMore() }
            }
            .toast($toast)
        }
    }

    /// Appends the next page of posts, cycling through Quote.all indefinitely.
    private func loadMore() {
        let quotes = Quote.all
        let startIndex = posts.count
        let newPosts = (0..<pageSize).map { offset -> Post in
            let quote = quotes[(startIndex + offset) % quotes.count]
            return Post(message: quote, minutesAgo: (startIndex + offset) + 1)
        }
        posts.append(contentsOf: newPosts)
    }
}
