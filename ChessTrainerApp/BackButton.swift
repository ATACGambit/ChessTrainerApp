import SwiftUI

struct BackButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white.opacity(0.8))
                .frame(width: 6, height: 50) // узкая вертикальная кнопка
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton {
            print("Назад нажата")
        }
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.red)
    }
}
