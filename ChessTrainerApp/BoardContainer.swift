import SwiftUI

struct BoardContainer: View {
    @StateObject private var boardState = BoardState()
    
    var body: some View {
        GeometryReader { geometry in
            let layout = BoardLayoutModel(containerSize: geometry.size)
            
            ZStack {
                Color.white.ignoresSafeArea() // фон экрана
                
                // Левая панель
                LeftPanelView()
                    .frame(width: layout.leftPanelFrame.width,
                           height: layout.leftPanelFrame.height)
                    .position(x: layout.leftPanelFrame.midX,
                              y: layout.leftPanelFrame.midY)
                    .background(Color.red.opacity(0.3)) // временно для наглядности
                
                // Доска
                BoardView()
                    .frame(width: layout.boardFrame.width,
                           height: layout.boardFrame.height)
                    .position(x: layout.boardFrame.midX,
                              y: layout.boardFrame.midY)
                    .background(Color.blue.opacity(0.3)) // временно для наглядности
                
                // Правая панель
                RightPanelView()
                    .frame(width: layout.rightPanelFrame.width,
                           height: layout.rightPanelFrame.height)
                    .position(x: layout.rightPanelFrame.midX,
                              y: layout.rightPanelFrame.midY)
                    .background(Color.green.opacity(0.3)) // временно для наглядности
            }
        }
    }
}
