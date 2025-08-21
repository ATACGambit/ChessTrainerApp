import SwiftUI

struct LayoutModel {
    let screenSize: CGSize
    
    // MARK: - Черная зона S2
    var s2Frame: CGRect {
        CGRect(
            x: 40,                        // отступ слева
            y: 40,                        // отступ сверху
            width: screenSize.width - 80, // ширина с отступами
            height: screenSize.height - 80 // высота с отступами
        )
    }
    
    var s2CornerRadius: CGFloat { 20 }
    
    // MARK: - Красная зона S3
    var s3Frame: CGRect {
        CGRect(
            x: 10,                        // сдвиг от левого края
            y: 50,                        // сверху (можно настроить)
            width: 20,                     // ширина красной зоны
            height: screenSize.height - 100 // высота с учетом отступов
        )
    }
}
