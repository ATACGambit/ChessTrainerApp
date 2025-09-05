import SwiftUI

struct BackButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.black)
                .frame(width: 15, height: 125) // увеличено в 2,5 раза
                .shadow(color: .white.opacity(0.3), radius: 3, x: 0, y: 2) // небольшая тень для выделения на черном фоне
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            BackButton {
                print("Назад нажата")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
