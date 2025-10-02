import SwiftUI

struct BoardView: View {
    let rows = Array(1...8).reversed()
    let columns = Array(1...8)
    let letters = ["A","B","C","D","E","F","G","H"]

    var body: some View {
        GeometryReader { geometry in
            let size = min(geometry.size.width, geometry.size.height)
            let borderWidth = size / 18
            let cellSize = (size - 2 * borderWidth) / 8
            
            ZStack {
                Color.white.ignoresSafeArea()
                
                // рамка для координат
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: size, height: size)
                
                // клетки доски внутри рамки
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(columns, id: \.self) { col in
                                Rectangle()
                                    .fill((row + col) % 2 == 0
                                          ? Color(red: 174/255, green: 138/255, blue: 104/255)
                                          : Color(red: 236/255, green: 218/255, blue: 185/255))
                                    .frame(width: cellSize, height: cellSize)
                            }
                        }
                    }
                }
                .frame(width: cellSize*8, height: cellSize*8)
                .position(x: size/2, y: size/2)
                
                // координаты сверху
                HStack(spacing: 0) {
                    ForEach(letters, id: \.self) { letter in
                        Text(letter)
                            .frame(width: cellSize, height: borderWidth)
                            .foregroundColor(.black)
                    }
                }
                .position(x: size/2, y: borderWidth/2)
                
                // координаты снизу
                HStack(spacing: 0) {
                    ForEach(letters, id: \.self) { letter in
                        Text(letter)
                            .frame(width: cellSize, height: borderWidth)
                            .foregroundColor(.black)
                    }
                }
                .position(x: size/2, y: size - borderWidth/2)
                
                // координаты слева
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { row in
                        Text("\(row)")
                            .frame(width: borderWidth, height: cellSize)
                            .foregroundColor(.black)
                    }
                }
                .position(x: borderWidth/2, y: size/2)
                
                // координаты справа
                VStack(spacing: 0) {
                    ForEach(rows, id: \.self) { row in
                        Text("\(row)")
                            .frame(width: borderWidth, height: cellSize)
                            .foregroundColor(.black)
                    }
                }
                .position(x: size - borderWidth/2, y: size/2)
            }
            .frame(width: size, height: size)
        }
    }
}
