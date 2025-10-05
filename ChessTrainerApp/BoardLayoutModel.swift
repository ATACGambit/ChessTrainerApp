// BoardLayoutModel.swift
import Foundation
import CoreGraphics

struct BoardLayoutModel {
    let containerSize: CGSize

    // Параметры (можно менять)
    private let leftRatio: CGFloat = 0.2   // ширина левой панели = leftRatio * boardSize
    private let rightRatio: CGFloat = 0.3  // ширина правой панели = rightRatio * boardSize
    private let leftMargin: CGFloat = 0.0  // отступ слева (если нужен)

    // --- базовый (желаемый) размер доски (не увеличиваем выше этого) ---
    private var baseBoardSize: CGFloat {
        min(containerSize.width, containerSize.height) * 0.8
    }

    // --- максимальный boardSize по ширине с учётом панелей (решение b * (1+α+β) <= W) ---
    private var maxBoardByWidth: CGFloat {
        containerSize.width / (1.0 + leftRatio + rightRatio)
    }

    // Итоговый размер доски: не больше base, и не больше места по ширине
    var boardSize: CGFloat {
        min(baseBoardSize, maxBoardByWidth)
    }

    // Рамка/бордюр вокруг доски (согласовано с BoardView: borderWidth = size/18)
    var borderWidth: CGFloat { boardSize / 18.0 }

    // Внутренняя игровая площадь (без рамки)
    var innerBoardSize: CGFloat { max(0, boardSize - 2 * borderWidth) }

    // Размер клетки
    var cellSize: CGFloat { innerBoardSize / 8.0 }

    // Ширины боковых панелей (взависимости от итогового boardSize)
    var leftPanelWidth: CGFloat { boardSize * leftRatio }
    var rightPanelWidth: CGFloat { boardSize * rightRatio }

    // Расположение доски: ставим её так, чтобы левая панель была видна (x = leftMargin + leftPanelWidth)
    var boardFrame: CGRect {
        CGRect(
            x: leftMargin + leftPanelWidth,
            y: (containerSize.height - boardSize) / 2.0,
            width: boardSize,
            height: boardSize
        )
    }

    // Левая панель — прижата к leftMargin (обычно 0)
    var leftPanelFrame: CGRect {
        CGRect(
            x: leftMargin,
            y: boardFrame.minY,
            width: leftPanelWidth,
            height: boardSize
        )
    }

    // Правая панель — сразу после правого края доски
    var rightPanelFrame: CGRect {
        CGRect(
            x: boardFrame.maxX,
            y: boardFrame.minY,
            width: rightPanelWidth,
            height: boardSize
        )
    }

    // Верхняя панель — по центру над доской, размер = одна клетка (inner)
    var topPanelFrame: CGRect {
        CGRect(
            x: boardFrame.midX - cellSize / 2.0,
            y: boardFrame.minY - cellSize,
            width: cellSize,
            height: cellSize
        )
    }
}
