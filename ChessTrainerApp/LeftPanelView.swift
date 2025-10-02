import SwiftUI

struct LeftPanelView: View {
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<8, id: \.self) { index in
                Rectangle()
                    .stroke(Color.black, lineWidth: 1) // контур ячейки
                    .background(Color.clear) // полностью прозрачная
            }
        }
    }
}
