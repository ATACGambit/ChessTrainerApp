import SwiftUI

struct TopPanelView: View {
    // Цвета кнопок можно менять здесь
    @State private var buttonColors: [Color] = [
        Color(red: 86/255, green: 177/255, blue: 193/255),
        Color(red: 86/255, green: 177/255, blue: 193/255)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let panelWidth = geometry.size.width
            let panelHeight = geometry.size.height

            ZStack {
                // Прозрачный фон панели (без обводки)
                Color.clear

                // Две кнопки — 1.1 и 1.2 (точная копия ячейки 1 из LeftPanelView)
                let cellWidth = panelWidth
                let cellH = panelHeight

                // кнопка 1.1
                Button(action: {
                    // обработка кнопки 1.1
                }) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(buttonColors[0])
                        .overlay(
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                        )
                        .frame(width: 0.6 * cellH * 1.2, height: 0.3 * cellH)
                }
                .position(x: cellWidth * 0.25, y: cellH * 0.5)

                // кнопка 1.2
                Button(action: {
                    // обработка кнопки 1.2
                }) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(buttonColors[1])
                        .overlay(
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        )
                        .frame(width: 0.6 * cellH * 1.2, height: 0.3 * cellH)
                }
                .position(x: cellWidth * 0.75, y: cellH * 0.5)
            }
        }
    }
}
