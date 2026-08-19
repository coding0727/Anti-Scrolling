import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @State private var showResetConfirm = false

    var body: some View {
        NavigationStack {
            if profileManager.hasOnboarded {
                List {
                    Section("Name") {
                        Text(profileManager.name)
                    }
                    Section("Your goal") {
                        Text(profileManager.goal)
                    }
                    Section {
                        Button("Edit profile") {
                            showResetConfirm = true
                        }
                    }
                }
                .navigationTitle("Profile")
                .confirmationDialog("Edit your profile?", isPresented: $showResetConfirm) {
                    Button("Edit", role: .destructive) {
                        profileManager.reset()
                    }
                    Button("Cancel", role: .cancel) {}
                }
            } else {
                ProfileSetupView()
            }
        }
    }
}
