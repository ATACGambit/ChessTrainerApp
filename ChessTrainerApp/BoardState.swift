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
    // Двумерный массив 8×8, каждая клетка может быть пустой или содержать фигуру
    @Published var board: [[ChessPiece?]] = Array(
        repeating: Array(repeating: nil, count: 8),
        count: 8
    )

    init() {
        resetBoard()
    }

    /// Устанавливает стандартную начальную расстановку фигур
    func resetBoard() {
        board = Array(repeating: Array(repeating: nil, count: 8), count: 8)

        // Пешки
        for i in 0..<8 {
            board[1][i] = .blackPawn
            board[6][i] = .whitePawn
        }

        // Ладьи
        board[0][0] = .blackRook
        board[0][7] = .blackRook
        board[7][0] = .whiteRook
        board[7][7] = .whiteRook

        // Кони
        board[0][1] = .blackKnight
        board[0][6] = .blackKnight
        board[7][1] = .whiteKnight
        board[7][6] = .whiteKnight

        // Слоны
        board[0][2] = .blackBishop
        board[0][5] = .blackBishop
        board[7][2] = .whiteBishop
        board[7][5] = .whiteBishop

        // Ферзи
        board[0][3] = .blackQueen
        board[7][3] = .whiteQueen

        // Короли
        board[0][4] = .blackKing
        board[7][4] = .whiteKing
    }

    /// Получить фигуру по координатам (row, col)
    func pieceAt(row: Int, col: Int) -> ChessPiece? {
        guard row >= 0, row < 8, col >= 0, col < 8 else { return nil }
        return board[row][col]
    }

    /// Установить фигуру по координатам (row, col)
    func setPiece(_ piece: ChessPiece?, at row: Int, col: Int) {
        guard row >= 0, row < 8, col >= 0, col < 8 else { return }
        board[row][col] = piece
    }

    /// Очистить доску
    func clearBoard() {
        board = Array(repeating: Array(repeating: nil, count: 8), count: 8)
    }
}
