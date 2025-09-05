import SwiftUI

struct BackButton: View {
    var action: () -> Void

    private let width: CGFloat = 15
    private let height: CGFloat = 125
    private let cornerRadius: CGFloat = 8

    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.white.opacity(0.25), lineWidth: 2) // только обводка
                .frame(width: width, height: height)
                .accessibilityLabel("Назад")
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            BackButton {
                print("Назад нажата")
            }
            .frame(width: 200, height: 300)
            .position(x: 100, y: 150)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
