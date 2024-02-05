//
//  UserService.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 27/01/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        //fetch data from firebase
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        print("Debug: current user \(user)")
    }
    
    static func fetchUsers() async throws -> [User] {
        /// Identificamos el id del usuario actual
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        /// Obtenemos todos los usuarios
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        /// Se decodifican al model user
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        /// Se filtran y se quita el usuario actual
        return users.filter({ $0.id != currentUid })
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfileIamge(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
}
