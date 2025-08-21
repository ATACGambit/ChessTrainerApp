import SwiftUI

struct ClassView: View {
    var body: some View {
        ClassContainer {
            GeometryReader { geometry in
                let a = geometry.size.width
                let b = geometry.size.height
                let c: CGFloat = 40
                let w: CGFloat = 20
                let d: CGFloat = 10
                let e: CGFloat = 10
                let r: CGFloat = 20  // радиус скругления

                ZStack {
                    // S1 - серая область
                    Color.gray
                        .ignoresSafeArea()

                    // S2 - черная область
                    RoundedRectangle(cornerRadius: r)
                        .fill(Color.black)
                        .frame(width: a - 2*c, height: b - 2*c)
                        .position(x: a/2, y: b/2)

                    // S3 - красная область
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: w, height: b - 2*(c+e))
                        .position(x: d + w/2, y: b/2)
                }
            }
        }
    }
}

#Preview {
    ClassView()
}
