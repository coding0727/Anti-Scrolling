import SwiftUI

struct FeedView: View {
    @State private var posts: [Post] = []
    @State private var remainingQuotes: [String] = []
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

    /// Appends randomized quotes, reshuffling after every complete pass.
    private func loadMore() {
        let startIndex = posts.count
        var nextQuotes: [String] = []

        while nextQuotes.count < pageSize {
            if remainingQuotes.isEmpty {
                remainingQuotes = Quote.all.shuffled()

                if remainingQuotes.first == posts.last?.message, remainingQuotes.count > 1 {
                    remainingQuotes.swapAt(0, 1)
                }
            }

            let count = min(pageSize - nextQuotes.count, remainingQuotes.count)
            nextQuotes.append(contentsOf: remainingQuotes.prefix(count))
            remainingQuotes.removeFirst(count)
        }

        let newPosts = nextQuotes.enumerated().map { offset, quote -> Post in
            return Post(message: quote, minutesAgo: (startIndex + offset) + 1)
        }
        posts.append(contentsOf: newPosts)
    }
}
