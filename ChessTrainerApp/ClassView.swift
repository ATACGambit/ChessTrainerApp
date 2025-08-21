import SwiftUI

struct ClassView: View {
    var body: some View {
        GeometryReader { geometry in
            let layout = LayoutModel(screenSize: geometry.size)
            ClassContainer(layout: layout) {
                // пока контент пустой, позже добавим кнопки/элементы
            }
        }
    }
}

#Preview {
    ClassView()
}
