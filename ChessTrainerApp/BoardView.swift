import SwiftUI

struct BoardView: View {
    let cornerRadius: CGFloat = 20
    let rows = Array(1...8).reversed()   // для вертикальной нумерации 8-1
    let columns = Array(1...8)           // горизонтальная A-H
    let borderThickness: CGFloat = 20

    var body: some View {
        GeometryReader { geo in
            let s2Width = geo.size.width
            let s2Height = geo.size.height
            let sideP2 = min(s2Width, s2Height)

            ZStack {
                // S2 полностью белая
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)

                // Центральный квадрат P2
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: sideP2, height: sideP2)
                    .overlay(
                        // P2_border + P2_board
                        ZStack {
                            // Рамка для координат
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color.black, lineWidth: borderThickness)
                            
                            // Шахматная доска внутри рамки
                            let boardSize = sideP2 - 2 * borderThickness
                            
                            VStack(spacing: 0) {
                                ForEach(rows, id: \.self) { row in
                                    HStack(spacing: 0) {
                                        ForEach(columns, id: \.self) { col in
                                            Rectangle()
                                                .fill((row + col) % 2 == 0 ? Color.white : Color.black)
                                                .frame(width: boardSize / 8, height: boardSize / 8)
                                        }
                                    }
                                }
                            }
                            .frame(width: boardSize, height: boardSize)
                        }
                        .padding(borderThickness / 2)
                    )
            }
            .frame(width: s2Width, height: s2Height)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .frame(width: 600, height: 600)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
