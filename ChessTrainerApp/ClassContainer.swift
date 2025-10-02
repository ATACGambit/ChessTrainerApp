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
            // S1: фон
            Color.black
                .ignoresSafeArea()

            // S2: рабочая зона
            ZStack {
                switch currentScreen {
                case .classHome:
                    Image("chessWallpaper")
                        .resizable()
                        .scaledToFill()
                        .overlay(
                            HStack(spacing: 30) {
                                AppButton(title: "Доска", systemImageName: "checkerboard.rectangle") {
                                    currentScreen = .board
                                }
                                AppButton(title: "Уроки", systemImageName: "book.closed") {
                                    currentScreen = .lessons
                                }
                                AppButton(title: "Ученики", systemImageName: "person.3.fill") {
                                    currentScreen = .students
                                }
                            }
                            .padding(16)
                            .frame(width: layout.s2Frame.width, height: layout.s2Frame.height, alignment: .topLeading)
                        )
                case .board:
                    BoardContainer()
                case .lessons:
                    LessonsView()
                case .students:
                    StudentsView()
                }
            }
            .frame(width: layout.s2Frame.width, height: layout.s2Frame.height)
            .clipShape(RoundedRectangle(cornerRadius: layout.s2CornerRadius))
            .position(x: layout.s2Frame.midX, y: layout.s2Frame.midY)

            // S3: корпус гаджета с BackButton
            Rectangle()
                .fill(Color.black)
                .frame(width: layout.s3Frame.width, height: layout.s3Frame.height)
                .position(x: layout.s3Frame.midX, y: layout.s3Frame.midY)

            BackButton {
                handleBackButton()
            }
            .position(x: layout.s3Frame.midX, y: layout.s3Frame.midY)

            // Дополнительный контент
            content
        }
    }

    // Управление навигацией
    private func handleBackButton() {
        switch currentScreen {
        case .classHome:
            inClass = false
        default:
            currentScreen = .classHome
        }
    }
}

// Кнопка S2 с иконкой и подписью
struct AppButton: View {
    let title: String
    let systemImageName: String
    let action: () -> Void

    @State private var isHovering = false

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(isHovering ? .blue : .black)
                Text(title)
                    .font(.caption)
                    .foregroundColor(isHovering ? .blue : .black)
            }
            .padding(4)
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())
        .onHover { hovering in
            isHovering = hovering
        }
    }
}
