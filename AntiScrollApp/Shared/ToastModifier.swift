import SwiftUI

struct ToastMessage: Equatable {
    let id = UUID()
    let text: String
}

struct ToastModifier: ViewModifier {
    @Binding var toast: ToastMessage?
    let duration: Double = 5

    func body(content: Content) -> some View {
        content.overlay(alignment: .bottom) {
            if let toast {
                Text(toast.text)
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.brandText.opacity(0.94), in: Capsule())
                    .padding(.bottom, 90)
                    .contentShape(Capsule())
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .gesture(
                        DragGesture(minimumDistance: 10)
                            .onEnded { value in
                                let swipedHorizontally = abs(value.translation.width) > 30
                                let swipedVertically = abs(value.translation.height) > 30

                                if swipedHorizontally || swipedVertically {
                                    withAnimation { self.toast = nil }
                                }
                            }
                    )
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            guard self.toast?.id == toast.id else { return }
                            withAnimation { self.toast = nil }
                        }
                    }
            }
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.8), value: toast)
    }
}

extension View {
    func toast(_ message: Binding<ToastMessage?>) -> some View {
        modifier(ToastModifier(toast: message))
    }
}
