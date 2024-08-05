//
//  RegisterController.swift
//  Bizon
//
//  Created by Serhii Dudik on 05.08.2024.
//

import Foundation

class RegisterController: ObservableObject {
    @Published var register: Register
    @Published var registerError: String = ""

    var isStep1: Bool {
        return register.verifyToken.isEmpty
    }

    var isValidStep1: Bool {
        return validateStep1()
    }

    init(_ register: Register) {
        self.register = register
    }

    func validateStep1 () -> Bool {
        let phone = String(register.phone)

        if phone.isEmpty {
            return false
        }
        if phone.count != 12 {
            return false
        }

        let pattern = "^[0-9]{12}$"

        if let regex = try? NSRegularExpression(pattern: pattern) {
            let range = NSRange(location: 0, length: phone.utf16.count)

            if let _ = regex.firstMatch(in: phone, options: [], range: range) {
                return true
            }
        }

        return false
    }

    func validatePassword () -> Bool {
        return register.password.count > 6
    }

    func processStep1 () {
        registerError = ""
        if isValidStep1 {

            Authservice().signUp(phone: register.phone) { result in
                switch result {
                case .success(let response):
                    self.register.verifyToken = response.data.token
                case .failure(let error):
                    
                    self.registerError = error.localizedDescription
                }
            }
        } else {
            registerError = "Заповніть форму"
        }
    }
}
