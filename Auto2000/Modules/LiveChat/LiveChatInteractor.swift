//
//  LiveChatInteractor.swift
//  Auto2000
//
//  Created by PRO M1 2020 8/256 on 08/08/23.
//

import Foundation

protocol LiveChatInteractor {
    // Define methods for fetching data or performing business logic
    func saveUserData(email: String?, password: String?)
    func checkUserData()
}

class LiveChatInteractorImpl: LiveChatInteractor {
    func saveUserData(email: String?, password: String?) {
        // Implement saving user data here (e.g., to UserDefaults)
        if let email = email, let password = password {
            UserDefaults.standard.set(email, forKey: "userEmail")
            UserDefaults.standard.set(password, forKey: "userPassword")
        }
    }

    func checkUserData() {
        let userEmail = UserDefaults.standard.string(forKey: "userEmail")
        let userPassword = UserDefaults.standard.string(forKey: "userPassword")
        if let email = userEmail, let password = userPassword {
            print("Email: \(email)")
            print("Password: \(password)")
        } else {
            print("Data is not saved yet")
        }
    }

    // Other methods for LiveChatInteractor
    // ...
}
