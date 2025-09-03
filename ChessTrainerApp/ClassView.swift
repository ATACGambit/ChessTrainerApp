import SwiftUI

struct ClassView: View {
    @Binding var inClass: Bool
    @State private var currentScreen: ScreenType = .classHome

    var body: some View {
        GeometryReader { geometry in
            let layout = LayoutModel(screenSize: geometry.size)
            
            // --- Передаём явный тип Content: EmptyView ---
            ClassContainer<EmptyView>(
                layout: layout,
                inClass: $inClass,
                currentScreen: $currentScreen
            ) {
                EmptyView()
            }
        }
    }
}
