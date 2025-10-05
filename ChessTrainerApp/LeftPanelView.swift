import SwiftUI

struct LeftPanelView: View {
    @State private var buttonColors: [Color] = Array(
        repeating: Color(red: 86/255, green: 177/255, blue: 193/255),
        count: 9
    )

    var body: some View {
        GeometryReader { geometry in
            let panelWidth = geometry.size.width
            let panelHeight = geometry.size.height
            let cellHeight = panelHeight / 8

            VStack(spacing: 0) {
                // Ячейка 1 (флажок)
                ZStack {
                    let cellH = cellHeight
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[1])
                            .overlay(
                                Image(systemName: "flag")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.5)) // менять размер здесь
                            )
                            .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                    }
                    .buttonStyle(.plain)
                    .position(x: panelWidth * 0.5, y: cellH * 0.5)
                }
                .frame(height: cellHeight)

                // Ячейка 2 (стрелки по кругу)
                ZStack {
                    let cellH = cellHeight
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[2])
                            .overlay(
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.5)) // менять размер здесь
                            )
                            .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                    }
                    .buttonStyle(.plain)
                    .position(x: panelWidth * 0.5, y: cellH * 0.5)
                }
                .frame(height: cellHeight)

                // Ячейка 3 (лист)
                ZStack {
                    let cellH = cellHeight
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[3])
                            .overlay(
                                Image(systemName: "doc.plaintext")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.5)) // менять размер здесь
                            )
                            .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                    }
                    .buttonStyle(.plain)
                    .position(x: panelWidth * 0.5, y: cellH * 0.5)
                }
                .frame(height: cellHeight)

                // Ячейка 4 (ластик)
                ZStack {
                    let cellH = cellHeight
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[4])
                            .overlay(
                                Image(systemName: "eraser")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.5)) // менять размер здесь
                            )
                            .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                    }
                    .buttonStyle(.plain)
                    .position(x: panelWidth * 0.5, y: cellH * 0.5)
                }
                .frame(height: cellHeight)

                // Ячейка 5 (треугольник)
                ZStack {
                    let cellH = cellHeight
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[5])
                            .overlay(
                                Image(systemName: "triangle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.5)) // менять размер здесь
                            )
                            .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                    }
                    .buttonStyle(.plain)
                    .position(x: panelWidth * 0.5, y: cellH * 0.5)
                }
                .frame(height: cellHeight)

                // Ячейка 6 ("Fen-c")
                ZStack {
                    let cellH = cellHeight
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[6])
                            .overlay(
                                Text("Fen-c")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.30, weight: .bold)) // менять размер здесь
                            )
                            .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                    }
                    .buttonStyle(.plain)
                    .position(x: panelWidth * 0.5, y: cellH * 0.5)
                }
                .frame(height: cellHeight)

                // Ячейка 7 ("Fen-v")
                ZStack {
                    let cellH = cellHeight
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[7])
                            .overlay(
                                Text("Fen-v")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.30, weight: .bold)) // менять размер здесь
                            )
                            .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                    }
                    .buttonStyle(.plain)
                    .position(x: panelWidth * 0.5, y: cellH * 0.5)
                }
                .frame(height: cellHeight)

                // Ячейка 8 (шестеренка)
                ZStack {
                    let cellH = cellHeight
                    Button(action: {}) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColors[8])
                            .overlay(
                                Image(systemName: "gearshape")
                                    .foregroundColor(.white)
                                    .font(.system(size: cellH * 0.5)) // менять размер здесь
                            )
                            .frame(width: 0.9 * cellH, height: 0.9 * cellH)
                    }
                    .buttonStyle(.plain)
                    .position(x: panelWidth * 0.5, y: cellH * 0.5)
                }
                .frame(height: cellHeight)
            }
        }
    }
}
