import SwiftUI

struct RightPanelView: View {
    let rows = 8
    let columns = 2

    var body: some View {
        GeometryReader { geometry in
            let cellWidth = geometry.size.width / CGFloat(columns)
            let cellHeight = geometry.size.height / CGFloat(rows)

            ZStack {
                Color.clear // полностью прозрачная панель

                VStack(spacing: 0) {
                    ForEach(0..<rows, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<columns, id: \.self) { col in
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 1) // видимые контуры ячеек
                                    .frame(width: cellWidth, height: cellHeight)
                            }
                        }
                    }
                }
            }
        }
    }
}
