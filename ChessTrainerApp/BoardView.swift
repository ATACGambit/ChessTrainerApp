import SwiftUI

struct BoardView: View {
    @ObservedObject var boardState: BoardState

    private let letters = ["A","B","C","D","E","F","G","H"]
    private let rows = Array(1...8).reversed() // 8,7,...,1
    private let columns = Array(1...8)         // 1...8

    // Drag state: идентификация по координатам стартовой клетки (1-based)
    @State private var startRow: Int? = nil
    @State private var startCol: Int? = nil
    @State private var dragOffset: CGSize = .zero

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

                // сетка + фигуры (boardGrid возвращает ZStack с клетками и абсолютными фигурами)
                boardGrid(cellSize: cellSize)
                    .frame(width: cellSize * 8, height: cellSize * 8)
                    .position(x: size / 2, y: size / 2)

                // координаты
                coordinatesOverlay(size: size, borderWidth: borderWidth, cellSize: cellSize)
            }
            .frame(width: size, height: size)
        }
    }

    // MARK: - boardGrid: рисуем клетки, потом поверх них абсолютные фигуры
    private func boardGrid(cellSize: CGFloat) -> some View {
        ZStack {
            // 1) Клетки
            VStack(spacing: 0) {
                ForEach(rows, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(columns, id: \.self) { col in
                            Rectangle()
                                .fill((row + col) % 2 == 0
                                      ? Color(red: 174/255, green: 138/255, blue: 104/255)
                                      : Color(red: 236/255, green: 218/255, blue: 185/255))
                                .frame(width: cellSize, height: cellSize)
                        }
                    }
                }
            }

            // 2) Фигуры — абсолютные позиции внутри этой же области (координаты от 0..8*cellSize)
            ForEach(rows, id: \.self) { row in
                ForEach(columns, id: \.self) { col in
                    // boardState.board хранится 0-based: board[row-1][col-1]
                    if let piece = boardState.board[row - 1][col - 1] {
                        Image(piece.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: cellSize * 0.9, height: cellSize * 0.9)
                            // позиционируем внутри области boardGrid: x от 0..8*cellSize
                            .position(
                                x: cellSize * (CGFloat(col - 1) + 0.5),
                                y: cellSize * (CGFloat(8 - row) + 0.5)
                            )
                            // если эта фигура сейчас тянется — покажем её поверх и сдвинем на offset
                            .zIndex((startRow == row && startCol == col) ? 1 : 0)
                            .offset((startRow == row && startCol == col) ? dragOffset : .zero)
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        if startRow == nil {
                                            startRow = row
                                            startCol = col
                                        }
                                        dragOffset = value.translation
                                    }
                                    .onEnded { value in
                                        guard let sr = startRow, let sc = startCol else {
                                            resetDrag()
                                            return
                                        }

                                        // округление: 1 клетка ~= 1 * cellSize
                                        let dx = Int((value.translation.width / cellSize).rounded())
                                        let dy = Int((value.translation.height / cellSize).rounded())

                                        let targetRow = sr - dy    // тянем вниз -> уменьшаем rank
                                        let targetCol = sc + dx    // тянем вправо -> увеличиваем file

                                        boardState.movePiece(fromRow: sr, fromCol: sc,
                                                             toRow: targetRow, toCol: targetCol)

                                        resetDrag()
                                    }
                            )
                    }
                }
            }
        }
    }

    // Сброс состояния перетаскивания
    private func resetDrag() {
        startRow = nil
        startCol = nil
        dragOffset = .zero
    }

    // Координатная рамка (как было)
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
