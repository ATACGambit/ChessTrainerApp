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
                    ZStack(alignment: .topLeading) {
                        Color.clear

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
                        .padding(.top, 8)
                        .padding(.leading, 8)

                        // --- Шаблон для будущих кнопок ---
                        VStack(alignment: .leading, spacing: 8) {
                            Button("Урок 1") {
                                currentScreen = .lesson1
                            }
                            Button("Урок 2") {
                                currentScreen = .lesson2
                            }
                            // Добавляйте новые кнопки по шаблону
                        }
                        .padding(.top, 70) // отступ под кнопкой "Доска"
                        .padding(.leading, 8)
                    }
                    .frame(width: layout.s2Frame.width, height: layout.s2Frame.height)
                    .position(x: layout.s2Frame.midX, y: layout.s2Frame.midY)
                }
            }
        }
    }
}
