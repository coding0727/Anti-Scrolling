import SwiftUI

struct ContentView: View {
    @StateObject private var profileManager = ProfileManager()

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
        .environmentObject(profileManager)
    }
}
