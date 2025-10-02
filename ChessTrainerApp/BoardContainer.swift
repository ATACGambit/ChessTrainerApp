import SwiftUI

struct BoardContainer: View {
    @StateObject private var boardState = BoardState()
    
    var body: some View {
        GeometryReader { geometry in
            let layout = BoardLayoutModel(size: geometry.size)
            
            HStack(spacing: 0) {
                // Левая панель
                LeftPanelView()
                    .frame(width: layout.leftPanelWidth, height: geometry.size.height)
                    .background(Color.red.opacity(0.3))
                
                // Центральная доска
                BoardView()
                    .frame(width: layout.boardSize, height: layout.boardSize)
                    .background(Color.blue.opacity(0.3))
                
                // Правая панель
                RightPanelView()
                    .frame(width: layout.rightPanelWidth, height: geometry.size.height)
                    .background(Color.green.opacity(0.3))
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
