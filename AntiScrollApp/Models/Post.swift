import Foundation

struct Post: Identifiable {
    let id: UUID = UUID()
    let message: String
    let author: String = "Anti-Scroll"
    let minutesAgo: Int
}
