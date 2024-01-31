//
//  AuthService.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 17/01/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var alertItem: AlertItem?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("Debug: Error login user ... \(error.localizedDescription)")
            handleError(error.localizedDescription)
        }
    }
    
    @MainActor
    private func handleError(_ error: String) {
        switch error {
        case "The supplied auth credential is malformed or has expired.":
            self.alertItem = AlertContext.loginError
        case "The password is invalid or the user does not have a password.":
            self.alertItem = AlertContext.passwordInvalid
        case "The email address is badly formatted.":
            self.alertItem = AlertContext.emailInvalidR
        case "The password must be 6 characters long or more.":
            self.alertItem = AlertContext.minimunLenghtPassword
        case "The email address is already in use by another account.":
            self.alertItem = AlertContext.accountInUse
        default:
            self.alertItem = AlertContext.invalidResponse
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("Debug: Error creating user ... \(error.localizedDescription)")
            handleError(error.localizedDescription)
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil // updates routing
        UserService.shared.reset()
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String,
                                fullname: String,
                                username: String,
                                id: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
