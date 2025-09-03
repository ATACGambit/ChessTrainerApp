import SwiftUI

// --- ScreenType для управления текущим экраном S2 ---
enum ScreenType {
    case classHome
    case board
    case lessons
    case students
}

struct ClassView: View {
    @Binding var inClass: Bool
    @State private var currentScreen: ScreenType = .classHome

    var body: some View {
        GeometryReader { geometry in
            let layout = LayoutModel(screenSize: geometry.size)
            
            ClassContainer(
                layout: layout,
                inClass: $inClass,
                currentScreen: $currentScreen
            ) {
                if currentScreen == .classHome {
                    VStack(alignment: .leading, spacing: 12) {
                        // --- Кнопка "Доска" ---
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

                        // --- Кнопка "Уроки" ---
                        Button(action: { currentScreen = .lessons }) {
                            Text("Уроки")
                                .font(.caption)
                                .padding(6)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(radius: 2)
                        }

                        // --- Кнопка "Ученики" ---
                        Button(action: { currentScreen = .students }) {
                            Text("Ученики")
                                .font(.caption)
                                .padding(6)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(radius: 2)
                        }
                    }
                    .padding(8)
                    .frame(width: layout.s2Frame.width, height: layout.s2Frame.height, alignment: .topLeading)
                    .position(x: layout.s2Frame.midX, y: layout.s2Frame.midY)
                }
            }
        }
    }
}
