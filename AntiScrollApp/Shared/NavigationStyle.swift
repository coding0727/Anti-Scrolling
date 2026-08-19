import SwiftUI

extension View {
    @ViewBuilder
    func inlineNavigationTitle() -> some View {
        #if os(iOS)
        navigationBarTitleDisplayMode(.inline)
        #else
        self
        #endif
    }

    @ViewBuilder
    func applyGroupedListStyle() -> some View {
        #if os(iOS)
        listStyle(.insetGrouped)
        #else
        listStyle(.inset)
        #endif
    }
}

public struct PageTabViewStyleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        #if os(iOS)
        content.tabViewStyle(.page(indexDisplayMode: .never))
        #else
        content
        #endif
    }
}
