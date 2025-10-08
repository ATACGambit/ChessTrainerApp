import SwiftUI

struct RightPanelView: View {
    let rows = 8
    let columns = 2
    let boardCellSize: CGFloat // размер клетки доски
    let imageNames = [
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
                Rectangle()
                    .stroke(Color.black, lineWidth: 2) // внешний контур панели

                VStack(spacing: 0) {
                    ForEach(0..<rows, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<columns, id: \.self) { col in
                                let index = row * columns + col
                                if index < imageNames.count {
                                    Image(imageNames[index])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(
                                            width: boardCellSize * 0.9,
                                            height: boardCellSize * 0.9
                                        )
                                        .frame(width: cellWidth, height: cellHeight)
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
