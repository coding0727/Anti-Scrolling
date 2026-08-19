import SwiftUI

struct ToastMessage: Equatable {
    let text: String
}

struct ToastModifier: ViewModifier {
    @Binding var toast: ToastMessage?
    let duration: Double = 1.6

    func body(content: Content) -> some View {
        content.overlay(alignment: .bottom) {
            if let toast {
                Text(toast.text)
                    .font(.subheadline.weight(.medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.black.opacity(0.85), in: Capsule())
                    .padding(.bottom, 90)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
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
