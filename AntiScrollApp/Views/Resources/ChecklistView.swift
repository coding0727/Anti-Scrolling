import SwiftUI

struct ChecklistView: View {
    @EnvironmentObject var checklistManager: ChecklistManager
    @State private var selectedCategory: ChecklistCategory = .stimulation

    private var filteredItems: [ChecklistItem] {
        ResourceContent.checklistItems.filter { $0.category == selectedCategory }
    }

    var body: some View {
        VStack(spacing: 0) {
            Picker("Category", selection: $selectedCategory) {
                ForEach(ChecklistCategory.allCases) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.top, 12)

            Text("\(checklistManager.completedCount) of \(checklistManager.totalCount) complete")
                .font(.caption)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 8)

            List {
                Section(selectedCategory.sectionTitle) {
                    ForEach(filteredItems) { item in
                        Button {
                            checklistManager.toggle(item.id)
                        } label: {
                            HStack(alignment: .top, spacing: 12) {
                                Image(systemName: checklistManager.isCompleted(item.id) ? "checkmark.square.fill" : "square")
                                    .font(.title3)
                                    .foregroundColor(checklistManager.isCompleted(item.id) ? .accentColor : .secondary)
                                    .accessibilityHidden(true)

                                Text(item.title)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel(item.title)
                        .accessibilityValue(checklistManager.isCompleted(item.id) ? "Completed" : "Not completed")
                        .accessibilityHint("Double tap to toggle completion")
                    }
                }
            }
            .applyGroupedListStyle()
        }
        .navigationTitle("Reduce the Pull")
        .inlineNavigationTitle()
    }
}
