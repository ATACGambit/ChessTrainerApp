import SwiftUI

struct RightPanelView: View {
    let rows = 8
    let columns = 2

    // Массив названий файлов изображений для каждой ячейки
    let imageNames: [String] = [
        "white_pawn", "black_pawn",
        "white_knight", "black_knight",
        "white_bishop", "black_bishop",
        "white_rook", "black_rook",
        "white_queen", "black_queen",
        "white_king", "black_king",
        "white_circle", "black_circle",
        "mine", "gift"
    ]

    var body: some View {
        GeometryReader { geometry in
            let cellWidth = geometry.size.width / CGFloat(columns)
            let cellHeight = geometry.size.height / CGFloat(rows)

            ZStack {
                // Внешний контур панели
                Rectangle()
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: geometry.size.width, height: geometry.size.height)

                VStack(spacing: 0) {
                    ForEach(0..<rows, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<columns, id: \.self) { col in
                                let index = row * columns + col
                                if index < imageNames.count {
                                    Image(imageNames[index])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: cellWidth, height: cellHeight)
                                        .onTapGesture {
                                            print("Tapped \(imageNames[index])")
                                            // Здесь можно передавать выбранную фигуру в BoardState
                                        }
                                } else {
                                    Color.clear
                                        .frame(width: cellWidth, height: cellHeight)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
