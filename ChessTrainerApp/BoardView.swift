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
                    .fill(Color(red: 64/255, green: 64/255, blue: 64/255))
                    .frame(width: squareSize1, height: squareSize1)
                    .position(x: centerX, y: centerY)
                
                // Слой 2 — шахматная доска (А1 черное)
                let squareSize2 = geometry.size.height * 8 / 9
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(columns, id: \.self) { col in
                                Rectangle()
                                    .fill((row + col) % 2 == 1
                                          ? Color(red: 236/255, green: 218/255, blue: 185/255)
                                          : Color(red: 174/255, green: 138/255, blue: 104/255))
                            }
                        }
                    }
                }
                .frame(width: squareSize2, height: squareSize2)
                .position(x: centerX, y: centerY)
                
                // Слой 3 — координаты
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
                
                // Слой 4 — правая панель с 16 ячейками
                let panelWidth = squareSize2 / 3
                let panelHeight = squareSize2
                VStack(spacing: 0) {
                    ForEach(0..<8) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<2) { col in
                                let index = row * 2 + col + 1
                                ZStack {
                                    Rectangle()
                                        .stroke(Color.black, lineWidth: 1)
                                        .background(Color.white)
                                    
                                    Text(cellContent(for: index))
                                        .font(.system(size: panelWidth / 3))
                                }
                                .frame(width: panelWidth / 2, height: panelHeight / 8)
                            }
                        }
                    }
                }
                .position(x: centerX + squareSize2/2 + panelWidth/2 + borderSize, y: centerY)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    
    // Контент для ячеек панели
    func cellContent(for index: Int) -> String {
        switch index {
        case 1: return "♙" // белая пешка
        case 2: return "♟" // черная пешка
        case 3: return "♘" // белый конь
        case 4: return "♞" // черный конь
        case 5: return "♗" // белый слон
        case 6: return "♝" // черный слон
        case 7: return "♖" // белая ладья
        case 8: return "♜" // черная ладья
        case 9: return "♕" // белый ферзь
        case 10: return "♛" // черный ферзь
        case 11: return "♔" // белый король
        case 12: return "♚" // черный король
        case 13: return "●" // круг
        case 14: return "■" // квадрат
        case 15: return "▲" // треугольник
        case 16: return "◆" // ромб
        default: return ""
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .frame(width: 600, height: 400)
    }
}
