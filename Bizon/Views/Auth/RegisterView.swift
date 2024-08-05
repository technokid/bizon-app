//
//  RegisterView.swift
//  Bizon
//
//  Created by Serhii Dudik on 30.07.2024.
//

import Foundation
import SwiftUI


struct RegisterView: View {
    @ObservedObject var register = RegisterController(Register())
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 245/255, blue: 245/255)
                .edgesIgnoringSafeArea(.all)


            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)

                if register.isStep1 {
                    Text("Реєстрація")
                        .font(.title)
                    Text("На вказаний вами номер, буде надіслано код реєстрації")
                        .font(.body)

                    if register.registerError != "" {
                        Text(register.registerError)
                    }
                    VStack {
                        Section (header: HStack {
                            Text("Номер телефону")
                            Spacer()
                        }) {
                            TextField("Введіть номер телефону", text: $register.register.phone)
                                .padding()
                                .keyboardType(.phonePad)
                                .background(Color.white)
                                .border(Color.gray, width: 1)
                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }


                        Button(action: {
                            register.processStep1()
                        }){
                            Text("Продовжити")
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
                } else {
                    Text("Завершення реєстрація")
                        .font(.title)
                    Text("Будь ласка, введіть 4-х значний код відправлений на ваш номер телефону")
                        .font(.body)


                    VStack {
                        Section (header: HStack {
                            Text("Введіть код з смс")
                            Spacer()
                        }) {
                            TextField("Код з смс", text: $register.register.smsCode)
                                .padding()
                                .keyboardType(.phonePad)
                                .background(Color.white)
                                .border(Color.gray, width: 1)
                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                        Section (header: HStack {
                            Text("Ваше імя")
                            Spacer()
                        }) {
                            TextField("Введіть імя", text: $register.register.name)
                                .padding()
                                .keyboardType(.phonePad)
                                .background(Color.white)
                                .border(Color.gray, width: 1)
                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                        Section (header: HStack {
                            Text("Пароль")
                            Spacer()
                        }) {
                            SecureField("Введіть пароль", text: $register.register.password)
                                .padding()
                                .border(Color.gray, width: 1)
                                .background(Color.white)
                                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }


                        Button(action: {
                            register.processStep1()
                        }){
                            Text("Продовжити")
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




            }
            .padding()

            //.embedInNavigationView()
        }
    }
}
