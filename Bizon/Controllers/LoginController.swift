//
//  LoginController.swift
//  Bizon
//
//  Created by Serhii Dudik on 30.07.2024.
//

import Foundation

class LoginController: ObservableObject {
    @Published var login: Login
    @Published var errorMessage: String = ""

    var isValid: Bool {
        return validateLogin() && validatePassword()
    }

    init(_ login: Login) {
        self.login = login
    }

    func validateLogin () -> Bool {
        return login.email.isEmpty
    }

    func validatePassword () -> Bool {
        return login.password.count > 6
    }

    func processLogin () {
        errorMessage = ""
        if isValid {
            let defaults = UserDefaults.standard

            Webservice().login(email: login.email, password: login.password) { result in
                switch result {
                case .success(let token):
                    defaults.setValue(token, forKey: "jsonwebtoken")
                    DispatchQueue.main.async {
                        defaults.setValue(true, forKey: "authenticated")
                    }
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        } else {
            errorMessage = "Заповніть форму"
        }
    }
}
