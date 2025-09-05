import SwiftUI

struct BackButton: View {
    var action: () -> Void

    private let width: CGFloat = 15
    private let height: CGFloat = 125
    private let cornerRadius: CGFloat = 8

    var body: some View {
        Button(action: action) {
            ZStack {
                // Основной градиент кнопки (объем)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(.sRGB, red: 0.18, green: 0.18, blue: 0.18, opacity: 1),
                                Color.black
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: width, height: height)

                // Внешняя тонкая обводка
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white.opacity(0.06), lineWidth: 1)

                // Верхний блик (световой эффект)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white.opacity(0.04))
                    .frame(width: width - 2, height: height * 0.34)
                    .offset(y: -height * 0.28)
                    .blendMode(.overlay)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
            .shadow(color: Color.black.opacity(0.75), radius: 4, x: 0, y: 2)
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
