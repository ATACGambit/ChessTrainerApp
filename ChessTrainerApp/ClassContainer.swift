import SwiftUI

struct ClassContainer<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        GeometryReader { _ in
            ZStack {
                // временно: ничего не рисуем, просто прокидываем контент
                content
            }
        }
    }
}
