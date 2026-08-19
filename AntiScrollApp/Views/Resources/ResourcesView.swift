import SwiftUI

struct ResourceItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
}

struct ResourcesView: View {
    private let items: [ResourceItem] = [
        ResourceItem(title: "Set app time limits", description: "Use Screen Time in Settings to cap social apps to a fixed daily budget.", icon: "hourglass"),
        ResourceItem(title: "Turn off notifications", description: "Silence non-essential push notifications so you check apps on your terms.", icon: "bell.slash"),
        ResourceItem(title: "Grayscale your phone", description: "Removing color makes feeds less rewarding to look at.", icon: "circle.lefthalf.filled"),
        ResourceItem(title: "Keep your phone out of reach", description: "Charge it in another room while you work or sleep.", icon: "bed.double"),
        ResourceItem(title: "Replace the habit", description: "Pick one small action, like a short walk or a page of a book, for whenever you'd normally scroll.", icon: "arrow.triangle.2.circlepath")
    ]

    var body: some View {
        NavigationStack {
            List(items) { item in
                HStack(alignment: .top, spacing: 14) {
                    Image(systemName: item.icon)
                        .font(.title3)
                        .foregroundColor(.accentColor)
                        .frame(width: 28)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 6)
            }
            .navigationTitle("Resources")
        }
    }
}
