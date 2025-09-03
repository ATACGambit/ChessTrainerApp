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
                        .overlay(
                            // --- Горизонтальные кнопки ---
                            HStack(spacing: 20) {
                                Button(action: { currentScreen = .board }) {
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)
                                            .frame(width: 50, height: 50)
                                            .shadow(radius: 2)
                                        Text("Доска")
                                            .font(.caption)
                                            .foregroundColor(.black)
                                    }
                                }

                                Button(action: { currentScreen = .lessons }) {
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)
                                            .frame(width: 50, height: 50)
                                            .shadow(radius: 2)
                                        Text("Уроки")
                                            .font(.caption)
                                            .foregroundColor(.black)
                                    }
                                }

                                Button(action: { currentScreen = .students }) {
                                    VStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.white)
                                            .frame(width: 50, height: 50)
                                            .shadow(radius: 2)
                                        Text("Ученики")
                                            .font(.caption)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                            .padding(8)
                            .frame(width: layout.s2Frame.width, height: layout.s2Frame.height, alignment: .topLeading)
                        )
                case .board:
                    BoardView()
                case .lessons:
                    LessonsView()
                case .students:
                    StudentsView()
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

    // --- Логика кнопки "Назад" ---
    private func handleBackButton() {
        switch currentScreen {
        case .classHome:
            inClass = false // возвращаемся в ContentView
        default:
            currentScreen = .classHome // возвращаемся в ClassHome
        }
    }
}
