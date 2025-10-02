import SwiftUI

struct BoardContainer: View {
    var body: some View {
        HStack {
            LeftPanelView()
                .frame(width: 100)
                .background(Color.gray.opacity(0.3))

            BoardView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue.opacity(0.3))

            RightPanelView()
                .frame(width: 100)
                .background(Color.gray.opacity(0.3))
        }
    }
}
