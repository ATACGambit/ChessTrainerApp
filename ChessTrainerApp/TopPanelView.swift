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
                Color.clear // Прозрачный фон панели

                let cellWidth = panelWidth
                let cellH = panelHeight

                // Кнопка 1.1
                Button(action: {
                    // обработка кнопки 1.1
                }) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(buttonColors[0])
                        .frame(width: 0.6 * cellH * 1.2 * 1.3, height: 0.3 * cellH * 1.3) // увеличено на 30%
                        .overlay(
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                        )
                        .compositingGroup()
                        .drawingGroup()
                }
                .buttonStyle(.plain)
                .position(x: cellWidth * 0.25, y: cellH * 0.5)

                // Кнопка 1.2
                Button(action: {
                    // обработка кнопки 1.2
                }) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(buttonColors[1])
                        .frame(width: 0.6 * cellH * 1.2 * 1.3, height: 0.3 * cellH * 1.3) // увеличено на 30%
                        .overlay(
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        )
                        .compositingGroup()
                        .drawingGroup()
                }
                .buttonStyle(.plain)
                .position(x: cellWidth * 0.75, y: cellH * 0.5)
            }
        }
    }
}
