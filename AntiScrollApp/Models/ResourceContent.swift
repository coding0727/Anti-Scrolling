import Foundation

struct ArticleSection: Identifiable {
    let id: String
    let title: String
    let body: String
}

enum ChecklistCategory: String, CaseIterable, Identifiable {
    case stimulation = "Stimulation"
    case temptation = "Temptation"
    case algorithm = "Algorithm"

    var id: String { rawValue }

    var sectionTitle: String {
        switch self {
        case .stimulation: "Reduce Stimulation"
        case .temptation: "Reduce Temptation"
        case .algorithm: "Reduce Algorithmic Influence"
        }
    }
}

struct ChecklistItem: Identifiable {
    let id: String
    let title: String
    let category: ChecklistCategory
}

struct ActivityLevel: Identifiable {
    let id: Int
    let number: String
    let title: String
    let subtitle: String
    let activities: [String]
}

enum ResourceContent {
    static let articleTitle = "Why We Scroll — and What It Costs"

    static let articleSections: [ArticleSection] = [
        ArticleSection(
            id: "understanding",
            title: "Understanding the Habit",
            body: "Modern platforms use infinite scrolling, algorithms, and variable rewards to maximize engagement. While these features aren't inherently harmful, heavy social media use becomes a problem when it displaces meaningful real-world activities or leaves you mentally drained."
        ),
        ArticleSection(
            id: "fragmented-attention",
            title: "The Price of Fragmented Attention",
            body: "Your brain constantly filters input. Rapidly switching between hundreds of short, unrelated posts fractures your focus, making sustained concentration harder and increasing mental fatigue. Over time, this makes low-stimulation tasks—like sitting through a work meeting—feel agonizingly slow."
        ),
        ArticleSection(
            id: "exhaustion",
            title: "Why Scrolling Exhausts You",
            body: "We often scroll to unwind, yet finish feeling unrested. Passive consumption fills your mind with noise without providing true emotional or cognitive recovery."
        ),
        ArticleSection(
            id: "comparison",
            title: "The Trap of Comparison",
            body: "Constant exposure to curated highlight reels can subtly degrade your self-esteem and well-being. Regaining control over what you consume—and for how long—is key to protecting your peace."
        )
    ]

    static let checklistItems: [ChecklistItem] = [
        ChecklistItem(id: "stimulation.grayscale", title: "Switch your display to grayscale to lower visual novelty.", category: .stimulation),
        ChecklistItem(id: "stimulation.silent", title: "Keep your device on silent mode.", category: .stimulation),
        ChecklistItem(id: "stimulation.notifications", title: "Disable non-essential app notifications.", category: .stimulation),
        ChecklistItem(id: "stimulation.badges", title: "Hide notification badges.", category: .stimulation),

        ChecklistItem(id: "temptation.limits", title: "Set strict daily app time limits.", category: .temptation),
        ChecklistItem(id: "temptation.shortcuts", title: "Remove social media shortcuts from your home screen.", category: .temptation),
        ChecklistItem(id: "temptation.evenings", title: "Store your phone in another room during evenings.", category: .temptation),
        ChecklistItem(id: "temptation.zones", title: "Designate phone-free zones (e.g., meals and bedtimes).", category: .temptation),

        ChecklistItem(id: "algorithm.recommendations", title: "Disable personalized recommendations where available.", category: .algorithm),
        ChecklistItem(id: "algorithm.history", title: "Pause watch and search history tracking.", category: .algorithm),
        ChecklistItem(id: "algorithm.subscriptions", title: "Access content via manual subscriptions rather than endless feeds.", category: .algorithm)
    ]

    static let ladderIntro = "Breaking a habit requires offering your brain an alternative. Instead of asking \"What should I stop doing?\" ask \"What would I like to do instead?\""

    static let activityLevels: [ActivityLevel] = [
        ActivityLevel(
            id: 0,
            number: "01",
            title: "Low-Stimulation Digital Activities",
            subtitle: "If putting down your screen feels too abrupt, transition through low-novelty apps.",
            activities: ["Sudoku", "Logic Puzzles", "Word Games", "Language Learning"]
        ),
        ActivityLevel(
            id: 1,
            number: "02",
            title: "Tactile Offline Hobbies",
            subtitle: "Engage your hands and focus on a single physical task without endless feeds.",
            activities: ["Adult Coloring & Drawing", "LEGO Building", "Journaling", "Crafts & Sticker Art"]
        ),
        ActivityLevel(
            id: 2,
            number: "03",
            title: "Physical Resets",
            subtitle: "Interrupt automatic scrolling loops with quick movement.",
            activities: ["Light Stretching", "Room Walk / Step Outside", "Drink a Glass of Water", "Short Walk"]
        ),
        ActivityLevel(
            id: 3,
            number: "04",
            title: "Embracing Stillness",
            subtitle: "Build your tolerance for quiet and low-stimulation environments.",
            activities: ["Close your eyes for 60 seconds", "Practice slow, deep breathing", "Short Meditation", "Sit quietly without distractions"]
        )
    ]
}
