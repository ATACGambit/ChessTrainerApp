import SwiftUI

struct BoardLayoutModel {
    let containerSize: CGSize
    
    // Размер квадрата доски
    var boardSize: CGFloat {
        min(containerSize.width, containerSize.height) * 0.8
    }
    
    // Фрейм доски (по центру контейнера)
    var boardFrame: CGRect {
        CGRect(
            x: (containerSize.width - boardSize) / 2,
            y: (containerSize.height - boardSize) / 2,
            width: boardSize,
            height: boardSize
        )
    }
    
    // Левая панель (30% ширины доски, примыкает к доске)
    var leftPanelFrame: CGRect {
        CGRect(
            x: boardFrame.minX - boardSize * 0.3,
            y: boardFrame.minY,
            width: boardSize * 0.3,
            height: boardSize
        )
    }
    
    // Правая панель (30% ширины доски, примыкает к доске)
    var rightPanelFrame: CGRect {
        CGRect(
            x: boardFrame.maxX,
            y: boardFrame.minY,
            width: boardSize * 0.3,
            height: boardSize
        )
    }
}
