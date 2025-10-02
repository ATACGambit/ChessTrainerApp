import SwiftUI

struct LeftPanelView: View {
    var body: some View {
        GeometryReader { geometry in
            let cellHeight = geometry.size.height / 8
            VStack(spacing: 0) {
                // Ячейка 1 - пустая
                Rectangle()
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color.clear)
                    .frame(height: cellHeight)
                
                // Ячейки 2-8 с одной кнопкой в каждой
                ForEach(2...8, id: \.self) { _ in
                    ZStack {
                        Rectangle()
                            .stroke(Color.black, lineWidth: 1)
                            .background(Color.clear)
                        Button(action: {}) {
                            Rectangle()
                                .foregroundColor(.clear)
                        }
                        .aspectRatio(1, contentMode: .fit)
                    }
                    .frame(height: cellHeight)
                }
            }
        }
    }
}
