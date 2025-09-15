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
            // --- S1 ---
            Color.black
                .ignoresSafeArea()

            // --- S2 ---
            ZStack {
                switch currentScreen {
                case .classHome:
                    Image("chessWallpaper")
                        .resizable()
                        .scaledToFill()
                        .overlay(
                            HStack(spacing: 30) {
                                appButton(title: "Доска", imageName: "icon_board") {
                                    currentScreen = .board
                                }
                                appButton(title: "Уроки", imageName: "icon_lessons") {
                                    currentScreen = .lessons
                                }
                                appButton(title: "Ученики", imageName: "icon_students") {
                                    currentScreen = .students
                                }
                            }
                            .padding(16)
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

            // --- S3 ---
            Rectangle()
                .fill(Color.black)
                .frame(width: layout.s3Frame.width, height: layout.s3Frame.height)
                .position(x: layout.s3Frame.midX, y: layout.s3Frame.midY)

            // --- BackButton ---
            BackButton {
                handleBackButton()
            }
            .position(x: layout.s3Frame.midX, y: layout.s3Frame.midY)

            // --- Content ---
            content
        }
    }

    private func appButton(title: String, imageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Image(imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .shadow(radius: 3)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.black)
            }
        }
    }

    private func handleBackButton() {
        switch currentScreen {
        case .classHome:
            inClass = false
        default:
            currentScreen = .classHome
        }
    }
}
