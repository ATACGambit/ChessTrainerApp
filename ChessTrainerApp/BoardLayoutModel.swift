// BoardLayoutModel.swift
import Foundation
import CoreGraphics

struct BoardLayoutModel {
    let containerSize: CGSize
    
    // Размер квадрата доски
    var boardSize: CGFloat {
        min(containerSize.width, containerSize.height) * 0.8
    }
    
    // Размер одной ячейки (используется для TopPanel и для размеров ячеек левой панели)
    var cellSize: CGFloat {
        boardSize / 8.0
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
    
    // Верхняя маленькая панель (квадрат равный одной ячейке, прижат к верху доски по центру)
    var topPanelFrame: CGRect {
        CGRect(
            x: boardFrame.midX - cellSize / 2,
            y: boardFrame.minY - cellSize,
            width: cellSize,
            height: cellSize
        )
    }
    
    // Левая панель (20% ширины доски, примыкает к доске)
    var leftPanelFrame: CGRect {
        CGRect(
            x: boardFrame.minX - boardSize * 0.2,
            y: boardFrame.minY,
            width: boardSize * 0.2,
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
