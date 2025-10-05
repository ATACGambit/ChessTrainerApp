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
                    // Ячейки 1–8 с одной кнопкой
                    ForEach(1...8, id: \.self) { index in
                        ZStack {
                            let cellH = cellHeight
                            Button(action: {
                                // обработка кнопки index
                            }) {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(buttonColors[index])
                                    .overlay(
                                        Group {
                                            switch index {
                                            case 1:
                                                Image(systemName: "flag")
                                                    .foregroundColor(.white)
                                            case 2:
                                                Image(systemName: "arrow.triangle.2.circlepath")
                                                    .foregroundColor(.white)
                                            case 3:
                                                Image(systemName: "doc.plaintext")
                                                    .foregroundColor(.white)
                                            case 4:
                                                Image(systemName: "eraser")
                                                    .foregroundColor(.white)
                                            case 5:
                                                Image(systemName: "triangle")
                                                    .foregroundColor(.white)
                                            case 6:
                                                Text("Fen-c")
                                                    .foregroundColor(.white)
                                                    .font(.caption)
                                            case 7:
                                                Text("Fen-v")
                                                    .foregroundColor(.white)
                                                    .font(.caption)
                                            case 8:
                                                Image(systemName: "gearshape")
                                                    .foregroundColor(.white)
                                            default:
                                                EmptyView()
                                            }
                                        }
                                    )
                                    .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                            }
                            .position(x: panelWidth * 0.5, y: cellH * 0.5)
                        }
                        .frame(height: cellHeight)
                    }
                }
            }
        }
    }
}
