import SwiftUI

struct ContentView: View {
    @State private var inClass = false
    
    var body: some View {
        if inClass {
            ClassView()
        } else {
            ZStack {
                Image("chess_background")
                    .resizable()
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.1)) // легкое затемнение
                    .ignoresSafeArea()
                
                Button(action: {
                    inClass = true
                }) {
                    Text("Зайти в класс")
                        .font(.title)
                        .foregroundColor(.white)                 // цвет текста
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color.black.opacity(0.5))   // полупрозрачный фон
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle()) // убирает дефолтный фон Button
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
