// RightPanelView.swift
import SwiftUI

struct RightPanelView: View {
    @ObservedObject var boardState: BoardState
    let boardCellSize: CGFloat   // реальный размер клетки доски (передаётся извне)

    private let pieces: [ChessPiece] = [
        .whitePawn,  .blackPawn,
        .whiteKnight, .blackKnight,
        .whiteBishop, .blackBishop,
        .whiteRook,  .blackRook,
        .whiteQueen, .blackQueen,
        .whiteKing,  .blackKing,
        .whiteCircle, .blackCircle,
        .mine, .gift
    ]

    private let rows = 8
    private let columns = 2

    var body: some View {
        GeometryReader { geometry in
            let cellWidth = geometry.size.width / CGFloat(columns)
            let cellHeight = geometry.size.height / CGFloat(rows)
            let imageScale: CGFloat = 0.9
            let imageSize = boardCellSize * imageScale

            ZStack {
                // внешний контур панели
                Rectangle()
                    .stroke(Color.black, lineWidth: 2)

                VStack(spacing: 0) {
                    ForEach(0..<rows, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<columns, id: \.self) { col in
                                let index = row * columns + col
                                if index < pieces.count {
                                    let piece = pieces[index]
                                    ZStack {
                                        // прозрачный фон для кликабельности
                                        Color.clear
                                            .frame(width: cellWidth, height: cellHeight)

                                        Image(piece.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: imageSize, height: imageSize)
                                            .contentShape(Rectangle())
                                    }
                                    .frame(width: cellWidth, height: cellHeight)
                                    .onTapGesture {
                                        // выбрать фигуру из панели (ставится при клике по доске)
                                        boardState.selectedPanelPiece = piece
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
