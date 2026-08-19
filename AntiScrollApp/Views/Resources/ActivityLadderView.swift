import SwiftUI

struct ActivityLadderView: View {
    @State private var selectedLevel = 0

    private let levels = ResourceContent.activityLevels
    private let columns = [GridItem(.flexible())]

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
                .frame(height: 390)
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
                .foregroundColor(.brandSecondaryText)
            +
            Text("\"What would I like to do instead?\"")
                .foregroundColor(.brandPrimary)
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
                .foregroundColor(.brandSecondaryText)
                .frame(maxWidth: .infinity)

            HStack(spacing: 0) {
                ForEach(Array(levels.enumerated()), id: \.element.id) { index, level in
                    if index > 0 {
                        Image(systemName: "chevron.right")
                            .font(.caption2.weight(.semibold))
                            .foregroundColor(.brandSoft.opacity(0.7))
                            .frame(maxWidth: .infinity)
                    }

                    Button {
                        withAnimation { selectedLevel = level.id }
                    } label: {
                        Text("\(index + 1)")
                            .font(.subheadline.weight(.semibold))
                            .foregroundColor(selectedLevel == level.id ? .white : .brandSecondaryText)
                            .frame(width: 36, height: 36)
                            .background(
                                Circle()
                                    .fill(selectedLevel == level.id ? Color.brandPrimary : Color.tertiaryFill)
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
                .stroke(Color.brandBorder, lineWidth: 1)
        }
        .padding(.horizontal, 16)
    }

    private func levelCard(_ level: ActivityLevel) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Level \(level.number)")
                .font(.caption2.weight(.bold))
                .foregroundColor(.brandDeep)
                .textCase(.uppercase)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.brandBorder.opacity(0.55), in: Capsule())

            Text(level.title)
                .font(.title2.weight(.bold))
                .foregroundColor(.brandText)

            Text(level.subtitle)
                .font(.subheadline)
                .foregroundColor(.brandSecondaryText)
                .lineSpacing(3)

            LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                ForEach(level.activities, id: \.self) { activity in
                    Text(activity)
                        .font(.caption.weight(.medium))
                        .foregroundColor(.brandText)
                        .padding(.horizontal, 12)
                        .frame(maxWidth: .infinity, minHeight: 38)
                        .background(Color.groupedBackground, in: Capsule())
                        .overlay {
                            Capsule()
                                .stroke(Color.brandBorder, lineWidth: 1)
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
                .stroke(Color.brandBorder.opacity(0.8), lineWidth: 1)
        }
        .shadow(color: Color.brandDeep.opacity(0.08), radius: 10, y: 4)
    }
}
