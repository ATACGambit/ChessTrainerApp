import SwiftUI

struct BoardView: View {
    let rows = Array(1...8).reversed()
    let columns = Array(1...8)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Слой 0 — белая заливка S2
                Color.white
                    .ignoresSafeArea()
                
                // Слой 1 — коричневый квадрат
                let squareSize1 = geometry.size.height
                Rectangle()
                    .fill(Color.brown)
                    .frame(width: squareSize1, height: squareSize1)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                // Слой 2 — серый квадрат
                let squareSize2 = geometry.size.height * 8 / 9
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: squareSize2, height: squareSize2)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
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
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
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
