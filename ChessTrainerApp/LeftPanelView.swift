import SwiftUI

struct LeftPanelView: View {
    // Цвета кнопок можно менять здесь
    @State private var buttonColors: [Color] = Array(
        repeating: Color(red: 86/255, green: 177/255, blue: 193/255),
        count: 9
    )

    var body: some View {
        GeometryReader { geometry in
            let panelWidth = geometry.size.width
            let panelHeight = geometry.size.height
            let cellHeight = panelHeight / 8

            ZStack {
                // Обводка панели
                Rectangle()
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: panelWidth, height: panelHeight)

                VStack(spacing: 0) {
                    // Ячейка 1 с кнопками 1.1 и 1.2
                    ZStack {
                        let cellWidth = panelWidth
                        let cellH = cellHeight
                        // кнопка 1.1
                        Button(action: {
                            // обработка кнопки 1.1
                        }) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(buttonColors[0])
                                .frame(width: 0.6 * cellH * 1.2, height: 0.3 * cellH)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .position(x: cellWidth * 0.25, y: cellH * 0.5)

                        // кнопка 1.2
                        Button(action: {
                            // обработка кнопки 1.2
                        }) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(buttonColors[1])
                                .frame(width: 0.6 * cellH * 1.2, height: 0.3 * cellH)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .position(x: cellWidth * 0.75, y: cellH * 0.5)

                    }
                    .frame(height: cellHeight)

                    // Ячейки 2–8 с одной кнопкой
                    ForEach(2...8, id: \.self) { index in
                        ZStack {
                            let cellH = cellHeight
                            Button(action: {
                                // обработка кнопки index
                            }) {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(buttonColors[index])
                                    .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .position(x: panelWidth * 0.5, y: cellH * 0.5)
                        }
                        .frame(height: cellHeight)
                    }
                }
            }
        }
    }
}
