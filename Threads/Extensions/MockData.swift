//
//  MockUser.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import Foundation
import Firebase

class MockData {
    static let user = User(id: NSUUID().uuidString, fullname: "Marco Alonso Rodriguez", email: "marco@gmail.com", username: "MarcoAlonso26")
    
    static let thread = Thread(ownerUid: "123", caption: "This is a test thread", timeStamp: Timestamp(), likes: 2)
}
