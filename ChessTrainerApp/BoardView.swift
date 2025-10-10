// BoardView.swift
import SwiftUI

struct BoardView: View {
    @ObservedObject var boardState: BoardState

    private let letters = ["A","B","C","D","E","F","G","H"]
    private let rows = Array(1...8).reversed()
    private let columns = Array(1...8)

    // Drag state: идентификация по координатам стартовой клетки
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

                // рамка доски
                Rectangle()
                    .fill(Color(red: 64/255, green: 64/255, blue: 64/255))
                    .frame(width: size, height: size)

                // сетка
                boardGrid(cellSize: cellSize, borderWidth: borderWidth)
                    .frame(width: cellSize * 8, height: cellSize * 8)
                    .position(x: size / 2, y: size / 2)

                // ---- плавающая (перетаскиваемая) копия фигуры поверх всего ----
                if let sr = startRow, let sc = startCol,
                   (1...8).contains(sr), (1...8).contains(sc),
                   let piece = boardState.board[sr - 1][sc - 1] {
                    Image(piece.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: cellSize * 0.9, height: cellSize * 0.9)
                        .position(
                            x: borderWidth + cellSize * (CGFloat(sc - 1) + 0.5),
                            y: borderWidth + cellSize * (CGFloat(8 - sr) + 0.5)
                        )
                        .offset(dragOffset)
                        .zIndex(1000) // всегда поверх
                        .allowsHitTesting(false)
                }
                // ----------------------------------------------------------------

                // координаты
                coordinatesOverlay(size: size, borderWidth: borderWidth, cellSize: cellSize)
            }
            .frame(width: size, height: size)
        }
    }

    // Отрисовка клеток и фигур (без плавающей копии)
    @ViewBuilder
    private func boardGrid(cellSize: CGFloat, borderWidth: CGFloat) -> some View {
        VStack(spacing: 0) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(columns, id: \.self) { col in
                        ZStack {
                            // Клетка
                            Rectangle()
                                .fill((row + col) % 2 == 0
                                      ? Color(red: 174/255, green: 138/255, blue: 104/255)
                                      : Color(red: 236/255, green: 218/255, blue: 185/255))
                                .frame(width: cellSize, height: cellSize)
                                .onTapGesture {
                                    // Если выбрана фигура с панели — ставим её (0-based API)
                                    if let piece = boardState.selectedPanelPiece {
                                        boardState.setPiece(atRow: row - 1, col: col - 1, piece: piece)
                                        boardState.selectedPanelPiece = nil
                                    }
                                }

                            // обычная статичная фигура (скрывается если это та, которую тянут)
                            if let piece = boardState.board[row - 1][col - 1] {
                                Image(piece.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: cellSize * 0.9, height: cellSize * 0.9)
                                    .opacity((startRow == row && startCol == col) ? 0.0 : 1.0)
                                    .highPriorityGesture(dragGesture(forRow: row, col: col, cellSize: cellSize))
                            }

                            // (убрал плавающую копию отсюда — она теперь на верхнем уровне)
                        }
                    }
                }
            }
        }
    }

    // Жест перетаскивания с округлением смещения
    private func dragGesture(forRow row: Int, col: Int, cellSize: CGFloat) -> some Gesture {
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

                // используем округление — 1 клетка = ~1 cellSize
                let dx = Int((value.translation.width / cellSize).rounded())
                let dy = Int((value.translation.height / cellSize).rounded())

                let targetRow = sr - dy
                let targetCol = sc + dx

                boardState.movePiece(fromRow: sr, fromCol: sc, toRow: targetRow, toCol: targetCol)
                resetDrag()
            }
    }

    private func resetDrag() {
        startRow = nil
        startCol = nil
        dragOffset = .zero
    }

    // Координаты (буквы и цифры по краям)
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
