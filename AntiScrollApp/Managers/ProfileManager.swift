import Foundation
import Combine

/// Stores the user's name and goal locally on-device. No account, no server.
final class ProfileManager: ObservableObject {
    @Published var name: String {
        didSet { UserDefaults.standard.set(name, forKey: Keys.name) }
    }
    @Published var goal: String {
        didSet { UserDefaults.standard.set(goal, forKey: Keys.goal) }
    }
    @Published var hasOnboarded: Bool {
        didSet { UserDefaults.standard.set(hasOnboarded, forKey: Keys.onboarded) }
    }

    private enum Keys {
        static let name = "profile.name"
        static let goal = "profile.goal"
        static let onboarded = "profile.onboarded"
    }

    init() {
        self.name = UserDefaults.standard.string(forKey: Keys.name) ?? ""
        self.goal = UserDefaults.standard.string(forKey: Keys.goal) ?? ""
        self.hasOnboarded = UserDefaults.standard.bool(forKey: Keys.onboarded)
    }

    func saveProfile(name: String, goal: String) {
        self.name = name
        self.goal = goal
        self.hasOnboarded = true
    }

    func reset() {
        self.name = ""
        self.goal = ""
        self.hasOnboarded = false
    }
}
