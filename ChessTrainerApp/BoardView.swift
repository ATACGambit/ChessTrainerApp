import SwiftUI

struct BoardView: View {
    @ObservedObject var boardState: BoardState

    private let letters = ["A","B","C","D","E","F","G","H"]
    private let rows = Array(1...8).reversed()
    private let columns = Array(1...8)

    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let borderWidth = size / 18
            let cellSize = (size - 2 * borderWidth) / 8

            ZStack {
                Color.white.ignoresSafeArea()

                // рамка
                Rectangle()
                    .fill(Color(red: 64/255, green: 64/255, blue: 64/255))
                    .frame(width: size, height: size)

                // сетка (вынесена в отдельную функцию)
                boardGrid(cellSize: cellSize)
                    .frame(width: cellSize * 8, height: cellSize * 8)
                    .position(x: size / 2, y: size / 2)

                // координаты (в одном ZStack)
                coordinatesOverlay(size: size, borderWidth: borderWidth, cellSize: cellSize)
            }
            .frame(width: size, height: size)
        }
    }

    @ViewBuilder
    private func boardGrid(cellSize: CGFloat) -> some View {
        VStack(spacing: 0) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(columns, id: \.self) { col in
                        ZStack {
                            Rectangle()
                                .fill((row + col) % 2 == 0
                                      ? Color(red: 174/255, green: 138/255, blue: 104/255)
                                      : Color(red: 236/255, green: 218/255, blue: 185/255))
                                .frame(width: cellSize, height: cellSize)

                            if let piece = boardState.board[row - 1][col - 1] {
                                Image(piece.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: cellSize * 0.9, height: cellSize * 0.9)
                            }
                        }
                    }
                }
            }
        }
    }

    private func coordinatesOverlay(size: CGFloat, borderWidth: CGFloat, cellSize: CGFloat) -> some View {
        ZStack {
            // верх
            HStack(spacing: 0) {
                ForEach(letters, id: \.self) { letter in
                    Text(letter)
                        .frame(width: cellSize, height: borderWidth)
                        .foregroundColor(.white)
                }
            }
            .position(x: size / 2, y: borderWidth / 2)

            // низ
            HStack(spacing: 0) {
                ForEach(letters, id: \.self) { letter in
                    Text(letter)
                        .frame(width: cellSize, height: borderWidth)
                        .foregroundColor(.white)
                }
            }
            .position(x: size / 2, y: size - borderWidth / 2)

            // лево
            VStack(spacing: 0) {
                ForEach(rows, id: \.self) { row in
                    Text("\(row)")
                        .frame(width: borderWidth, height: cellSize)
                        .foregroundColor(.white)
                }
            }
            .position(x: borderWidth / 2, y: size / 2)

            // право
            VStack(spacing: 0) {
                ForEach(rows, id: \.self) { row in
                    Text("\(row)")
                        .frame(width: borderWidth, height: cellSize)
                        .foregroundColor(.white)
                }
            }
            .position(x: size - borderWidth / 2, y: size / 2)
        }
    }
}
