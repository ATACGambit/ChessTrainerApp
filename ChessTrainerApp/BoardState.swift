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

    /// Устанавливает начальную позицию:
    /// board[0] — rank 1 (внизу), board[7] — rank 8 (вверху)
    func resetBoard() {
        board = Array(repeating: Array(repeating: nil, count: 8), count: 8)

        // Белые — внизу (rank 1 и 2)
        board[0][0] = .whiteRook;   board[0][7] = .whiteRook
        board[0][1] = .whiteKnight; board[0][6] = .whiteKnight
        board[0][2] = .whiteBishop; board[0][5] = .whiteBishop
        board[0][3] = .whiteQueen;  board[0][4] = .whiteKing
        for i in 0..<8 { board[1][i] = .whitePawn }

        // Чёрные — вверху (rank 8 и 7)
        board[7][0] = .blackRook;   board[7][7] = .blackRook
        board[7][1] = .blackKnight; board[7][6] = .blackKnight
        board[7][2] = .blackBishop; board[7][5] = .blackBishop
        board[7][3] = .blackQueen;  board[7][4] = .blackKing
        for i in 0..<8 { board[6][i] = .blackPawn }
    }

    func clearBoard() {
        board = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    }

    // MARK: - Утилиты (1-based внешне)
    func pieceAt(row: Int, col: Int) -> ChessPiece? {
        guard (1...8).contains(row), (1...8).contains(col) else { return nil }
        return board[row - 1][col - 1]
    }

    func setPiece(_ piece: ChessPiece?, at row: Int, col: Int) {
        guard (1...8).contains(row), (1...8).contains(col) else { return }
        board[row - 1][col - 1] = piece
    }

    func removePiece(at row: Int, col: Int) {
        setPiece(nil, at: row, col: col)
    }

    /// Переместить фигуру (1-based координаты).
    /// Если цель вне диапазона — фигура удаляется (сброшена).
    func movePiece(fromRow: Int, fromCol: Int, toRow: Int, toCol: Int) {
        guard (1...8).contains(fromRow), (1...8).contains(fromCol) else { return }
        let fr = fromRow - 1, fc = fromCol - 1
        let piece = board[fr][fc]
        board[fr][fc] = nil

        if (1...8).contains(toRow), (1...8).contains(toCol) {
            let tr = toRow - 1, tc = toCol - 1
            board[tr][tc] = piece
        } else {
            // удалено за пределами доски
        }
    }
}
