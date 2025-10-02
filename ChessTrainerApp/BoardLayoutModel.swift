import SwiftUI

struct BoardLayoutModel {
    let size: CGSize
    
    // Левая панель
    var leftPanelWidth: CGFloat {
        size.width * 0.2   // 20% ширины
    }
    
    // Центральная доска (квадрат)
    var boardSize: CGFloat {
        min(size.width * 0.6, size.height * 0.8) // пример: 60% ширины, ограничение по высоте
    }
    
    // Правая панель
    var rightPanelWidth: CGFloat {
        size.width * 0.2   // 20% ширины
    }
}
