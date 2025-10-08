import SwiftUI

enum ChessPiece {
    case whitePawn, blackPawn
    case whiteKnight, blackKnight
    case whiteBishop, blackBishop
    case whiteRook, blackRook
    case whiteQueen, blackQueen
    case whiteKing, blackKing
    case whiteCircle, blackCircle
    case mine, gift
}

extension ChessPiece {
    var imageName: String {
        switch self {
        case .whitePawn:   return "white_pawn"
        case .blackPawn:   return "black_pawn"
        case .whiteKnight: return "white_knight"
        case .blackKnight: return "black_knight"
        case .whiteBishop: return "white_bishop"
        case .blackBishop: return "black_bishop"
        case .whiteRook:   return "white_rook"
        case .blackRook:   return "black_rook"
        case .whiteQueen:  return "white_queen"
        case .blackQueen:  return "black_queen"
        case .whiteKing:   return "white_king"
        case .blackKing:   return "black_king"
        case .whiteCircle: return "white_circle"
        case .blackCircle: return "black_circle"
        case .mine:        return "mine"
        case .gift:        return "gift"
        }
    }
}

final class BoardState: ObservableObject {
    @Published var board: [[ChessPiece?]] = Array(
        repeating: Array(repeating: nil, count: 8),
        count: 8
    )

    init() {
        resetBoard()
    }

    /// Устанавливает начальную расстановку:
    /// белые — внизу (board[0], board[1]), чёрные — вверху (board[6], board[7])
    func resetBoard() {
        board = Array(repeating: Array(repeating: nil, count: 8), count: 8)

        // Белые пешки (внизу)
        for i in 0..<8 {
            board[1][i] = .whitePawn
        }

        // Чёрные пешки (вверху)
        for i in 0..<8 {
            board[6][i] = .blackPawn
        }

        // Белые фигуры (нижняя линия — board[0])
        board[0][0] = .whiteRook
        board[0][7] = .whiteRook
        board[0][1] = .whiteKnight
        board[0][6] = .whiteKnight
        board[0][2] = .whiteBishop
        board[0][5] = .whiteBishop
        board[0][3] = .whiteQueen
        board[0][4] = .whiteKing

        // Чёрные фигуры (верхняя линия — board[7])
        board[7][0] = .blackRook
        board[7][7] = .blackRook
        board[7][1] = .blackKnight
        board[7][6] = .blackKnight
        board[7][2] = .blackBishop
        board[7][5] = .blackBishop
        board[7][3] = .blackQueen
        board[7][4] = .blackKing
    }

    func pieceAt(row: Int, col: Int) -> ChessPiece? {
        guard row >= 0, row < 8, col >= 0, col < 8 else { return nil }
        return board[row][col]
    }

    func setPiece(_ piece: ChessPiece?, at row: Int, col: Int) {
        guard row >= 0, row < 8, col >= 0, col < 8 else { return }
        board[row][col] = piece
    }

    func clearBoard() {
        board = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    }
}
