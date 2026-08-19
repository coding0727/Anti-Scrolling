import SwiftUI

struct ActivityLadderView: View {
    @State private var selectedLevel = 0

    private let levels = ResourceContent.activityLevels
    private let columns = [GridItem(.adaptive(minimum: 140), spacing: 10)]

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                introText

                difficultyIndicator

                TabView(selection: $selectedLevel) {
                    ForEach(levels) { level in
                        levelCard(level)
                            .padding(.horizontal, 24)
                            .tag(level.id)
                    }
                }
                .frame(height: 330)
                .modifier(PageTabViewStyleModifier())
                .animation(.easeInOut(duration: 0.25), value: selectedLevel)
            }
            .padding(.top, 20)
            .padding(.bottom, 12)
        }
        .background(Color.groupedBackground.ignoresSafeArea())
        .navigationTitle("Replace the Habit")
        .inlineNavigationTitle()
    }

    private var introText: some View {
        (
            Text("Breaking a habit requires offering your brain an alternative. Instead of asking \"What should I stop doing?\" ask ")
                .foregroundColor(.secondary)
            +
            Text("\"What would I like to do instead?\"")
                .foregroundColor(.accentColor)
                .fontWeight(.semibold)
        )
        .font(.subheadline)
        .lineSpacing(4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
    }

    private var difficultyIndicator: some View {
        VStack(spacing: 16) {
            Text("Difficulty Level")
                .font(.caption.weight(.semibold))
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity)

            HStack(spacing: 0) {
                ForEach(Array(levels.enumerated()), id: \.element.id) { index, level in
                    if index > 0 {
                        Image(systemName: "chevron.right")
                            .font(.caption2.weight(.semibold))
                            .foregroundColor(.secondary.opacity(0.25))
                            .frame(maxWidth: .infinity)
                    }

                    Button {
                        withAnimation { selectedLevel = level.id }
                    } label: {
                        Text("\(index + 1)")
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(selectedLevel == level.id ? .white : .secondary)
                            .frame(width: 36, height: 36)
                            .background(
                                Circle()
                                    .fill(selectedLevel == level.id ? Color.accentColor : Color.tertiaryFill)
                            )
                    }
                    .buttonStyle(.plain)
                    .accessibilityLabel("Difficulty level \(index + 1)")
                    .accessibilityAddTraits(selectedLevel == level.id ? .isSelected : [])
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 16)
        .background(Color.secondaryGroupedBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.secondary.opacity(0.12), lineWidth: 1)
        }
        .padding(.horizontal, 16)
    }

    private func levelCard(_ level: ActivityLevel) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Level \(level.number)")
                .font(.caption2.weight(.bold))
                .foregroundColor(.accentColor)
                .textCase(.uppercase)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.accentColor.opacity(0.12), in: Capsule())

            Text(level.title)
                .font(.title2.weight(.bold))

            Text(level.subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineSpacing(3)

            LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                ForEach(level.activities, id: \.self) { activity in
                    Text(activity)
                        .font(.caption.weight(.medium))
                        .foregroundColor(.primary)
                        .padding(.horizontal, 12)
                        .frame(maxWidth: .infinity, minHeight: 38)
                        .background(Color.groupedBackground, in: Capsule())
                        .overlay {
                            Capsule()
                                .stroke(Color.secondary.opacity(0.15), lineWidth: 1)
                        }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(20)
        .background(Color.secondaryGroupedBackground)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Color.secondary.opacity(0.1), lineWidth: 1)
        }
        .shadow(color: .black.opacity(0.05), radius: 10, y: 4)
    }
}
