//
//  ContentView.swift
//  Bizon
//
//  Created by Dmytro Neboha on 25.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        ZStack {
            Image("logo")
                .scaleEffect(animate ? 4 :1)
                .opacity(animate ? 0 : 1)
                .onAppear{
                    animate.toggle()
                }
                .animation(.easeInOut, value: animate)

            VStack {
                Form {
                    TextField("Username", text: $loginVM.username)
                    SecureField("Password", text: $loginVM.password)
                    HStack {
                        Spacer()
                        Button("Login") {
                            loginVM.login()
                        }
                        Button("Signout") {
                            loginVM.signout()
                        }
                        .opacity(loginVM.isAuth() ? 1 : 0)
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .opacity(animate ? 1 : 0)
                .animation(.easeOut.delay(0.15), value: animate)
            }
            .onAppear(perform: {})
            .navigationTitle("Login")
                    //.embedInNavigationView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
