import SwiftUI

struct ClassView: View {
    @Binding var inClass: Bool  // управление возвратом
    
    var body: some View {
        GeometryReader { geometry in
            let layout = LayoutModel(screenSize: geometry.size)
            
            ClassContainer(layout: layout) {
                // Кнопка "Назад" по центру S3
                BackButton {
                    inClass = false  // возврат на предыдущий экран
                }
                .position(
                    x: layout.s3Frame.midX,
                    y: layout.s3Frame.midY
                )
            }
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    @State static var inClass = true
    
    static var previews: some View {
        ClassView(inClass: $inClass)
    }
}
