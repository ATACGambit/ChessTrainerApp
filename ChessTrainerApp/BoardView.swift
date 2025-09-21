import SwiftUI

struct BoardView: View {
    let cornerRadius: CGFloat = 20

    var body: some View {
        GeometryReader { geo in
            let s2Width = geo.size.width
            let s2Height = geo.size.height
            let squareSize = min(s2Width, s2Height) // квадрат помещается в S2

            ZStack {
                // S2 полностью белая
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)

                // Центральный квадрат с рамкой
                Rectangle()
                    .stroke(Color.black, lineWidth: 2)
                    .background(Rectangle().fill(Color.gray.opacity(0.3)))
                    .frame(width: squareSize, height: squareSize)
            }
            .frame(width: s2Width, height: s2Height)
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .frame(width: 600, height: 400)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
