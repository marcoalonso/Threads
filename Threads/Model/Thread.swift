//
//  Thread.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 05/02/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
    let timeStamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
