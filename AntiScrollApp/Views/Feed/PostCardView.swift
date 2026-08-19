import SwiftUI

struct PostCardView: View {
    let post: Post
    let onUnavailableAction: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 10) {
                Circle()
                    .fill(Color.accentColor.opacity(0.2))
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: "leaf.fill")
                            .foregroundColor(.accentColor)
                            .font(.system(size: 16))
                    )
                VStack(alignment: .leading, spacing: 2) {
                    Text(post.author)
                        .font(.subheadline.weight(.semibold))
                    Text("\(post.minutesAgo)m ago")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.secondary)
            }

            Text(post.message)
                .font(.title3.weight(.medium))
                .foregroundColor(.primary)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)

            Divider()

            HStack(spacing: 0) {
                actionButton(icon: "heart", label: "Like") {
                    onUnavailableAction("You can't like — that's the point.")
                }
                actionButton(icon: "bubble.right", label: "Comment") {
                    onUnavailableAction("Comments are turned off here.")
                }
                actionButton(icon: "arrowshape.turn.up.right", label: "Share") {
                    onUnavailableAction("Nothing to share, just breathe.")
                }
            }
        }
        .padding()
        .background(Color.secondaryGroupedBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }

    @ViewBuilder
    private func actionButton(icon: String, label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                Text(label)
                    .font(.footnote)
            }
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity)
        }
    }
}
