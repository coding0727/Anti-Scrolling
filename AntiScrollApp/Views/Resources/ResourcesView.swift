import SwiftUI

private struct ResourceHubCard: View {
    let icon: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.accentColor)
                .frame(width: 44, height: 44)
                .background(Color.accentColor.opacity(0.12), in: RoundedRectangle(cornerRadius: 10, style: .continuous))

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer(minLength: 0)

            Image(systemName: "chevron.right")
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.secondary.opacity(0.6))
        }
        .padding(16)
        .background(Color.secondaryGroupedBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct ResourcesView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    NavigationLink {
                        ArticleReadingView()
                    } label: {
                        ResourceHubCard(
                            icon: "book.pages",
                            title: "Why We Scroll",
                            subtitle: "Understanding the habit and its cost"
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink {
                        ChecklistView()
                    } label: {
                        ResourceHubCard(
                            icon: "checklist",
                            title: "Reduce the Pull",
                            subtitle: "11 tactical tweaks across 3 areas"
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink {
                        ActivityLadderView()
                    } label: {
                        ResourceHubCard(
                            icon: "stairs",
                            title: "Replace the Habit",
                            subtitle: "4 levels of habit replacements"
                        )
                    }
                    .buttonStyle(.plain)
                }
                .padding()
            }
            .background(Color.groupedBackground)
            .navigationTitle("Resources")
        }
    }
}
