//
//  LoginViewModel.swift
//  Bizon
//
//  Created by Serhii Dudik on 29.07.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    var username: String = ""
    var password: String = ""
    @Published var authenticated: Bool = false

    func login()
    {
        let defaults = UserDefaults.standard
        
        Webservice().login(username: username, password: password) { result in
            switch result {
                case .success(let token):
                    defaults.setValue(token, forKey: "jsonwebtoken")
                    DispatchQueue.main.async {
                        self.authenticated = true
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func signout() 
    {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "jsonwebtoken")
        DispatchQueue.main.async {
            self.authenticated = false
        }
    }

    func isAuth () -> Bool {
        return self.authenticated
    }

}
