import SwiftUI

struct ClassContainer<Content: View>: View {
    let layout: LayoutModel
    let content: Content
    @Binding var inClass: Bool  // управление возвратом

    init(layout: LayoutModel, inClass: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.layout = layout
        self._inClass = inClass
        self.content = content()
    }

    var body: some View {
        ZStack {
            // --- S1: серый фон ---
            Color.gray
                .ignoresSafeArea()
            
            // --- S2: экран с шахматными обоями ---
            Image("chessWallpaper")  // файл в Assets.xcassets
                .resizable()
                .scaledToFill()
                .frame(width: layout.s2Frame.width, height: layout.s2Frame.height)
                .clipShape(RoundedRectangle(cornerRadius: layout.s2CornerRadius))
                .position(x: layout.s2Frame.midX, y: layout.s2Frame.midY)

            // --- S3: красная зона ---
            Rectangle()
                .fill(Color.red)
                .frame(width: layout.s3Frame.width, height: layout.s3Frame.height)
                .position(x: layout.s3Frame.midX, y: layout.s3Frame.midY)
            
            // --- Кнопка "Назад" по центру S3 ---
            BackButton {
                inClass = false
            }
            .position(x: layout.s3Frame.midX, y: layout.s3Frame.midY)
            
            // --- Дополнительный контент внутри контейнера ---
            content
        }
    }
}
