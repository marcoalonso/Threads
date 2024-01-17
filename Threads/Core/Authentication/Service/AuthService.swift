//
//  AuthService.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
//

import Foundation
import Firebase

class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("User created \(result.user.uid)")
        } catch {
            print("Error creating user ... \(error.localizedDescription)")
        }
    }
}
