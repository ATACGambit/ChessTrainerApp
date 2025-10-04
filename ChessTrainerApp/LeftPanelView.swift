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

            VStack(spacing: 0) {
                // Ячейка 1 с кнопками 1.1 и 1.2
                ZStack {
                    let cellWidth = panelWidth
                    let cellH = cellHeight
                    // кнопка 1.1
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[0])
                            .overlay(
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.4))
                            )
                            .frame(width: 0.6 * cellH * 1.2, height: 0.3 * cellH)
                    }
                    .position(x: cellWidth * 0.25, y: cellH * 0.5)

                    // кнопка 1.2
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[1])
                            .overlay(
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.4))
                            )
                            .frame(width: 0.6 * cellH * 1.2, height: 0.3 * cellH)
                    }
                    .position(x: cellWidth * 0.75, y: cellH * 0.5)
                }
                .frame(height: cellHeight)

                // Ячейки 2–8
                ForEach(2...8, id: \.self) { index in
                    ZStack {
                        let cellH = cellHeight
                        Button(action: {}) {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(buttonColors[index])
                                .overlay(
                                    symbolForButton(index: index, size: cellH * 0.4)
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

    @ViewBuilder
    private func symbolForButton(index: Int, size: CGFloat) -> some View {
        switch index {
        case 2:
            Image(systemName: "flag.fill")
                .foregroundColor(.white)
                .font(.system(size: size))
        case 3:
            Image(systemName: "arrow.2.circlepath")
                .foregroundColor(.white)
                .font(.system(size: size))
        case 4:
            Image(systemName: "doc.plaintext")
                .foregroundColor(.white)
                .font(.system(size: size))
        case 5:
            Image(systemName: "eraser.fill")
                .foregroundColor(.white)
                .font(.system(size: size))
        case 6:
            Image(systemName: "triangle.fill")
                .foregroundColor(.white)
                .font(.system(size: size))
        case 7:
            Text("FEN")
                .foregroundColor(.white)
                .font(.system(size: size * 0.8, weight: .bold))
        case 8:
            Image(systemName: "gearshape.fill")
                .foregroundColor(.white)
                .font(.system(size: size))
        default:
            EmptyView()
        }
    }
}
