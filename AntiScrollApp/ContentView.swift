import SwiftUI

struct ContentView: View {
    @StateObject private var profileManager = ProfileManager()
    @StateObject private var checklistManager = ChecklistManager()

    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "square.stack")
                }
            ResourcesView()
                .tabItem {
                    Label("Resources", systemImage: "book")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .tint(.brandPrimary)
        .foregroundStyle(Color.brandText)
        .environmentObject(profileManager)
        .environmentObject(checklistManager)
    }
}
