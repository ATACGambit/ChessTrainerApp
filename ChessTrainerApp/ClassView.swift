import SwiftUI

struct ClassView: View {
    @Binding var inClass: Bool

    var body: some View {
        GeometryReader { geometry in
            let layout = LayoutModel(screenSize: geometry.size)
            
            ClassContainer(layout: layout, inClass: $inClass) {
                // сюда можно добавлять контент внутри ClassContainer
            }
        }
    }
}
