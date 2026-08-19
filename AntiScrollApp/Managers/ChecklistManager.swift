import Foundation
import Combine

/// Persists checklist completion state locally on-device. No account, no server.
final class ChecklistManager: ObservableObject {
    @Published private(set) var completedIDs: Set<String> {
        didSet { save() }
    }

    private enum Keys {
        static let completed = "checklist.completed"
    }

    init() {
        let saved = UserDefaults.standard.stringArray(forKey: Keys.completed) ?? []
        self.completedIDs = Set(saved)
    }

    var completedCount: Int { completedIDs.count }

    var totalCount: Int { ResourceContent.checklistItems.count }

    func isCompleted(_ id: String) -> Bool {
        completedIDs.contains(id)
    }

    func toggle(_ id: String) {
        if completedIDs.contains(id) {
            completedIDs.remove(id)
        } else {
            completedIDs.insert(id)
        }
    }

    private func save() {
        UserDefaults.standard.set(Array(completedIDs), forKey: Keys.completed)
    }
}
