import SwiftUI

struct ContentView: View {
    @State private var inClass = false
    
    var body: some View {
        ZStack {
            if inClass {
                ClassView(inClass: $inClass)
            } else {
                Image("chess_background")
                    .resizable()
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.1))
                    .ignoresSafeArea()
                
                Button(action: {
                    inClass = true
                }) {
                    Text("Зайти в класс")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}
