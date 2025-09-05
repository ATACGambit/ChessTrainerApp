import SwiftUI

struct BackButton: View {
    var action: () -> Void

    private let width: CGFloat = 15
    private let height: CGFloat = 125
    private let cornerRadius: CGFloat = 8

    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.white.opacity(0.25), lineWidth: 2)
                .frame(width: width, height: height)
                .contentShape(Rectangle()) // вся рамка кликабельна
        }
        .buttonStyle(PlainButtonStyle())
        .accessibilityLabel("Назад")
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            BackButton {
                print("Назад нажата")
            }
            .position(x: 50, y: 200)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
