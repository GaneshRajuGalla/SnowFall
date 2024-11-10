//
//  ContentView.swift
//  SnowFall
//
//  Created by Ganesh Raju Galla on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Image("snow")
                .resizable()
                .scaledToFill()
            ForEach(0..<10) { _ in
                SnowflakeView()
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                isAnimating = true
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SnowflakeView: View {
    
    @State private var flakeYPosition: CGFloat = -100
    private let flakeSize: CGFloat = CGFloat.random(in: 18...40)
    private let flakeColor: Color = Color(
        red: Double.random(in: 0.6...1),
        green: Double.random(in: 0.7...1),
        blue: Double.random(in: 1...1),
        opacity: Double.random(in: 0.4...0.7)
    )
    private let animationDuration: Double = Double.random(in: 5...12)
    private let flakeXPosition: CGFloat = CGFloat.random(in: 0...UIScreen.main.bounds.width)

    var body: some View {
        Text("❄️")
            .font(.system(size: flakeSize))
            .foregroundColor(flakeColor)
            .position(x: flakeXPosition, y: flakeYPosition)
            .onAppear {
                withAnimation(Animation.linear(duration: animationDuration).repeatForever(autoreverses: false)) {
                    flakeYPosition = UIScreen.main.bounds.height + 50
                }
            }
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
