import SwiftUI

extension Color {
    static var groupedBackground: Color {
        #if canImport(UIKit)
        Color(uiColor: .systemGroupedBackground)
        #elseif canImport(AppKit)
        Color(nsColor: .windowBackgroundColor)
        #else
        Color(.gray.opacity(0.08))
        #endif
    }

    static var secondaryGroupedBackground: Color {
        #if canImport(UIKit)
        Color(uiColor: .secondarySystemGroupedBackground)
        #elseif canImport(AppKit)
        Color(nsColor: .controlBackgroundColor)
        #else
        Color(.gray.opacity(0.12))
        #endif
    }

    static var tertiaryFill: Color {
        #if canImport(UIKit)
        Color(uiColor: .tertiarySystemFill)
        #elseif canImport(AppKit)
        Color(nsColor: .separatorColor).opacity(0.3)
        #else
        Color(.gray.opacity(0.2))
        #endif
    }
}
