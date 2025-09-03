import SwiftUI

struct StudentsView: View {
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            Text("Экран Ученики")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}
