import SwiftUI

struct ClassContainer<Content: View>: View {
    let layout: LayoutModel
    let content: Content
    @Binding var inClass: Bool
    @Binding var currentScreen: ScreenType

    init(layout: LayoutModel, inClass: Binding<Bool>, currentScreen: Binding<ScreenType>, @ViewBuilder content: () -> Content) {
        self.layout = layout
        self._inClass = inClass
        self._currentScreen = currentScreen
        self.content = content()
    }

    var body: some View {
        ZStack {
            // --- S1: серый фон ---
            Color.gray
                .ignoresSafeArea()

            // --- S2: экран гаджета ---
            ZStack {
                switch currentScreen {
                case .classHome:
                    Image("chessWallpaper")
                        .resizable()
                        .scaledToFill()
                case .board:
                    BoardView()
                case .lesson1:
                    Color.green // заглушка для будущего урока 1
                case .lesson2:
                    Color.orange // заглушка для будущего урока 2
                }
            }
            .frame(width: layout.s2Frame.width, height: layout.s2Frame.height)
            .clipShape(RoundedRectangle(cornerRadius: layout.s2CornerRadius))
            .position(x: layout.s2Frame.midX, y: layout.s2Frame.midY)

            // --- S3: красная зона ---
            Rectangle()
                .fill(Color.red)
                .frame(width: layout.s3Frame.width, height: layout.s3Frame.height)
                .position(x: layout.s3Frame.midX, y: layout.s3Frame.midY)

            // --- Кнопка "Назад" ---
            BackButton {
                handleBackButton()
            }
            .position(x: layout.s3Frame.midX, y: layout.s3Frame.midY)

            // --- Дополнительный контент внутри S2 ---
            content
        }
    }

    // --- Отдельная функция для кнопки "Назад" ---
    private func handleBackButton() {
        switch currentScreen {
        case .classHome:
            inClass = false // возвращаемся в ContentView
        default:
            currentScreen = .classHome // возвращаемся в ClassHome
        }
    }
}
