//
//  LoginViewModel.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 18/01/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published  var email = ""
    @Published  var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email,
                                      password: password)
    }
}
