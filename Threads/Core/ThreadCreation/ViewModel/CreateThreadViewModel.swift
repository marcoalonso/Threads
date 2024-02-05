//
//  CreateThreadViewModel.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 05/02/24.
//

import Foundation
import Firebase

class CreateThreadViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timeStamp: Timestamp(), likes: 3)
        try await ThreadService.uploadThread(thread)
    }
}
