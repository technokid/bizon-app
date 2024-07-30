//
//  ProfileController.swift
//  Bizon
//
//  Created by Serhii Dudik on 30.07.2024.
//

import Foundation

class ProfileController: ObservableObject {
    @Published var profile: Account
    
    init(profile: Account) {
        self.profile = profile
    }

    func signout()
    {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "jsonwebtoken")
        defaults.removeObject(forKey: "authenticated")
    }
}
