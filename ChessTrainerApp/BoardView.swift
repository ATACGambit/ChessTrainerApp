import SwiftUI

struct BoardView: View {
    let rows = Array(1...8).reversed()
    let columns = Array(1...8)
    let letters = ["A","B","C","D","E","F","G","H"]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Слой 0 — белая заливка S2
                Color.white
                    .ignoresSafeArea()
                
                // Слой 1 — коричневый квадрат
                let squareSize1 = geometry.size.height
                let centerX = geometry.size.width / 2
                let centerY = geometry.size.height / 2
                Rectangle()
                    .fill(Color.brown)
                    .frame(width: squareSize1, height: squareSize1)
                    .position(x: centerX, y: centerY)
                
                // Слой 2 — серый квадрат
                let squareSize2 = geometry.size.height * 8 / 9
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: squareSize2, height: squareSize2)
                    .position(x: centerX, y: centerY)
                
                // Слой 3 — шахматная доска (А1 черное)
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(columns, id: \.self) { col in
                                Rectangle()
                                    .fill((row + col) % 2 == 1 ? Color.white : Color.black)
                            }
                        }
                    }
                }
                .frame(width: squareSize2, height: squareSize2)
                .position(x: centerX, y: centerY)
                
                // Слой 4 — координаты
                let borderSize = (squareSize1 - squareSize2) / 2
                // Верхняя и нижняя буквы
                HStack(spacing: 0) {
                    ForEach(letters, id: \.self) { letter in
                        Text(letter)
                            .frame(width: squareSize2 / 8, height: borderSize)
                            .foregroundColor(.white)
                    }
                }
                .position(x: centerX, y: centerY - squareSize2 / 2 - borderSize / 2) // верх
                HStack(spacing: 0) {
                    ForEach(letters, id: \.self) { letter in
                        Text(letter)
                            .frame(width: squareSize2 / 8, height: borderSize)
                            .foregroundColor(.white)
                    }
                }
                .position(x: centerX, y: centerY + squareSize2 / 2 + borderSize / 2) // низ
                
                // Левая и правая цифры
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { row in
                        Text("\(row)")
                            .frame(width: borderSize, height: squareSize2 / 8)
                            .foregroundColor(.white)
                    }
                }
                .position(x: centerX - squareSize2 / 2 - borderSize / 2, y: centerY) // слева
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { row in
                        Text("\(row)")
                            .frame(width: borderSize, height: squareSize2 / 8)
                            .foregroundColor(.white)
                    }
                }
                .position(x: centerX + squareSize2 / 2 + borderSize / 2, y: centerY) // справа
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .frame(width: 400, height: 400)
    }
}
