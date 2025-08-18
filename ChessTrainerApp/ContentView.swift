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
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
