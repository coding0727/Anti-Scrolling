import SwiftUI

struct ProfileSetupView: View {
    @EnvironmentObject var profileManager: ProfileManager
    @State private var name: String = ""
    @State private var goal: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Your name") {
                    TextField("e.g. Alex", text: $name)
                }
                Section("Why are you here?") {
                    TextField("e.g. I want to be present with my family", text: $goal, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.groupedBackground)
            .navigationTitle("Set up your profile")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        profileManager.saveProfile(
                            name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                            goal: goal.trimmingCharacters(in: .whitespacesAndNewlines)
                        )
                    }
                    .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                              goal.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}
