import SwiftUI

struct TopPanelView: View {
    // Цвета кнопок можно менять здесь
    @State private var buttonColors: [Color] = [
        Color(red: 64/255, green: 64/255, blue: 64/255),
        Color(red: 64/255, green: 64/255, blue: 64/255)
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let panelWidth = geometry.size.width
            let panelHeight = geometry.size.height

            ZStack {
                Color.clear // фон без обводки

                let cellWidth = panelWidth
                let cellH = panelHeight

                // кнопка 1.1
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(buttonColors[0])
                        .overlay(
                            Image(systemName: "arrow.left")
                                .foregroundColor(.white)
                        )
                        .frame(width: 0.6 * cellH * 1.3, height: 0.3 * cellH * 1.3)
                }
                .buttonStyle(PlainButtonStyle()) // убирает стандартную подсветку/обводку
                .position(x: cellWidth * 0.35, y: cellH * 0.5) // ближе к центру

                // кнопка 1.2
                Button(action: {}) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(buttonColors[1])
                        .overlay(
                            Image(systemName: "arrow.right")
                                .foregroundColor(.white)
                        )
                        .frame(width: 0.6 * cellH * 1.3, height: 0.3 * cellH * 1.3)
                }
                .buttonStyle(PlainButtonStyle())
                .position(x: cellWidth * 0.65, y: cellH * 0.5)
            }
        }
    }
}
