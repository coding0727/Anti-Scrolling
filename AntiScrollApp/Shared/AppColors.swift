import SwiftUI

extension Color {
    static let brandPrimary = Color(hex: 0x4F7C77)
    static let brandBackground = Color(hex: 0xEFF3F0)
    static let brandText = Color(hex: 0x29353B)
    static let brandMuted = Color(hex: 0x829D9A)
    static let brandDeep = Color(hex: 0x395C58)
    static let brandSecondaryText = Color(hex: 0x626C6E)
    static let brandBorder = Color(hex: 0xD0D9D7)
    static let brandMid = Color(hex: 0x678A86)
    static let brandSoft = Color(hex: 0xA4B5B3)

    static var groupedBackground: Color {
        brandBackground
    }

    static var secondaryGroupedBackground: Color {
        .white
    }

    static var tertiaryFill: Color {
        brandBorder.opacity(0.6)
    }

    private init(hex: UInt32) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255
        )
    }
}
