import SwiftUI

struct BackButton: View {
    var action: () -> Void

    // Параметры размера — при необходимости можно подправить
    private let width: CGFloat = 15        // ~2.5× от исходных 6
    private let height: CGFloat = 125      // ~2.5× от исходных 50
    private let cornerRadius: CGFloat = 8

    var body: some View {
        Button(action: action) {
            ZStack {
                // Основной объём — тёмный градиент
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(.sRGB, red: 0.15, green: 0.15, blue: 0.15, opacity: 1), // чуть светлее сверху
                                Color.black // тёмнее снизу
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: width, height: height)

                // Тонкая внешняя обводка для читаемости на абсолютном черном фоне
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Color.white.opacity(0.06), lineWidth: 1)

                // Субтильный верхний блик (имитирует отражение света)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white.opacity(0.04))
                    .frame(width: width - 2, height: height * 0.34)
                    .offset(y: -height * 0.28)
                    .blendMode(.overlay)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))

            }
            .shadow(color: Color.black.opacity(0.75), radius: 4, x: 0, y: 2) // тень для приподнятости
            .accessibilityLabel("Назад")
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            // Предпросмотр: кнопка по центру "S3"
            BackButton {
                print("Назад нажата")
            }
            .frame(width: 200, height: 300) // просто для правильного центрирования в превью
            .position(x: 100, y: 150)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
