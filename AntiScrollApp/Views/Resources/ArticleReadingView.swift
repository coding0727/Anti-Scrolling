import SwiftUI

struct ArticleReadingView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                Text(ResourceContent.articleTitle)
                    .font(.title.weight(.bold))
                    .foregroundColor(.brandText)
                    .padding(.bottom, 8)

                ForEach(ResourceContent.articleSections) { section in
                    VStack(alignment: .leading, spacing: 12) {
                        Text(section.title)
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.brandDeep)

                        Text(section.body)
                            .font(.body)
                            .foregroundColor(.brandText)
                            .lineSpacing(6)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
        }
        .background(Color.groupedBackground)
        .navigationTitle("Article")
        .inlineNavigationTitle()
    }
}
