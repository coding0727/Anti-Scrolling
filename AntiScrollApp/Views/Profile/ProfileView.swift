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
                            .foregroundColor(.brandText)
                    }
                    Section("Your goal") {
                        Text(profileManager.goal)
                            .foregroundColor(.brandText)
                    }
                    Section {
                        Button("Edit profile") {
                            showResetConfirm = true
                        }
                        .foregroundColor(.brandDeep)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.groupedBackground)
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
