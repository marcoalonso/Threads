//
//  ProfileThreadFilter.swift
//  Threads
//
//  Created by Marco Alonso Rodriguez on 14/01/24.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    case likes
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        }
    }
    
    var id: Int { return self.rawValue }
}


