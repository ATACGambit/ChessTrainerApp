import SwiftUI

struct ClassView_v1_1_reference: View {
    var body: some View {
        GeometryReader { geometry in
            // Размеры экрана
            let a = geometry.size.width
            let b = geometry.size.height

            // Параметры (можно менять для теста)
            let c: CGFloat = 40   // толщина рамки
            let d: CGFloat = 10   // сдвиг красной зоны от левого края
            let w: CGFloat = 20   // ширина красной зоны
            let e: CGFloat = 10   // отступ сверху/снизу у красной зоны

            ZStack {
                // --- Черная зона (S2) ---
                Rectangle()
                    .fill(Color.black)
                    .frame(width: a - 2*c, height: b - 2*c)
                    .position(x: a/2, y: b/2)

                // --- Красная зона (S3) ---
                Rectangle()
                    .fill(Color.red)
                    .frame(width: w, height: b - 2*(c+e))
                    .position(
                        x: d + w/2,
                        y: b/2
                    )

                // --- Серая рамка (S1 = экран - S2 - S3) ---
                // Рисуем поверх, полупрозрачная
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: a, height: b)
                    .mask(
                        // Вырезаем черную и красную зоны
                        ZStack {
                            Rectangle().frame(width: a, height: b) // всё
                            Rectangle()
                                .frame(width: a - 2*c, height: b - 2*c)
                                .position(x: a/2, y: b/2)
                                .blendMode(.destinationOut)
                            Rectangle()
                                .frame(width: w, height: b - 2*(c+e))
                                .position(x: d + w/2, y: b/2)
                                .blendMode(.destinationOut)
                        }
                        .compositingGroup()
                    )
            }
        }
    }
}

struct ClassView_v1_1_reference_Previews: PreviewProvider {
    static var previews: some View {
        ClassView_v1_1_reference()
    }
}
