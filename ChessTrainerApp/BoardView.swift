import SwiftUI

struct BoardView: View {
    var body: some View {
        Rectangle()
            .fill(Color.yellow.opacity(0.5))
            .aspectRatio(1, contentMode: .fit) // квадрат
    }
}
