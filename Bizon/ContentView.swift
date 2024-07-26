//
//  ContentView.swift
//  Bizon
//
//  Created by Dmytro Neboha on 25.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Image("logo")
                .scaleEffect(animate ? 4 :1)
                .opacity(animate ? 0 : 1)
                .onAppear{
                    animate.toggle()
                }
                .animation(.easeInOut, value: animate)
            Text("Bizon App")
                .padding()
                .opacity(animate ? 1 : 0)
                .animation(.easeOut.delay(0.15), value: animate)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
