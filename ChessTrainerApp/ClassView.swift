import SwiftUI

// --- ScreenType для управления текущим экраном S2 ---
enum ScreenType {
    case classHome
    case board
    case lesson1
    case lesson2
    // Добавляйте новые экраны здесь
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
                        Button(action: {
                            currentScreen = .board
                        }) {
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

                        // --- Кнопка "Урок 1" ---
                        Button(action: {
                            currentScreen = .lesson1
                        }) {
                            Text("Урок 1")
                                .font(.caption)
                                .padding(6)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(radius: 2)
                        }

                        // --- Кнопка "Урок 2" ---
                        Button(action: {
                            currentScreen = .lesson2
                        }) {
                            Text("Урок 2")
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
