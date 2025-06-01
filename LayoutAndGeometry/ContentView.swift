//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Zoltan Vegh on 30/05/2025.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

        var body: some View {
            GeometryReader { fullView in
                ScrollView(.vertical) {
                    ForEach(0..<50) { index in
                        GeometryReader { proxy in
                            let minY = proxy.frame(in: .global).minY
                            let opacity = max(0, Double((minY - 0) / 200))
                            let scale = max(0.5, minY / fullView.size.height)
                            let hue = min(1.0, max(0, minY / fullView.size.height))
                            
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(Color(hue: hue, saturation: 0.8, brightness: 0.9))
                                .opacity(opacity)
                                .scaleEffect(scale)
                                .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(height: 40)
                    }
                }
            }
        }
}

#Preview {
    ContentView()
}
