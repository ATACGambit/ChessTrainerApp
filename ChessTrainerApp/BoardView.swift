import SwiftUI

struct BoardView: View {
    let rows = Array(1...8).reversed() // 8-1 для вертикальных координат
    let columns = Array(1...8)         // 1-8 для горизонтальных координат
    
    var body: some View {
        GeometryReader { geometry in
            let boardSize = min(geometry.size.width, geometry.size.height) * 0.9
            let squareSize = boardSize / 8
            
            VStack(spacing: 0) {
                // Верхняя рамка с горизонтальными координатами
                HStack(spacing: 0) {
                    Spacer().frame(width: squareSize) // пустой угол
                    ForEach(columns, id: \.self) { col in
                        Text(columnLetter(col))
                            .frame(width: squareSize, height: squareSize / 2)
                    }
                    Spacer().frame(width: squareSize) // пустой угол
                }
                
                HStack(spacing: 0) {
                    // Левая вертикальная координата
                    VStack(spacing: 0) {
                        ForEach(rows, id: \.self) { row in
                            Text("\(row)")
                                .frame(width: squareSize / 2, height: squareSize)
                        }
                    }
                    
                    // Сама доска 8x8
                    VStack(spacing: 0) {
                        ForEach(rows, id: \.self) { row in
                            HStack(spacing: 0) {
                                ForEach(columns, id: \.self) { col in
                                    Rectangle()
                                        .fill((row + col) % 2 == 0 ? Color.white : Color.gray)
                                        .frame(width: squareSize, height: squareSize)
                                }
                            }
                        }
                    }
                    
                    // Правая вертикальная координата
                    VStack(spacing: 0) {
                        ForEach(rows, id: \.self) { row in
                            Text("\(row)")
                                .frame(width: squareSize / 2, height: squareSize)
                        }
                    }
                }
                
                // Нижняя рамка с горизонтальными координатами
                HStack(spacing: 0) {
                    Spacer().frame(width: squareSize) // пустой угол
                    ForEach(columns, id: \.self) { col in
                        Text(columnLetter(col))
                            .frame(width: squareSize, height: squareSize / 2)
                    }
                    Spacer().frame(width: squareSize) // пустой угол
                }
            }
            .frame(width: boardSize + squareSize, height: boardSize + squareSize)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
    
    private func columnLetter(_ col: Int) -> String {
        let letters = ["A","B","C","D","E","F","G","H"]
        return letters[col - 1]
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .frame(width: 400, height: 400)
            .background(Color.black.opacity(0.1))
    }
}
