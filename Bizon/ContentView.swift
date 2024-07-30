//
//  ContentView.swift
//  Bizon
//
//  Created by Dmytro Neboha on 25.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    @ObservedObject var login = LoginController(Login())
    
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 245/255, blue: 245/255)
                .edgesIgnoringSafeArea(.all)
            Image("logo")
                .scaleEffect(animate ? 4 :1)
                .opacity(animate ? 0 : 1)
                .onAppear{
                    animate.toggle()
                }
                .animation(.easeInOut, value: animate)
            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Text("Вхід в застосунок")
                    .font(.title)
                
                Text("Введіть данні для входу з систему.")
                    .font(.body)
                
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Не зареєстровані?")
                        .foregroundColor(.yellow)
                        .font(.body)
                }
                
                
                if login.errorMessage != "" {
                    Text(login.errorMessage)
                }
                VStack {
                    Section (header: HStack {
                        Text("Електрона пошта")
                        Spacer()
                    }) {
                        TextField("Email", text: $login.login.email)
                            .padding()
                            .keyboardType(.emailAddress)
                            .background(Color.white)
                            .border(Color.gray, width: 1)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    }
                    Section (header: HStack {
                        Text("Пароль")
                        Spacer()
                    }) {
                        SecureField("Password", text: $login.login.password)
                            .padding()
                            .border(Color.gray, width: 1)
                            .background(Color.white)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    }
                    
                    NavigationLink {
                        ForgotPasswordView()
                    } label: {
                        Text("Забули пароль?")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 149/255, green: 157/255, blue: 158/255))
                    }
                    
                    Button(action: {
                        login.processLogin()
                    }){
                        Text("Увійти")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(3)
                            .font(.headline)
                    }
                    .padding(.vertical, 10)
                }
                .padding(.vertical, 10)
                
            }
            .padding()
            .opacity(animate ? 1 : 0)
            .animation(.easeOut.delay(0.15), value: animate)
            .onAppear(perform: {})
            //.embedInNavigationView()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
