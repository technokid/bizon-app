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
        if login.phone.isEmpty {
            return false
        }
        if login.phone.count != 12 {
            return false
        }

        let pattern = "^[0-9]{12}$"

        if let regex = try? NSRegularExpression(pattern: pattern) {
            let range = NSRange(location: 0, length: login.phone.utf16.count)

            if let _ = regex.firstMatch(in: login.phone, options: [], range: range) {
                return true
            }
        }

        return false
    }

    func validatePassword () -> Bool {
        return login.password.count > 6
    }

    func processLogin () {
        errorMessage = ""
        if isValid {
            let defaults = UserDefaults.standard

            Authservice().login(phone: login.phone, password: login.password) { result in
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
